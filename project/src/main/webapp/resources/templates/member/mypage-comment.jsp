<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<jsp:include page="../fragments/head.jsp"/>
<style>
    .active {
        background: orange;
    }

    .tab a:hover {
        background-color: #ffc38f;
    }

    .tab_left {
        border-top-left-radius: 40px;
    }

    .tab_right {
        border-top-right-radius: 40px;
    }
</style>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div class="text-center p-1 container-fluid"
     style="background: url('http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/schedule/top_bgr_n2.png');">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <p class="pl-3 text-light" style="font-size: 60px;">${member.nickname}</p>
            </div>
            <div>
                <img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/member/top_right_img.png">
            </div>
        </div>
    </div>
</div>
<div class="container" id="app">
    <div class="m-auto" style="max-width: 1000px;">
        <div class="row mb-3 tab text-center">
            <a href="/member/mypage?type=bookmark" class="text-decoration-none text-dark border col-4 p-4 themed-grid-col tab_left" style="font-size: 25px;">
                즐겨찾기
            </a>
            <a href="/member/mypage?type=write" class="text-decoration-none text-dark border border-left-0 col-4 p-4 themed-grid-col" style="font-size: 25px;">
                MY작성글
            </a>
            <a href="/member/mypage?type=comment" class="text-decoration-none text-dark border border-left-0 col-4 p-4 themed-grid-col tab_right active" style="font-size: 25px;">
                MY댓글
            </a>
        </div>
    </div>
    <div class="m-5">
        <div class="text-center">
            <p class="h1">MY댓글 <span style="color: orange">{{ totalCount }}</span></p>
        </div>
    </div>
    <div class="mt-3 text-center">
        <div class="d-flex justify-content-center tab row">
            <a class="pl-5 pr-5 pt-4 pb-4 border col-6 border-left-0" :class="{active : category === 'besttip'}" v-on:click="review('besttip', '1')">베스트팁</a>
            <a class="pl-5 pr-5 pt-4 pb-4 border col-6 border-left-0" :class="{active : category === 'community'}" v-on:click="review('community', '1')">커뮤니티</a>
        </div>
    </div>
    <div class="mt-2">
        <table class="table">
            <thead>
            <tr class="text-center">
                <th width="10%" scope="col">No</th>
                <th width="20%" scope="col">메뉴명</th>
                <th width="50%" scope="col">작성글</th>
                <th width="20%" scope="col">작성일</th>
            </tr>
            </thead>
            <tbody>
            <tr class="text-center" v-if="totalCount === 0">
                <td colspan="4">
                    <img src="/image/no-jjim.png" width="300px;" height="200px;">
                    <h3 class="mt-3">내용이 없습니다.</h3>
                </td>
            </tr>
            <tr class="text-center" v-else v-for="vo in review_list">
                <th>{{ vo.no }}</th>
                <td>{{ category }}</td>
                <td class="text-left">{{ vo.content }}</td>
                <td>{{ vo.created_at }}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="mt-5">
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
<jsp:include page="../fragments/footer.jsp"/>
<script>
    new Vue({
        el: '#app',
        data: {
            page: 1,
            category: '',
            totalCount: '',
            totalPage: '',
            isFirst: '',
            isLast: '',
            review_list: []
        },
        mounted: function () {
            this.review('besttip', 1)
        },
        methods: {
            review: function (category, page) {
                let _this = this;
                this.category = category;
                axios.get('/member/mypage/review', {
                    params: {
                        page: page,
                        cate: category
                    }
                }).then(function (response) {
                    console.log(response);
                    _this.review_list = response.data.items;
                    _this.totalCount = response.data.totalItem;
                    _this.page = response.data.page;
                    _this.isFirst= response.data.first;
                    _this.isLast= response.data.last;
                    _this.totalPage = response.data.totalPage;
                })
            },
            nextPage: function () {
                this.page = this.page + 1;
                this.review(this.category, this.page);
            },
            prevPage: function () {
                this.page = this.page - 1;
                this.review(this.category, this.page);
            }
        }
    })
</script>
</body>
</html>
