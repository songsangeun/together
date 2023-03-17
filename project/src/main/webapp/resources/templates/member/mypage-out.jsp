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
                            <a role="button" class="btn btn-lg btn-outline-light" href="#">회원탈퇴</a>
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
                   class="text-decoration-none text-dark border col-4 p-4 themed-grid-col tab_left"
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
        <div class="mt-5">
            <div class="text-center">
                <p class="display-4">회원탈퇴</p>
                <div class="mt-5 mb-5">
                    <h1 class="p-5">
                        투개더 서비스를 이용해주셔서 감사합니다.
                    </h1>
                </div>
                <div class="mt-3 mb-3">
                    <div class="m-auto" style="max-width: 400px;">
                        <div class="row">
                            <button class="btn btn-lg btn-danger btn-block" v-on:click="out()">회원탈퇴</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../fragments/footer.jsp"/>
<script>
    new Vue({
        el: '#app',
        methods: {
            logout: function () {
                axios.post('/member/logout', {
                    headers: {
                        'content-type': 'application/x-www-form-urlencoded'
                    }
                }).then(function () {
                    location.href = '/';
                })
            },
            out: function () {
                let _this = this;
                axios.post('/member/out').then(function () {
                    alert("정상적으로 탈퇴되었습니다.");
                    _this.logout();
                })
            }
        }
    })
</script>
</body>
</html>
