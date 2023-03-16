<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<jsp:include page="../fragments/head.jsp"/>
<style>
    .s21_best_m_top {
        width: 100%;
        background: url(http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/best/top_bgr2.png) top center no-repeat;
        min-height: 300px;
        background-size: 100%;
    }

    .pr {
        position: relative;
    }

    .s21_top_tbox {
        width: 1260px;
        margin: 0px auto;
    }

    .s21_top_tbox_left {
        float: left;
        width: 40%;
        text-align: left;
    }

    .s21_top_tbox h3 {
        width: 100%;
        text-align: left;
        color: #fff;
        font-size: 45px;
        font-weight: 300;
        padding: 50px 0 0 0px;
        letter-spacing: -0.03em;
    }

    .s21_top_tbox h3 span {
        color: #fff;
        font-size: 45px;
        font-weight: 400;
    }

    .s21_h3_line_l {
        width: 30px;
        height: 3px;
        background: #fff;
        margin: 15px 10px;
        text-align: left;
    }

    .s21_h3_text_l {
        font-size: 16px;
        color: #fff;
        font-weight: 200;
        opacity: 0.7;
        text-align: left;
        line-height: 26px;
        padding-left: 10px;
        letter-spacing: -0.05em;
    }

    .s21_top_tbox_right {
        float: right;
        width: 58%;
        margin-right: 0%;
    }

    .s21_top_cal {
        float: left;
        width: 97%;
        margin: 20px 0 0 3%;
    }

    .s21_tour_list {
        width: 100%;
        margin: 40px auto 40px auto;
    }

    .area {
        max-width: 1200px ! important;
        min-width: 1260px ! important;
    }

    .s21_tour_list_box {
        width: 100%;
        margin: 0 0% 0 0%;
        border: 0px solid #000;
    }

    a {
        cursor: pointer;
        color: #666;
        text-decoration: none;
    }

    .s21_tour_list_photo dt {
        float: left;
        width: 65.5%;
    }

    .s21_tour_list_conts {
        float: left;
        width: 28%;
        margin: 20px 4.5% 0 0;
        padding: 1%;
        border: 1px solid #fff;
    }

    .s21_tour_list_photo {
        width: 100%;
    }

    .s21_tour_list_photo dt img {
        height: 350px;
    }

    .s21_tour_list_photo img {
        width: 350px;;
    }

    .s21_tour_list_tbox {
        width: 100%;
        margin: 10px 0 0 0;
        display: inline-block;
    }

    .s21_tour_list_tbox h4 {
        height: 30px;
        line-height: 35px;
        font-size: 20px;
        color: #585858;
        text-align: left;
        padding-left: 40px;
        width: 90%;
        font-weight: 500;
        text-overflow: ellipsis;
        word-break: break-all;
        overflow: hidden;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
    }

    .s21_best_tip {
        background: url("http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/best/tip_ico.png") no-repeat;
        background-size: 25px 30px;
    }

    .s21_page {
        width: 100%;
        padding: 30px 0;
        display: inline-block;
        margin-top: 40px;
        margin-left: 0%;
        border-top: 1px solid #ebebeb;
    }

    .s21_pagination {
        display: inline-block;
    }

    .s21_pagination a.active {
        background-color: #333;
        border: 1px solid #333;
        color: #fff;
    }

    .s21_pagination a {
        float: left;
        font-size: 15px;
        padding: 12px 18px;
        text-decoration: none;
        transition: background-color .3s;
        margin: 0 4px;
    }
    .button
    {
    	position: absolute;
    	background-color:#fde5e6;
    	color: #;
    	border:none;
    	border-radius:10px;
		padding: 5px;
    }
    
</style>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div class="s21_best_m_top pr">
    <div class="s21_top_tbox">
        <div class="s21_top_tbox_left">
            <h3 class=""><span>베스트팁</span></h3>
            <p class="s21_h3_line_l"></p>
            <p class="s21_h3_text_l">소중한 내반려견과 앞으로 더 잘 지내기 위한 팁을 소개합니다.</p>
            <form id="frmSetData" name="frmSetData" method="POST" onsubmit="return false;">
                <input type="hidden" id="m2Code" name="m2Code" value="tip">
                <input type="hidden" id="mode" name="mode" value="tiplist">
                <input type="hidden" id="page" name="page" value="0">
                
    				<button type="button" class="button">눈물</button>
                
            </form>
        </div>
    </div>
</div>
<div class="container mt-5" id="app">
    <div class="row">
        <div class="col-md-4 p-3" v-for="vo in besttip_list">
            <a :href="'/besttip?bno=' + vo.bno">
                <div class="card mb-3 border-0 shadow-sm">
                    <img class="bd-placeholder-img card-img-top" width="200" height="230" :src="vo.content">
                    <div class="card-body mt-2 p-0">
                        <p class="card-text text-dark">{{ vo.title }}</p>
                    </div>
                </div>
            </a>
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
<jsp:include page="../fragments/footer.jsp"/>
<script>
    new Vue({
        el: '#app',
        data: {
            page: 1,
            totalCount: '',
            totalPage: '',
            isFirst: '',
            isLast: '',
            besttip_list: []
        },
        mounted: function () {
            this.bestTip(1);
        },
        methods: {
            bestTip: function (page) {
                let _this = this
                axios.get("/besttip/list_vue", {
                    params: {
                        page: page,
                    }
                }).then(function (response) {
                    console.log(response.data)
                    _this.besttip_list = response.data.items;
                    _this.totalCount = response.data.totalItem;
                    _this.page = response.data.page;
                    _this.isFirst = response.data.first;
                    _this.isLast = response.data.last;
                    _this.totalPage = response.data.totalPage;
                })
            },
            nextPage: function () {
                this.page = this.page + 1;
                this.bestTip(this.page);
            },
            prevPage: function () {
                this.page = this.page - 1;
                this.bestTip(this.page);
            }
        }
    })
</script>
</body>
</html>