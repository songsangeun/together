<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<jsp:include page="../templates/fragments/head.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트팁</title>
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
	background-image:url('https://a.cdn-hotels.com/gdcs/production106/d509/18ef0f52-b1cf-4284-b97e-2c763fa1fd1b.jpg?impolicy=fcrop&w=1600&h=1066&q=medium');
} 
.m_box3 {
    display: block;
    width: 100%;
    margin: 15px auto;
    height: 480px;
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
                    <div class="slider_textt">
                        <h3>반려견과 함께하는 <br> <span>일상을 더더욱 다양하게!</span></h3>
                        <p>우리 반려견과 함께하는 플랫폼, <br> 투개더</p>
                        <a href="contact.html" class="boxed-btn4">숙소 둘러보기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- slider_area_end -->

<!-- service_area_start  -->
<div class="service_area">
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
        <!-- 지난주 핫 끝 -->
        
        <!-- 다음줄 시작 -->
        <div class="m_box3 area aos-init aos-animate" data-aos="fade-up">  				
        <div class="m_box_ttlbox">  					
        <h2 class="m_box_ttl">추천하는 <span>장소</span></h2>  					 				
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
        <!-- 다음줄 끝 -->
        
            

    
</div>
</div>
</div>
<!-- footer_start  -->
<jsp:include page="../templates/fragments/footer.jsp"/>
<!-- footer_end  -->
</body>
</html>