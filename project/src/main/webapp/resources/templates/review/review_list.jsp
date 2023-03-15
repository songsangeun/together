<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../fragments/head.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰모음</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="js/jquery.js?ver=7"></script>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/functions.js?ver=7"></script>
<script type="text/javascript" src="../js/jquery.fileupload.js"></script>
<script type="text/javascript" src="../js/jquery.paging.js"></script>
<script src="js/swiper-bundle.min.js?ver=7"></script>
<link rel="stylesheet" href="css/swiper-bundle.min.css?ver=7">

<!-- ani -->
<link href="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.css" rel="stylesheet">
<script src="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.js"></script>
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

/* 리뷰 */
.s21_album_desc_bx{
	display: inline-block;
	width: 100%;
	border-bottom: 0px dotted #e8e8e8;
	padding: 0px 0;
}

.s21_album_desc_bx p{
	float: left;
	width: 50px;
	margin-left: 0px;
	text-align: center;
}
/* 작성자 */
.review_list p img{}
.s21_album_desc_bx p img{
	border-radius: 100px;
}
.review_list dl{
	padding-left: 15px;
}
.s21_album_desc_bx dl{
	float: left;
	width: auto;
	height: auto !important;
	border: 0px solid #000
}
.review_list dt{
	font-size: 17px;
	color: #4e4e4e;
	padding-bottom: 5px;
}
.s21_album_desc_bx dt{
	padding: 4px 0;
	text-align: left;
}
.review_list dd{
	font-size: 14px;
	color: #a5a5a5;
}
.s21_album_desc_bx dd{
	text-align: left;
	font-weight: 300;
	padding: 3px 0 0 0;
	line-height: 15px;
}

/* 리뷰 이미지 & 내용 */
.swiper-container{
	margin-left: auto;
	margin-right: auto;
	position: relative;
	overflow: hidden;
	list-style: none;
	padding: 0;
	z-index: 1;
}
.review_btm_bx{
	float: left;
	width: 100%;
	margin: 20px 0 0 0;
}
.review_btm_bx div{
	margin: 0 0 20px 0;
}
.review_btm_bx div img{
	border-radius: 20px;
	max-height: 350px;
	min-height: 350px;
	object-fit: cover;
}
.swiper-slide{
	flext-shrink: 0;
	height: 100%;
	position: relative;
	transition-property: transform;
}
.swiper-slide{
	cursor:pointer;
}
.review_list p img{
	height: 50px;
}
.swiper-wrapper{
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
	display: flex;
	box-sizing: content-box;
}

/* 장소 */
.review_btm_shop{
	boder-radius: 15px;
	background: #f8f7f2;
	border: 1px solid #eeede7;
	padding: 30px 0px 32px 0px;
	text-align: left;
	width: 100%;
	margin: 15px auto 10px auto;
	float: left;
}
.review_btm_shop h4{
	font-size: 20px;
	color: #707070;
	font-weight: 400;
	padding: 0 0 10px 25px;
}
/* a 태그 글자 */
a{
	cursor: pointer;
	color: #666;
	text-decoration: none;
}
.review_btm_shop button{
	border: 0;
	font-weight: 600;
	padding-left: 15px;
	background-size: 15px;
	/* ////////////////////// */
}

/* 좋아요&찜하기 */
.review_btm_shop .s21_sns{
	position: absolute;
	top: 45px;
	right: 15px;
}
.s21_sms{
	text-align: right;
	width: auto;
	float: right;
}

</style>
<body>
<jsp:include page="../fragments/header.jsp"/>
<!-- 상단 배너 -->
<div class="s21_best_m_top pr">

	<div class="s21_top_tbox">
	
		<div class="s21_top_tbox_left">
						<h3 class=""><span>리뷰모음</span></h3>
						<p class="s21_h3_line_l"></p>
						<p class="s21_h3_text_l">내 반려견과 함께 했던 곳을 리뷰해주세요!</p>
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
		
		
			<!-- 하단 리스트 -->
			<div class="s21_event_list area">
				<div class="review_conts">
					<div class="review_list_bx " id="reviewlist"><div class="review_list">
							<div class="s21_album_desc_bx pr">
								<p><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg'"></p>
								<dl>
									<dt>사과돌이</dt>
									<dd>2023.03.12</dd>
								</dl></div>
							<div class="review_btm_bx swiper-container swiper-container-initialized swiper-container-horizontal"><div class="pr swiper-wrapper" id="swiper-wrapper-cfacd3d9666537e3" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);"><p class="swiper-slide swiper-slide-active" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=7083&amp;r_idx=7073'" role="group" aria-label="1 / 1" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202303/M167862294454027220.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202303/M167862294454027220.jpg'"></p></div><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=7083&amp;r_idx=7073'"><a>여기 좋아요 ㅋㅋㅋ 자주 놀러오는 고양이도 있답니다 그냥 여기 사는 것 같기도 해요 ㅋㅋㅋ</a></span>
								<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
							<div class="review_btm_shop pr">
								<h4 onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=7083'"><a>KINFOLKS COFFEE<button type="button">자세히보기</button></a></h4>
								<a><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=7083'">음식점 &gt; 서울특별시 성북구 보국문로 87-22 </span></a>
								<!-- 좋아요/즐겨찾기/공유 : 하트독 여행지정보 상세페이지 우측 부분 처럼 해주세요 s-->
								<div class="s21_sns">
									<a onclick="bookmarkSet(7083,this,'like')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_theart_off2.png" alt="좋아요"></a>
									<a onclick="bookmarkSet(7083,this,'bookmark')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_tstar_off.png" alt="즐겨찾기"></a>
									<!--<img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/ico_snsshare2.png" alt="공유">-->
								</div>
								<!--//좋아요/즐겨찾기/공유 e-->
							</div>
						</div>
				<div class="review_list">
							<div class="s21_album_desc_bx pr">
								<p><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg'"></p>
								<dl>
									<dt>극세수건</dt>
									<dd>2023.03.10</dd>
								</dl></div>
							<div class="review_btm_bx swiper-container swiper-container-initialized swiper-container-horizontal"><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=10757&amp;r_idx=7072'"><a>출렁길(출렁다리)쪽은 반려견 입장 불가이구요 숲속길은 반려견 동반 가능해요</a></span>
								<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
							<div class="review_btm_shop pr">
								<h4 onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=10757'"><a>장성호수변공원<button type="button">자세히보기</button></a></h4>
								<a><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=10757'">관광지 &gt; 전라남도 장성군 장성읍 신흥로 138 </span></a>
								<!-- 좋아요/즐겨찾기/공유 : 하트독 여행지정보 상세페이지 우측 부분 처럼 해주세요 s-->
								<div class="s21_sns">
									<a onclick="bookmarkSet(10757,this,'like')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_theart_off2.png" alt="좋아요"></a>
									<a onclick="bookmarkSet(10757,this,'bookmark')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_tstar_off.png" alt="즐겨찾기"></a>
									<!--<img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/ico_snsshare2.png" alt="공유">-->
								</div>
								<!--//좋아요/즐겨찾기/공유 e-->
							</div>
						</div>
				<div class="review_list">
							<div class="s21_album_desc_bx pr">
								<p><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg'"></p>
								<dl>
									<dt>코기가을</dt>
									<dd>2023.03.04</dd>
								</dl></div>
							<div class="review_btm_bx swiper-container swiper-container-initialized swiper-container-horizontal"><button type="button" class="review_btm_prev swiper-button-disabled" onclick="" tabindex="-1" aria-label="Previous slide" aria-controls="swiper-wrapper-222196bc6537dc94" aria-disabled="true">이전</button>
								<button type="button" class="review_btm_next swiper-button-disabled" onclick="" tabindex="-1" aria-label="Next slide" aria-controls="swiper-wrapper-222196bc6537dc94" aria-disabled="true">다음</button><div class="pr swiper-wrapper" id="swiper-wrapper-4a351212d2e101057" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);"><p class="swiper-slide swiper-slide-active" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=194&amp;r_idx=7071'" role="group" aria-label="1 / 4" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202303/M167785813442365197.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202303/M167785813442365197.jpg'"></p><p class="swiper-slide swiper-slide-next" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=194&amp;r_idx=7071'" role="group" aria-label="2 / 4" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202303/M167785818205235197.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202303/M167785818205235197.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=194&amp;r_idx=7071'" role="group" aria-label="3 / 4" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202303/M167785824817799197.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202303/M167785824817799197.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=194&amp;r_idx=7071'" role="group" aria-label="4 / 4" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202303/M167785882825828197.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202303/M167785882825828197.jpg'"></p></div><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=194&amp;r_idx=7071'"><a>도착하자마자 주차장까지 나와서 너무 친절하게 안내도 해주시고 식사내내 강아지가 식당내에서 너무 자유롭게 있을수 있어서  좋았습니다.<br>
음식도 양이 생각보다 푸짐했고 자연재료를 쓰셔서 그런지 다먹고도 입에 텁텁함 없이 개운해서 좋았습니다<br>
식당다니면서 사람만 먹는게 좀 그랬는데 강아지가 같이 먹을수 있는 음식이 있어 너무좋았습니다<br>
식사내내 이런저런 이야기들로 지루할 틈이 없었고<br>
 밥만먹고 나오는 그런식당이 아니라 힐링이 되는거 같아 남은여행도 즐겁게 하였습니다<br>
제주 또 가면 재방문의사 당연 있습니다^^<br>
원래 후기 거의 안쓰는데 글재주 없는 저도 쓰고싶어지는 가게입니다^^</a></span>
								<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
							<div class="review_btm_shop pr">
								<h4 onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=194'"><a>쉐프1192 레스토랑<button type="button">자세히보기</button></a></h4>
								<a><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=194'">음식점 &gt; 서귀포시 성산읍 환해장성로 465</span></a>
								<!-- 좋아요/즐겨찾기/공유 : 하트독 여행지정보 상세페이지 우측 부분 처럼 해주세요 s-->
								<div class="s21_sns">
									<a onclick="bookmarkSet(194,this,'like')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_theart_off2.png" alt="좋아요"></a>
									<a onclick="bookmarkSet(194,this,'bookmark')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_tstar_off.png" alt="즐겨찾기"></a>
									<!--<img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/ico_snsshare2.png" alt="공유">-->
								</div>
								<!--//좋아요/즐겨찾기/공유 e-->
							</div>
						</div>
				<div class="review_list">
							<div class="s21_album_desc_bx pr">
								<p><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg'"></p>
								<dl>
									<dt>금도끼은도끼</dt>
									<dd>2023.03.02</dd>
								</dl></div>
							<div class="review_btm_bx swiper-container swiper-container-initialized swiper-container-horizontal"><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=89&amp;r_idx=7070'"><a>너무 좋은 리조트. 가성비 최고 경치. 무엇보다도 깨끗한환경 최곱니다. 앞으로 계속 이용할겁니다.</a></span>
								<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
							<div class="review_btm_shop pr">
								<h4 onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=89'"><a>돈내코힐리조트<button type="button">자세히보기</button></a></h4>
								<a><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=89'">숙소 &gt; 서귀포시 상효동 돈내코로 180</span></a>
								<!-- 좋아요/즐겨찾기/공유 : 하트독 여행지정보 상세페이지 우측 부분 처럼 해주세요 s-->
								<div class="s21_sns">
									<a onclick="bookmarkSet(89,this,'like')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_theart_off2.png" alt="좋아요"></a>
									<a onclick="bookmarkSet(89,this,'bookmark')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_tstar_off.png" alt="즐겨찾기"></a>
									<!--<img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/ico_snsshare2.png" alt="공유">-->
								</div>
								<!--//좋아요/즐겨찾기/공유 e-->
							</div>
						</div>
				<div class="review_list">
							<div class="s21_album_desc_bx pr">
								<p><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg'"></p>
								<dl>
									<dt>서눌</dt>
									<dd>2023.02.26</dd>
								</dl></div>
							<div class="review_btm_bx swiper-container swiper-container-initialized swiper-container-horizontal"><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=11191&amp;r_idx=7063'"><a>강아지두마리 데리고 가족여행왔어요.캐리어에안넣고 안고서도 방문가능했고 눈치보는거없이 편하게 커피마시구나왔어요~!음료와 케이크도 맛있었고 카페에서 보이는 바다뷰도 너무 예뻐요^^</a></span>
								<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
							<div class="review_btm_shop pr">
								<h4 onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=11191'"><a>토끼문<button type="button">자세히보기</button></a></h4>
								<a><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=11191'">음식점 &gt; 제주특별자치도 제주시 구좌읍 해맞이해안로 456 </span></a>
								<!-- 좋아요/즐겨찾기/공유 : 하트독 여행지정보 상세페이지 우측 부분 처럼 해주세요 s-->
								<div class="s21_sns">
									<a onclick="bookmarkSet(11191,this,'like')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_theart_off2.png" alt="좋아요"></a>
									<a onclick="bookmarkSet(11191,this,'bookmark')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_tstar_off.png" alt="즐겨찾기"></a>
									<!--<img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/ico_snsshare2.png" alt="공유">-->
								</div>
								<!--//좋아요/즐겨찾기/공유 e-->
							</div>
						</div>
				<div class="review_list">
							<div class="s21_album_desc_bx pr">
								<p><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202212/M167176546619617156.jpg" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg'"></p>
								<dl>
									<dt>사오랑</dt>
									<dd>2023.02.22</dd>
								</dl></div>
							<div class="review_btm_bx swiper-container swiper-container-initialized swiper-container-horizontal"><button type="button" class="review_btm_prev swiper-button-disabled" onclick="" tabindex="-1" aria-label="Previous slide" aria-controls="swiper-wrapper-ba96a634976781074" aria-disabled="true">이전</button>
								<button type="button" class="review_btm_next" onclick="" tabindex="0" aria-label="Next slide" aria-controls="swiper-wrapper-ba96a634976781074" aria-disabled="false">다음</button><div class="pr swiper-wrapper" id="swiper-wrapper-ba96a634976781074" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);"><p class="swiper-slide swiper-slide-active" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=11646&amp;r_idx=7061'" role="group" aria-label="1 / 12" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770624562755176.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770624562755176.jpg'"></p><p class="swiper-slide swiper-slide-next" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=11646&amp;r_idx=7061'" role="group" aria-label="2 / 12" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770625028881176.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770625028881176.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=11646&amp;r_idx=7061'" role="group" aria-label="3 / 12" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770625234173176.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770625234173176.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=11646&amp;r_idx=7061'" role="group" aria-label="4 / 12" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770625364403776.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770625364403776.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=11646&amp;r_idx=7061'" role="group" aria-label="5 / 12" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770625525050076.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770625525050076.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=11646&amp;r_idx=7061'" role="group" aria-label="6 / 12" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770625676803276.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770625676803276.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=11646&amp;r_idx=7061'" role="group" aria-label="7 / 12" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770625898023876.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770625898023876.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=11646&amp;r_idx=7061'" role="group" aria-label="8 / 12" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770626038998076.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770626038998076.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=11646&amp;r_idx=7061'" role="group" aria-label="9 / 12" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770626389097776.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770626389097776.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=11646&amp;r_idx=7061'" role="group" aria-label="10 / 12" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770626686824876.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770626686824876.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=11646&amp;r_idx=7061'" role="group" aria-label="11 / 12" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770627079787876.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770627079787876.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=11646&amp;r_idx=7061'" role="group" aria-label="12 / 12" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770627316686776.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M16770627316686776.jpg'"></p></div><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=11646&amp;r_idx=7061'"><a>사오랑이네 이벤트 당첨 되어서 넘 좋은 기회로 다녀왔습니다<br>
이건 진짜 찐 리뷰 여긴 꼭 가보세요. 특히 부모님들 넘 좋아하실거 같아요. 저도 기와집 한옥 로망이 있어서 그런가 넘 좋았어요. 근데 더 대박은 사장님 센스에요. 울사오랑이  평상시에 쓰는 빗이랑 스파까지 다 있고 치약까지 집에서 쓰는게 있어서 깜짝 놀랬어요.평상시 빗이랑 치약 계단 물 까지 다 챙겨가는데 여긴 그냥 다 있어요 방마다 계단에 커피도 넘좋아하는 브랜드 음료도 주스랑 우유에 시리얼 빵 쨈 계란까지 식당을 5군데나 알아보고 갔는데 커피숍이랑 식당까지 절약되었어요.싸구려 생생내기용이 아닌 진짜 좋은 제품으로 구비하셨어요.그리고 풍경 소리가 진짜 너무 예술인데다 방이 얼마나 따뜻한지 가전이며 주방용품 하나 하나 정성스럽게 고르신거 같았어요.아이들 목욕하는곳도 어느샵 보다도잘 꾸며져있고요.화장실도 넘 맘에 들었어요. 저녁이면 기와 밑으로 전구가<br>
들어와 너무 멋있어요.독채면 살짝 무서울만 한데 입구쪽이랑 <br>
바깥쪽 3군데 cctv가 있어 안심도 되고 펜션뒤로 대나무 숲<br>
이 있어 쭉 살고 싶다는 생각이 절로 듭니다 ㅎㅎ 지금까지 <br>
가본 펜션중에 정말 최고에요. 그리고 애견동반 맛집들이 10분안에 많이 있어요 ㅎㅎ  저희는 늘 돌아다니면서 여행하는거에  진심이라 펜션은 저렴한곳을 택하고 늘 늦게 들어가고 일찍 나와서 펜션은 잠만 자는 곳이란 생각을 했는데 이번 기회로 펜션만 와도 넘 힐링 된다는걸 알았어요 신랑도 너무 좋데요 이런 여행 너무 좋고 펜션 너무 좋다고 고맙데요 ㅎ 이래서 좋은 펜션 가는구나 느꼈습니다.강릉 여행 오신다면 여기 꼭 오세요. 여행의 품격이 달라집니다. 인생 최고의 펜션을 선물해주셔서  감사합니다  너무 너무 행복한 하루였습니다 </a></span>
								<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
							<div class="review_btm_shop pr">
								<h4 onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=11646'"><a>컴페니언 바이 경포<button type="button">자세히보기</button></a></h4>
								<a><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=11646'">숙소 &gt; 강원도 강릉시 경포로371번길 35-22 단독</span></a>
								<!-- 좋아요/즐겨찾기/공유 : 하트독 여행지정보 상세페이지 우측 부분 처럼 해주세요 s-->
								<div class="s21_sns">
									<a onclick="bookmarkSet(11646,this,'like')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_theart_off2.png" alt="좋아요"></a>
									<a onclick="bookmarkSet(11646,this,'bookmark')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_tstar_off.png" alt="즐겨찾기"></a>
									<!--<img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/ico_snsshare2.png" alt="공유">-->
								</div>
								<!--//좋아요/즐겨찾기/공유 e-->
							</div>
						</div>
				<div class="review_list">
							<div class="s21_album_desc_bx pr">
								<p><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg'"></p>
								<dl>
									<dt>예스캔디</dt>
									<dd>2023.02.21</dd>
								</dl></div>
							<div class="review_btm_bx swiper-container swiper-container-initialized swiper-container-horizontal"><button type="button" class="review_btm_prev swiper-button-disabled" onclick="" tabindex="-1" aria-label="Previous slide" aria-controls="swiper-wrapper-fc73f33819803105d" aria-disabled="true">이전</button>
								<button type="button" class="review_btm_next" onclick="" tabindex="0" aria-label="Next slide" aria-controls="swiper-wrapper-fc73f33819803105d" aria-disabled="false">다음</button><div class="pr swiper-wrapper" id="swiper-wrapper-fc73f33819803105d" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);"><p class="swiper-slide swiper-slide-active" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=5190&amp;r_idx=7060'" role="group" aria-label="1 / 4" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696130914689170.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696130914689170.jpg'"></p><p class="swiper-slide swiper-slide-next" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=5190&amp;r_idx=7060'" role="group" aria-label="2 / 4" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696131826518170.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696131826518170.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=5190&amp;r_idx=7060'" role="group" aria-label="3 / 4" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696133438945170.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696133438945170.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=5190&amp;r_idx=7060'" role="group" aria-label="4 / 4" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696137916130170.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696137916130170.jpg'"></p></div><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=5190&amp;r_idx=7060'"><a>2박3일동안 너무 잘쉬다갑니다.<br>
온수풀도 있어서 강아지랑 수영도 따숩게할수있었고 밖에서 바다보면서 커피한잔 하는데 뷰가 너무멋져서 파레사로 하길 잘했다는 생각이들었어요.<br>
단점이라면 추워서 거의 안에서 밥먹는데 아일랜드 식탁의자가 세개밖에 없어서 불편했고 층계가 너무 높아서 강아지가 못올라가고 못내려갑니다. 2박3일동안 안고 오르내리기 좀 무서웠어요. 또 청소기가 없어서 청소기돌리고싶었는데 못돌려서 찝찝했어요.<br>
하지만 방도 따뜻하고 물도 콸콸잘나오고 침구도 깨끗하고 냄새도 너무좋았습니나. 만족한 파레사 풀빌라였어요^^~<br>
<br>
</a></span>
								<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
							<div class="review_btm_shop pr">
								<h4 onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=5190'"><a>파레사 애견풀빌라<button type="button">자세히보기</button></a></h4>
								<a><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=5190'">숙소 &gt; 경상남도 남해군 창선면 동부대로 1974-37 </span></a>
								<!-- 좋아요/즐겨찾기/공유 : 하트독 여행지정보 상세페이지 우측 부분 처럼 해주세요 s-->
								<div class="s21_sns">
									<a onclick="bookmarkSet(5190,this,'like')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_theart_off2.png" alt="좋아요"></a>
									<a onclick="bookmarkSet(5190,this,'bookmark')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_tstar_off.png" alt="즐겨찾기"></a>
									<!--<img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/ico_snsshare2.png" alt="공유">-->
								</div>
								<!--//좋아요/즐겨찾기/공유 e-->
							</div>
						</div>
				<div class="review_list">
							<div class="s21_album_desc_bx pr">
								<p><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg'"></p>
								<dl>
									<dt>예스캔디</dt>
									<dd>2023.02.21</dd>
								</dl></div>
							<div class="review_btm_bx swiper-container swiper-container-initialized swiper-container-horizontal"><button type="button" class="review_btm_prev swiper-button-disabled" onclick="" tabindex="-1" aria-label="Previous slide" aria-controls="swiper-wrapper-556b3455ea18fecc" aria-disabled="true">이전</button>
								<button type="button" class="review_btm_next" onclick="" tabindex="0" aria-label="Next slide" aria-controls="swiper-wrapper-556b3455ea18fecc" aria-disabled="false">다음</button><div class="pr swiper-wrapper" id="swiper-wrapper-556b3455ea18fecc" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);"><p class="swiper-slide swiper-slide-active" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=13089&amp;r_idx=7059'" role="group" aria-label="1 / 5" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696090438649170.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696090438649170.jpg'"></p><p class="swiper-slide swiper-slide-next" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=13089&amp;r_idx=7059'" role="group" aria-label="2 / 5" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696091099467170.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696091099467170.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=13089&amp;r_idx=7059'" role="group" aria-label="3 / 5" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696091720028170.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696091720028170.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=13089&amp;r_idx=7059'" role="group" aria-label="4 / 5" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696092319570170.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696092319570170.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=13089&amp;r_idx=7059'" role="group" aria-label="5 / 5" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696092878332170.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696092878332170.jpg'"></p></div><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=13089&amp;r_idx=7059'"><a>마지막으로 찾아간 애견동반 식당<br>
좀일찍알았다면 2박3일동안 밥먹고 커피마시러 매일 갔을 식당<br>
카레도 맛있고 특히 반려견동반가족들과 일반사람 차별없이 너무친절하게 대해주심~~<br>
독일마을에서 기분나빴는데 여기에서 기분풀고 왔어요^^~<br>
너무좋고 바다뷰도 너무이뻐요.</a></span>
								<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
							<div class="review_btm_shop pr">
								<h4 onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=13089'"><a>하루인일출식당<button type="button">자세히보기</button></a></h4>
								<a><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=13089'">음식점 &gt; 경상남도 남해군 미조면 동부대로 581 </span></a>
								<!-- 좋아요/즐겨찾기/공유 : 하트독 여행지정보 상세페이지 우측 부분 처럼 해주세요 s-->
								<div class="s21_sns">
									<a onclick="bookmarkSet(13089,this,'like')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_theart_off2.png" alt="좋아요"></a>
									<a onclick="bookmarkSet(13089,this,'bookmark')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_tstar_off.png" alt="즐겨찾기"></a>
									<!--<img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/ico_snsshare2.png" alt="공유">-->
								</div>
								<!--//좋아요/즐겨찾기/공유 e-->
							</div>
						</div>
				<div class="review_list">
							<div class="s21_album_desc_bx pr">
								<p><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg'"></p>
								<dl>
									<dt>예스캔디</dt>
									<dd>2023.02.21</dd>
								</dl></div>
							<div class="review_btm_bx swiper-container swiper-container-initialized swiper-container-horizontal"><button type="button" class="review_btm_prev swiper-button-disabled" onclick="" tabindex="-1" aria-label="Previous slide" aria-controls="swiper-wrapper-f10f61cc4cf19d645" aria-disabled="true">이전</button>
								<button type="button" class="review_btm_next" onclick="" tabindex="0" aria-label="Next slide" aria-controls="swiper-wrapper-f10f61cc4cf19d645" aria-disabled="false">다음</button><div class="pr swiper-wrapper" id="swiper-wrapper-f10f61cc4cf19d645" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);"><p class="swiper-slide swiper-slide-active" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=13088&amp;r_idx=7058'" role="group" aria-label="1 / 3" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696036585280170.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696036585280170.jpg'"></p><p class="swiper-slide swiper-slide-next" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=13088&amp;r_idx=7058'" role="group" aria-label="2 / 3" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696038086172170.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696038086172170.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=13088&amp;r_idx=7058'" role="group" aria-label="3 / 3" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696053739210170.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167696053739210170.jpg'"></p></div><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=13088&amp;r_idx=7058'"><a>이렇게 이쁜곳은 애견동반하면 앉지못합니다.<br>
똑같은 돈내고 밖에 앉아야된다는거 킹받아서 포장으로 바꾸어 펜션에서 먹었습니다.딸기있는 사진이 펜션입니다.<br>
이렇게 차별할꺼면 애견동반이라는 말을쓰지말던가요.<br>
선심쓰듯 애견동반이라고하고 막상가니 무슨 나가먹어라 하는 ..반려견 데리고사는게 죄인인가요? </a></span>
								<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
							<div class="review_btm_shop pr">
								<h4 onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=13088'"><a>남해의숲<button type="button">자세히보기</button></a></h4>
								<a><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=13088'">음식점 &gt; 경상남도 남해군 삼동면 독일로 152-8 1층 남해의숲</span></a>
								<!-- 좋아요/즐겨찾기/공유 : 하트독 여행지정보 상세페이지 우측 부분 처럼 해주세요 s-->
								<div class="s21_sns">
									<a onclick="bookmarkSet(13088,this,'like')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_theart_off2.png" alt="좋아요"></a>
									<a onclick="bookmarkSet(13088,this,'bookmark')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_tstar_off.png" alt="즐겨찾기"></a>
									<!--<img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/ico_snsshare2.png" alt="공유">-->
								</div>
								<!--//좋아요/즐겨찾기/공유 e-->
							</div>
						</div>
				<div class="review_list">
							<div class="s21_album_desc_bx pr">
								<p><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202212/M167176546619617156.jpg" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/img/common/login_logoutimg.jpg'"></p>
								<dl>
									<dt>사오랑</dt>
									<dd>2023.02.19</dd>
								</dl></div>
							<div class="review_btm_bx swiper-container swiper-container-initialized swiper-container-horizontal"><button type="button" class="review_btm_prev swiper-button-disabled" onclick="" tabindex="-1" aria-label="Previous slide" aria-controls="swiper-wrapper-4ccfbeeb6757a638" aria-disabled="true">이전</button>
								<button type="button" class="review_btm_next" onclick="" tabindex="0" aria-label="Next slide" aria-controls="swiper-wrapper-4ccfbeeb6757a638" aria-disabled="false">다음</button><div class="pr swiper-wrapper" id="swiper-wrapper-4ccfbeeb6757a638" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);"><p class="swiper-slide swiper-slide-active" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=12493&amp;r_idx=7057'" role="group" aria-label="1 / 4" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167680442896405105.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167680442896405105.jpg'"></p><p class="swiper-slide swiper-slide-next" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=12493&amp;r_idx=7057'" role="group" aria-label="2 / 4" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167680445245036105.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167680445245036105.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=12493&amp;r_idx=7057'" role="group" aria-label="3 / 4" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167680448710885105.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167680448710885105.jpg'"></p><p class="swiper-slide" onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=12493&amp;r_idx=7057'" role="group" aria-label="4 / 4" style="width: 680px;"><img src="http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167680452705061105.jpg/hungryapp/resize/600x600" alt="" onerror="this.src='http://appdata.hungryapp.co.kr/images/hatdog/upload/202302/M167680452705061105.jpg'"></p></div><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',); location.href='?m1Code=review&amp;m2Code=review&amp;idx=12493&amp;r_idx=7057'"><a>하트독에 올라오기전 다녀와서  강아지도 많지 않고 사진 많이 찍고 너무좋았는데 담에 갔더니 기저기 차야한데요ㅠ </a></span>
								<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
							<div class="review_btm_shop pr">
								<h4 onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=12493'"><a>사진정원<button type="button">자세히보기</button></a></h4>
								<a><span onclick="Store.set('rv_m_scroll',document.documentElement.scrollTop); Store.set('rv_m_page','1',);  Store.set('ar_tab','reviewOpen',);  location.href='?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=12493'">음식점 &gt; 강원도 원주시 소초면 황골로 426 </span></a>
								<!-- 좋아요/즐겨찾기/공유 : 하트독 여행지정보 상세페이지 우측 부분 처럼 해주세요 s-->
								<div class="s21_sns">
									<a onclick="bookmarkSet(12493,this,'like')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_theart_off2.png" alt="좋아요"></a>
									<a onclick="bookmarkSet(12493,this,'bookmark')"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/icon_tstar_off.png" alt="즐겨찾기"></a>
									<!--<img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/common/ico_snsshare2.png" alt="공유">-->
								</div>
								<!--//좋아요/즐겨찾기/공유 e-->
							</div>
						</div>
				</div>
						<!-- paging s -->
						<div class="s21_page">
							<div class="s21_pagination jquery-paging" id="PageNav"><a class=" active">1</a><a class="">2</a><a class="">3</a><a class="">4</a><a class="">5</a><a class="PageNavNext">→</a><a class="">381</a><a class="">»</a></div>
						</div>
						<!--// paging e -->
					</div>
			</div>
			<!--// 하단 리스트 -->
			<!--//2022.05.24 e-->

		</div>

		
	</div>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>