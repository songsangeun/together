<%@ page language="java" contentType="text/html; charset=UTF-8" 
		 pageEncoding="UTF-8"%>
<jsp:include page="../fragments/head.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트팁</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<style>
.s21_best_m_top {
    width: 100%;
    background: url(http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/best/top_bgr2.png) top center no-repeat;
    min-height: 300px;
    background-size: 100%;
}
.pr{
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
</style>
<body>
<jsp:include page="../fragments/header.jsp"/>

<div>
<!-- 상단 배너 -->
<div class="s21_best_m_top pr">

	<div class="s21_top_tbox">
	
		<div class="s21_top_tbox_left">
						<h3 class=""><span>베스트팁</span></h3>
						<p class="s21_h3_line_l"></p>
						<p class="s21_h3_text_l">소중한 내반려견과 앞으로 더 잘 지내기 위한 팁을 소개합니다.</p>
						<!--<p class="s21_top_link">
							<a href="?m1Code=tip&m2Code=tip&mode=view&idx=462" class="code_view s21Btn1">
								 <span class="lb">이번주 베스트 팁</span>
								 <i class="ico-arr2"></i>
							</a>						
						</p>//-->


						<form id="frmSetData" name="frmSetData" method="POST" onsubmit="return false;">
							<input type="hidden" id="m2Code" name="m2Code" value="tip">
							<input type="hidden" id="mode" name="mode" value="tiplist">
							<input type="hidden" id="page" name="page" value="0">
						
								<!-- 2021.12.16 s-->
									<div class="s21_tip_select">
						 
											<select name="sch_type" id="sch_type">
												<option value="1">제목</option>
												<option value="2">해시태그</option>
											</select>

											<input type="text" class="s21_tip_select_Input" name="sch_text" id="sch_text" placeholder="검색어를 입력하세요" title=""> 
											<button type="button" class="s21_tip_select_button" onclick="search_go();">검색하기</button>
									</div>
									<!--//2021.12.16 e-->
						</form>


		</div>
					
					
					<div class="s21_top_tbox_right">
						<!-- 계산기 -->
						<div class="s21_top_cal">
<!-- 							<a href="?m1Code=tip&amp;m2Code=dogcal&amp;tab_id=1">
								<div class="s21_top_cal_box">
									<p><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/main/calculator_age.png" alt=""></p>
									<dl>
										<dt>나이 계산기</dt>
										<dd>우리 반려견 사람이라면 몇살일까?</dd>
									</dl>
								</div>
							</a>
							<a href="?m1Code=tip&amp;m2Code=dogcal&amp;tab_id=2">
								<div class="s21_top_cal_box">
									<p><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/main/calculator_cal.png" alt=""></p>
									<dl>
										<dt>칼로리 계산기</dt>
										<dd>내 반려견의 권장칼로리는 얼마?</dd>
									</dl>
								</div>
							</a>
							<a href="?m1Code=tip&amp;m2Code=dogcal&amp;tab_id=3">
								<div class="s21_top_cal_box mgr_0">
									<p><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/main/calculator_fat.png" alt=""></p>
									<dl>
										<dt>비만도 계산기</dt>
										<dd>내 반려견은 비만인걸까? </dd>
									</dl>
								</div>
							</a> -->
						</div>
					<!--// 계산기 -->
					</div>
	</div>

</div>
<!-- 상단 슬라이드 -->



<div class="container">

<!-- 리스트 출력 -->
<div class="s21_tour_list area">

				<!-- 리스트 시작 -->
				<div class="col-3 s21_tour_list_box">
				<a href="#">
								<div class="s21_tour_list_conts pr col-3" v-for="vo in besttip_list">
									<dl class="s21_tour_list_photo">
									<dt>
									<img :src="besttip_list.thumbnail" alt="">
									</dt>
									</dl>
									<div class="s21_tour_list_tbox">
										<h4 class="s21_best_tip">{{vo.title}}</h4>
<!-- 										<div class="s21_desc">
											<div class="s21_d_comment"><p class="icon_comment">댓글</p>8</div>
											<span class="s21_like_nb"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/community/iconN_good.png" alt="좋아요"><span id="yes_str8195">0명</span></span>
									   </div> -->
									</div>
								</div>
				</a>
				</div>
				<!--// 리스트 끝 -->

				<!-- paging s -->
				<div class="s21_page">
					<div class="s21_pagination jquery-paging" id="PageNav">
					<a class=" active">1</a>
					<a class="">2</a>
					<a class="">3</a>
					<a class="">4</a>
					<a class="">5</a>
					<a class="PageNavNext">→</a>
					<a class="">18</a>
					<a class="">»</a>
					</div>
				</div>
				<!--// paging e -->

			</div>

<!-- 본문 내용 끝 -->


</div>
</div>
<jsp:include page="../fragments/footer.jsp"/>

<script>
new Vue({
	el:'.s21_tour_list_box',
	data:{
		besttip_list:[],
		curpage:1,
		totalpage:0,
		startPage:0,
		endPage:0
	},
	mounted:function(){
		let _this=this
		axios.get("/besttip/list_vue.do",{
			params:{
				page:this.curapge,
				bno:this.bno
			}
		}).then(function(response){
			  console.log(response.data)
			  _this.besttip_list=response.data;
			  _this.curpage=response.data[0].curpage
			  _this.totalpage=response.data[0].totalpage
			  _this.startPage=response.data[0].startPage
			  _this.endPage=response.data[0].endPage
		})
	},
	methods:{
        send:function(){
        let _this=this
        axios.get("/besttip/list_vue.do",{
           params:{
              page:this.curpage
           }
        }).then(function(response){
           console.log(response.data)
           _this.besttip_list=response.data
           _this.curpage=response.data[0].curpage
           _this.totalpage=response.data[0].totalpage
           _this.startPage=response.data[0].startPage
           _this.endPage=response.data[0].endPage
        })
     },

	range: function(min,max){
		  let array = [],
		  j = 0;
		  for(let i = min; i <= max; i++){
		    array[j] = i;
		    j++;
		  }
		  return array;
	  },
	  pageChange:function(page){
		  this.curpage=page;
		  this.getData();
	  },
	  find:function(){
		  this.curpage=1;
		  this.getData();
	  },
	  next:function(){
		  this.curpage=this.endPage+1
		  this.getData()
	  },
	  prev:function(){
		  this.curpage=this.startPage-1;
		  this.getData()
	  }
}
})
</script>
</body>
</html>