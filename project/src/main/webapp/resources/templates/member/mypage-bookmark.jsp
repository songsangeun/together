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
    .pt-5 {
        padding-top: 6.5rem !important
    }

    .pb-5 {
        padding-bottom: 6.5rem !important
    }
</style>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div id="app">
    <div class="text-center p-1 container-fluid"
         style="background: url('http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/member/top_bgr.jpg');">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center pt-5 pb-5">
                <div>
                    <p class="pl-3 text-light" style="font-size: 60px;">${member.nickname}</p>
                </div>
                <div>
                    <div class="d-flex align-items-center">
                        <div class="mr-3">
                            <a role="button" class="btn btn-lg btn-outline-light" href="/member/mypage/out">회원탈퇴</a>
                        </div>
                        <div>
                            <button class="btn btn-lg btn-outline-light" v-on:click="logout()">로그아웃</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="m-auto" style="max-width: 1000px;">
            <div class="row mb-3 tab text-center">
                <a href="/member/mypage?type=bookmark"
                   class="text-decoration-none text-dark border col-4 p-4 themed-grid-col tab_left active"
                   style="font-size: 25px;">
                    즐겨찾기
                </a>
                <a href="/member/mypage?type=write"
                   class="text-decoration-none text-dark border border-left-0 col-4 p-4 themed-grid-col"
                   style="font-size: 25px;">
                    MY작성글
                </a>
                <a href="/member/mypage?type=comment"
                   class="text-decoration-none text-dark border border-left-0 col-4 p-4 themed-grid-col tab_right"
                   style="font-size: 25px;">
                    MY댓글
                </a>
            </div>
        </div>
        <div class="m-5">
            <div class="text-center">
                <p class="h1">여행지 즐겨찾기 <span style="color: orange">{{ totalCount }}</span></p>
            </div>
        </div>
        <div class="mt-3 text-center">
            <div class="d-flex justify-content-center tab row">
                <a class="pl-5 pr-5 pt-4 pb-4 border" :class="{active : category === 'all'}"
                   v-on:click="bookMark('all')" style="width: 14.285%;">전체</a>
                <a class="pl-5 pr-5 pt-4 pb-4 border border-left-0" :class="{active : category === 'tour'}"
                   v-on:click="bookMark('tour', 1)" style="width: 14.285%;">관광지</a>
                <a class="pl-5 pr-5 pt-4 pb-4 border border-left-0" :class="{active : category === 'food'}"
                   v-on:click="bookMark('food', 1)" style="width: 14.285%;">음식점</a>
                <a class="pl-5 pr-5 pt-4 pb-4 border border-left-0" :class="{active : category === 'house'}"
                   v-on:click="bookMark('house', 1)" style="width: 14.285%;">숙소</a>
                <a class="pl-5 pr-5 pt-4 pb-4 border border-left-0" :class="{active : category === 'camp'}"
                   v-on:click="bookMark('camp', 1)" style="width: 14.285%;">캠핑장</a>
                <a class="pl-5 pr-5 pt-4 pb-4 border border-left-0" :class="{active : category === 'shop'}"
                   v-on:click="bookMark('shop', 1)" style="width: 14.285%;">쇼핑</a>
                <a class="pl-5 pr-5 pt-4 pb-4 border border-left-0" :class="{active : category === 'hotel'}"
                   v-on:click="bookMark('hotel', 1)" style="width: 14.285%;">호텔링</a>
            </div>
        </div>
        <div class="mt-3">
            <!-- v-if -->
            <div class="text-center" v-if="totalCount === 0">
                <div class="p-5">
                    <div class="d-flex justify-content-center">
                        <div class="mt-3">
                            <h3 class="mt-3">즐겨찾기한 목록이 없습니다.</h3>
                        </div>
                    </div>
                </div>
            </div>
            <!-- v-else -->
            <div class="row" v-else>
                <div class="col-md-4" v-for="vo in bookmark_list">
                    <div class="card mb-4 border-0 shadow-sm">
                        <img class="bd-placeholder-img card-img-top" width="100%" height="225" :src="vo.image"/>
                        <div class="card-body mt-2 p-0">
                            <div class="align-items-start">
                                <div>
                                    <p class="m-0 text-dark bold" style="font-size: 17px;">
                                        <small>
                                            <strong>{{ vo.title }}</strong>
                                        </small>
                                    </p>
                                </div>
                                <div class="mt-1">
                                    <span class="text-secondary">{{ vo.subTitle }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mt-5 mb-5">
                <div class="d-flex justify-content-center">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <div>
                                <li class="page-item disabled" v-if="!hasPrev">
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
                                <li class="page-item disabled" v-if="!hasNext">
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
            hasNext: '',
            hasPrev: '',
            bookmark_list: [],
        },
        mounted: function () {
            this.bookMark('all', 1);
        },
        methods: {
            bookMark: function (category, page) {
                let _this = this;
                this.category = category;
                axios.get('/member/mypage/bookmark', {
                    params: {
                        page: page,
                        cate: category
                    }
                }).then(function (response) {
                    console.log(response);
                    _this.bookmark_list = response.data.items;
                    _this.totalCount = response.data.totalItem;
                    _this.page = response.data.page;
                    _this.hasNext = response.data.hasNext;
                    _this.hasPrev = response.data.hasPrev;
                    _this.totalPage = response.data.totalPage;
                })
            },
            nextPage: function () {
                this.page = this.page + 1;
                this.bookMark(this.category, this.page);
            },
            prevPage: function () {
                this.page = this.page - 1;
                this.bookMark(this.category, this.page);
            },
            logout: function () {
                axios.post('/member/logout', {
                    headers: {
                        'content-type': 'application/x-www-form-urlencoded'
                    }
                }).then(function () {
                    location.href = '/';
                })
            }
        }
    })
</script>
</body>
</html>
