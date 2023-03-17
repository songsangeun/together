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
<body class="d-flex flex-column h-100">
<jsp:include page="../fragments/header.jsp"/>
<div class="text-center p-1 container-fluid"
     style="background: url('http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/schedule/top_bgr_n2.png');">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/member/top_left_img.png">
            </div>
            <div class="p-5">
                <h1 class="text-light">
                    <strong class="display-5">투개더 로그인</strong>
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
