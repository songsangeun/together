<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../fragments/head.jsp"/>
<style>
    .accordion {
        background-color: #eee;
        color: #444;
        cursor: pointer;
        padding: 18px;
        width: 100%;
        border: none;
        text-align: left;
        outline: none;
        font-size: 15px;
        transition: 0.4s;
    }

    .active, .accordion:hover {
        background-color: #ccc;
    }

    .panel {
        padding: 0 18px;
        background-color: white;
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.2s ease-out;
    }
    .container{
        margin-top:50px;
    }
    .row{
        margin:0px auto;
        width: 900px;

    }
    h1{
        text-align: center;
    }

    /* Style the links inside the pill navigation menu */
    .pill-nav a {
        display: inline-block;
        color: black;
        text-align: center;
        padding: 14px;
        text-decoration: none;
        font-size: 17px;
        border-radius: 5px;

    }

    /* 마우스 올렸을 때 색상 변경 */
    .pill-nav a:hover {
        background-color: #ddd;
        color: black;
    }

    /* Add a color to the active/current link */
    .pill-nav a.active {
        background-color: dodgerblue;
        color: white;
        text-align: center;
    }
</style>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div class="p-0 container-fluid">
    <div class="text-center"
         style="background: url('http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/best/top_bgr.png')">
        <div class="container">
            <div class="d-flex justify-content-center align-items-center">
                <div class="p-5">
                    <h1 class="text-light">
                        <strong class="display-3 bold">하트독 베스트팁</strong>
                    </h1>
                    <p class="mt-3 text-light">
                        소중한 내반려견과 앞으로 더 잘 지내기 위한 팁을 소개합니다.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container" id="app">
    <div class="p-3 mt-3">
        <div class="text-center">
            <h1>${vo.title}</h1>
        </div>
    </div>
    <div class="mt-3">
        <div class="text-center">
            <div class="p-3">
                <c:forEach items="${images}" var="image">
                    <div class="p-3">
                        <img src="${image}"/>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="p-3">
        <hr class="m-0">
        <div class="mt-3">
            <div class="p-2 text-center">
                <p style="font-size: 20px;">${vo.tag}</p>
            </div>
        </div>
        <hr class="m-0">
    </div>
    <div class="mt-3">
        <div class="m-auto" style="max-width: 800px;">
            <div class="form-group">
                <textarea class="form-control" v-model="content" id="exampleFormControlTextarea1" rows="4"
                          placeholder="댓글을 입력해주세요."></textarea>
                <div class="mt-3 d-flex justify-content-end">
                    <button class="btn btn-outline-secondary" type="button" v-on:click="writeReply()">등록</button>
                </div>
            </div>
            <div class="mt-3" v-for="vo in reply_list">
                <div class="d-flex justify-content-start align-items-center mt-3">
                    <div class="mr-3">
                        {{ vo.writer }}
                    </div>
                    <div class="text-secondary">
                        <small>{{ vo.regDate }}</small>
                    </div>
                </div>
                <div class="mt-3">
                    <p>{{ vo.content }}</p>
                </div>
            </div>
        </div>
        <div class="mt-3 mb-3">
            <div class="d-flex justify-content-center">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <div>
                            <li class="page-item disabled" v-if="isFirst">
                                <button class="page-link" type="button" v-on:click="prevPage()">&laquo;</button>
                            </li>
                            <li class="page-item" v-else>
                                <button class="page-link" type="button" v-on:click="prevPage()">&laquo;</button>
                            </li>
                        </div>
                        <div class="p-2 d-flex justify-content-center">
                            {{ page }} / {{ totalPage }}
                        </div>
                        <div>
                            <li class="page-item disabled" v-if="isLast">
                                <button class="page-link" type="button" v-on:click="nextPage()">&raquo;</button>
                            </li>
                            <li class="page-item" v-else>
                                <button class="page-link" type="button" v-on:click="nextPage()">&raquo;</button>
                            </li>
                        </div>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../fragments/footer.jsp"/>
<script>
    new Vue({
        el: '#app',
        data: {
            bno: '',
            page: '',
            totalCount: '',
            totalPage: '',
            isFirst: '',
            isLast: '',
            content: '',
            reply_list: []
        },
        mounted: function () {
            this.bno = new URLSearchParams(location.search).get('bno');
            this.replyList(1, this.bno);
        },
        methods: {
            replyList: function (page, bno) {
                let _this = this;
                axios.get('/besttip/reply', {
                    params: {
                        bno: bno,
                        page: page
                    }
                }).then(function (response) {
                    console.log(response);
                    _this.reply_list = response.data.items;
                    _this.totalCount = response.data.totalItem;
                    _this.page = response.data.page;
                    _this.isFirst = response.data.first;
                    _this.isLast = response.data.last;
                    _this.totalPage = response.data.totalPage;
                })
            },
            writeReply: function () {
                let _this = this;
                this.bno = new URLSearchParams(location.search).get('bno');
                let data = {
                    bno: this.bno,
                    content: _this.content
                }
                axios.post('/besttip/write', JSON.stringify(data), {
                    headers: {
                        'Content-type': 'application/json'
                    }
                }).then(function () {
                    _this.bno = new URLSearchParams(location.search).get('bno');
                    _this.content = '';
                    _this.replyList(1, _this.bno);
                })
            },
            updateReply: function () {

            },
            deleteReply: function () {

            },
            nextPage: function () {
                this.bno = new URLSearchParams(location.search).get('bno');
                this.page = this.page + 1;
                this.replyList(this.page, this.bno);
            },
            prevPage: function () {
                this.bno = new URLSearchParams(location.search).get('bno');
                this.page = this.page - 1;
                this.replyList(this.page, this.bno);
            }
        }
    })
</script>
</body>
</html>