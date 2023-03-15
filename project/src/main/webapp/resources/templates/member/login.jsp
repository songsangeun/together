<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<jsp:include page="../fragments/head.jsp"/>
<style>
    .login-box {
        top: -20px;
        width: 600px;
        border-radius: 40px;
        background-color: #fff;
        position: relative;
        box-shadow: 1px 1px 1px 1px rgb(207, 207, 207, 0.6);
    }

    .sns-login img {
        width: 110px;
        height: 110px;
        border-radius: 100px;
    }
</style>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div class="p-0 container-fluid">
    <div class="text-center" style="background: url('http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/schedule/top_bgr_n2.png')">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/member/top_left_img.png">
                </div>
                <div class="p-5">
                    <h1 class="text-light">
                        <strong>투개더 로그인</strong>
                    </h1>
                    <p class="text-light mt-3">
                        반려견과 함께 행복한 여행!
                        <br/>
                        투개더 로그인 후 지금 바로 떠나보세요.
                    </p>
                </div>
                <div>
                    <img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/member/top_right_img.png">
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container" id="app">
    <div class="d-flex justify-content-center">
        <div class="login-box">
            <div class="p-5">
                <form>
                    <div class="mb-3">
                        <input type="text" class="form-control form-control-lg" v-model="email" id="email" name="email"
                               placeholder="이메일" autocomplete="off">
                    </div>
                    <div class="mb-3">
                        <input type="password" class="form-control form-control-lg" v-model="password" id="password"
                               name="password" placeholder="비밀번호" autocomplete="off">
                    </div>
                    <div class="mb-3">
                        <small class="text-danger">{{ errorMessage }}</small>
                    </div>
                    <div>
                        <button type="button" class="btn btn-lg btn-primary btn-block" v-on:click="login()">로그인</button>
                    </div>
                </form>
                <hr>
                <div class="text-center">
                    아직 회원이 아니신가요? <a href="/member/signup">회원가입</a>
                </div>
            </div>
        </div>
    </div>
    <div class="d-flex justify-content-center">
        <div class="mb-3">
            <div class="text-center">
                <h1>SNS 간편로그인</h1>
                <p>
                    <small class="text-secondary">※ 별도 회원가입 없이 구글, 네이버, 카카오 계정으로도 로그인이 가능 합니다.</small>
                </p>
                <div class="d-flex justify-content-between mt-4 mb-4">
                    <div class="sns-login">
                        <a href="#">
                            <img src="http://appdata.hungryapp.co.kr/images/hatdog/img/login/icon_sns_g.png" style="background-color: #e16758">
                            <p style="color: #e16758">
                                구글
                            </p>
                        </a>
                    </div>
                    <div class="sns-login">
                        <a href="#">
                            <img src="http://appdata.hungryapp.co.kr/images/hatdog/img/login/icon_sns_n.png" style="background-color: #00d037">
                            <p style="color:#00d037;">
                                네이버
                            </p>
                        </a>
                    </div>
                    <div class="sns-login">
                        <a href="#">
                            <img src="http://appdata.hungryapp.co.kr/images/hatdog/img/login/icon_sns_k.png" style="background-color: #fae100">
                            <p style="color:#fae100;">
                                카카오톡
                            </p>
                        </a>
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
        data: {
            email: '',
            password: '',
            errorMessage: ''
        },
        methods: {
            login: function () {
                let _this = this;
                let email = _this.email;
                let password = _this.password;
                if (email === '') {
                    _this.errorMessage = '아이디(이메일)을 입력해 주세요.'
                    return false;
                }
                if (password === '') {
                    _this.errorMessage = '비밀번호를 입력해 주세요.'
                    return false;
                }
                let params = {
                    email: email,
                    password: password
                }
                axios.post('/member/login', params, {
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    }
                }).then(function () {
                    location.href = '/';
                }).catch(function (error) {
                    _this.errorMessage = error.response.data.message;
                })
            }
        }
    })
</script>
</body>
</html>
