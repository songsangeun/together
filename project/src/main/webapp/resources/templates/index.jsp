<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<jsp:include page="../templates/fragments/head.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투개더</title>
</head>
<style>
.slider_textt h3{
	font-size: 40px;
	color: white;
	font-weight: bold;
}

.slider_textt p{
	font-size: 20px;
	color: white;
	font-weight: bold;
}
   .slider_bg_2{
	background :url("../image/tog_banner1.jpg") no-repeat;
} 
.m_box3 {
    display: block;
    width: 100%;
    margin: 15px auto;
    height: 480px;
}
.secondm_box3{
	display: block;
}
.swiper-wrapper {
    position: relative;
    width: 100%;
    height: 100%;
    z-index: 1;
    display: flex;
    transition-property: transform;
    box-sizing: content-box;
}
.m_list_box {
    width: 31% !important;
    margin: 0 3.2% 0 0;
}
.m_list_box p img {
    width: 100%;
    height: 250px;
    cursor: pointer;
}
.m_box2 {
    display: inline-block;
    width: 100%;
    height: 186px;
    background: url(http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/main/cate_Bgr.png) top center no-repeat;
    margin-bottom: 15px;
}
.category div {
    display: inline-block;
    margin: 0 39px;
    width: 90px;
    color: #7b7971;
    padding-top: 100px;
    text-align: center;
    font-size: 18px;
}
.cate_all {
    width: 90px;
    height: 90px;
    background: url(http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/main/cate_01_off.png) top center no-repeat;
}
.cate_tour {
    width: 90px;
    height: 90px;
    background: url(http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/main/cate_02_off.png) top center no-repeat;
}
.cate_food {
    width: 90px;
    height: 90px;
    background: url(http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/main/cate_03_off.png) top center no-repeat;
}
.cate_room {
    width: 90px;
    height: 90px;
    background: url(http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/main/cate_04_off.png) top center no-repeat;
}
.cate_camping {
    width: 90px;
    height: 90px;
    background: url(http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/main/cate_05_off.png) top center no-repeat;
}
.cate_shop {
    width: 90px;
    height: 90px;
    background: url(http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/main/cate_06_off.png) top center no-repeat;
}
.cate_hotel {
    width: 90px;
    height: 90px;
    background: url(http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/main/cate_07_off.png) top center no-repeat;
}
.service_areaa {
    padding-top: 50px;
    padding-bottom: 106px;
}
</style>
<body>
<!-- header_area_start -->
<jsp:include page="../templates/fragments/header.jsp"/>
<!-- slider_area_start -->
<div class="slider_area">
    <div class="single_slider slider_bg_2 d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-6">
                    <!-- <div class="slider_textt">
                        <h3>반려견과 함께하는 <br> <span>일상을 더더욱 다양하게!</span></h3>
                        <p>우리 반려견과 함께하는 플랫폼, <br> 투개더</p>
                        <a href="contact.html" class="boxed-btn4">숙소 둘러보기</a>
                    </div> -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- slider_area_end -->

<!-- category_area -->
<div class="m_box2 d-flex justify-content-center align-items-center">  				
<div class="category area aos-init aos-animate" data-aos="fade-left" data-aos-delay="400">  					
<a onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info', 'H');">  						
<div class="cate_all">전체</div>  					
</a>  										
<a onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;sch_main_kind=T', 'H');">  						
<div class="cate_tour">관광지</div>  					
</a>  										
<a onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;sch_main_kind=F', 'H');">  						
<div class="cate_food">음식점</div>  					
</a>  										
<a onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;sch_main_kind=H', 'H');">  						
<div class="cate_room">숙소</div>  					
</a>  										
<a onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;sch_main_kind=C', 'H');">  						
<div class="cate_camping">캠핑</div>  					
</a>  										
<a onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;sch_main_kind=S', 'H');">  						
<div class="cate_shop">쇼핑</div>  					
</a>  										
<a onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;sch_main_kind=A', 'H');">  						
<div class="cate_hotel">호텔링</div>  					
</a>  									
</div>  			
</div>
<!-- category_area_end -->
<!-- ㅁㄴㅇ -->
<!-- service_area_start  -->
<div class="service_areaa">
    <div class="container">
        <div class="row justify-content-center">
        <div class="m_box3 area aos-init aos-animate" data-aos="fade-up">
          				
        <div class="m_box_ttlbox">  					
        <h2 class="m_box_ttl">지난주 <span>HOT</span></h2>  					 				
        </div>  			
        <div class="swiper-container swiper_hot swiper-container-initialized swiper-container-horizontal" style="width:100%">  				
        <div class="m_list_wrap pr swiper-wrapper" id="swiper-wrapper-b63ffae40f4243cc" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);">  									
        <div class="m_list_box swiper-slide swiper-slide-active" onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=8242', 'H');" role="group" aria-label="1 / 9" style="width: 420px;">  						
        <p><img src="http://appdata.hungryapp.co.kr/images/hatdog/ar/202108/1628054951_M162805495126346193.jpg/hungryapp/resize/390" alt=""></p>  						
        <dl>  							
        <dt>클램 해운대</dt>  							
        <dd>해운대 오션뷰 펍, 맛과 분위기 모두 만족!</dd>  						
        </dl>  					
        </div>  									
        <div class="m_list_box swiper-slide swiper-slide-next" onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=4950', 'H');" role="group" aria-label="2 / 9" style="width: 420px;">  						
        <p><img src="http://appdata.hungryapp.co.kr/images/hatdog/ar/202302/1676792411_M16767924111779421.jpeg/hungryapp/resize/390" alt=""></p>  						
        <dl>  							
        <dt>신창해물라면와랑식탁</dt>  							
        <dd>술먹은 다음날 먹기좋은 배반하지않는 맛</dd>  						
        </dl>  					
        </div>  									
        <div class="m_list_box swiper-slide" onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=6445', 'H');" role="group" aria-label="3 / 9" style="width: 420px;">  						
        <p><img src="http://appdata.hungryapp.co.kr/images/hatdog/ar/202101/1611642896_M161164289696961222.jpg/hungryapp/resize/390" alt=""></p>  						
        <dl>  							
        <dt>시티스트릿츠</dt>  							
        <dd>모던한 분위기에서 휴식을 즐길 수 있는 곳</dd>  						
        </dl>  					
        </div>  									
        <div class="m_list_box swiper-slide" onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=8071', 'H');" role="group" aria-label="4 / 9" style="width: 420px;">  						
        <p><img src="http://appdata.hungryapp.co.kr/images/hatdog/ar/202107/1627015685_M162701568597273193.jpg/hungryapp/resize/390" alt=""></p>  						
        <dl>  							
        <dt>깡 카페</dt>  							
        <dd>작고 예쁜 분위기의 서귀포시 카페</dd>  						
        </dl>  					
        </div>
        </div>
      </div>
   </div> 
   <!-- 지난주 핫 끝 -->
   
   <!-- 추천하는 장소 시작 -->
   <div class="secondm_box3 area aos-init aos-animate" data-aos="fade-up">  				
        <div class="m_box_ttlbox">  					
        <h2 class="m_box_ttl">추천하는 장소</h2>  					 				
        </div>  			
        <div class="swiper-container swiper_hot swiper-container-initialized swiper-container-horizontal" style="width:100%">  				
        <div class="m_list_wrap pr swiper-wrapper" id="swiper-wrapper-b63ffae40f4243cc" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);">  									
        <div class="m_list_box swiper-slide swiper-slide-active" onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=8242', 'H');" role="group" aria-label="1 / 9" style="width: 420px;">  						
        <p><img src="http://appdata.hungryapp.co.kr/images/hatdog/ar/201807/1530594708_M153059470858026108.jpg/hungryapp/resize/390"></p>  						
        <dl>  							
        <dt>클램 해운대</dt>  							
        <dd>해운대 오션뷰 펍, 맛과 분위기 모두 만족!</dd>  						
        </dl>  					
        </div>  									
        <div class="m_list_box swiper-slide swiper-slide-next" onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=4950', 'H');" role="group" aria-label="2 / 9" style="width: 420px;">  						
        <p><img src="http://appdata.hungryapp.co.kr/images/hatdog/ar/201806/1530178928_M153017892894556108.jpg/hungryapp/resize/390 alt=""></p>  						
        <dl>  							
        <dt>신창해물라면와랑식탁</dt>  							
        <dd>술먹은 다음날 먹기좋은 배반하지않는 맛</dd>  						
        </dl>  					
        </div>  									
        <div class="m_list_box swiper-slide" onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=6445', 'H');" role="group" aria-label="3 / 9" style="width: 420px;">  						
        <p><img src="http://appdata.hungryapp.co.kr/images/hatdog/ar/201803/1521422586_1520073065_노리매05-자체홈페이지.jpg/hungryapp/resize/390"></p>  						
        <dl>  							
        <dt>시티스트릿츠</dt>  							
        <dd>모던한 분위기에서 휴식을 즐길 수 있는 곳</dd>  						
        </dl>  					
        </div>  									
        <div class="m_list_box swiper-slide" onclick="page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;mode=view&amp;idx=8071', 'H');" role="group" aria-label="4 / 9" style="width: 420px;">  						
        <p><img src="http://appdata.hungryapp.co.kr/images/hatdog/ar/201803/1521422501_1519728506_aroma01-자체홈페이지.jpg/hungryapp/resize/390"></p>  						
        <dl>  							
        <dt>깡 카페</dt>  							
        <dd>작고 예쁜 분위기의 서귀포시 카페</dd>  						
        </dl>  					
        </div>
        </div>
        </div>
        </div> 
        <!-- 추천하는 장소 끝 -->
        
        <!-- 이벤트배너 시작 -->
        <div class="m_box5 area aos-init aos-animate" data-aos="fade-up">  				<a onclick="Store.del('ar_scroll');page_move('http://hatdog.co.kr/pc_hatdog/?m1Code=ar_info&amp;m2Code=ar_info&amp;sch_main_kind=C', 'H');"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/main/banner1.png" alt=""></a>  			</div>
		<!-- 이벤트배너 끝 -->
</div>
</div>
</div>
<!-- footer_start  -->
<jsp:include page="../templates/fragments/footer.jsp"/>
<!-- footer_end  -->
</body>
</html>