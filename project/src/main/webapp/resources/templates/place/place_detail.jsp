<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:include page="../fragments/head.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
    <style>
        .subtitle {
            padding-left: 10px;
            font-size: 15px;
            color: #a9a9a9;
        }

        /* 슬라이드 이미지를 감싸는 div의 스타일 */
        #slideshow {
            position: relative;
            width: 100%;
            height: 400px;
            margin: auto;
        }

        /* 각 이미지의 스타일 */
        #slideshow img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        /* 이전/다음 버튼의 스타일 */
        .prev, .next {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            font-size: 30px;
            font-weight: bold;
            padding: 10px;
            cursor: pointer;
        }

        /* 이전 버튼의 위치 */
        .prev {
            left: 0;
        }

        /* 다음 버튼의 위치 */
        .next {
            right: 0;
        }
        .tabs{
            opacity: 1;
            color: #477a7b;
            border-color: #477a7b;
            border-bottom-color: transparent;
            background: #fff;
        }
    </style>
</head>
<script>
    window.onload = function () {
        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementById("slideshow").getElementsByTagName("img");
            if (n > slides.length) {
                slideIndex = 1
            }
            if (n < 1) {
                slideIndex = slides.length
            }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[slideIndex - 1].style.display = "block";
        }

        setInterval(function () {
            plusSlides(1);
        }, 3000);

        // 이전/다음 버튼 이벤트 리스너 추가
        var prevButton = document.getElementsByClassName("prev")[0];
        var nextButton = document.getElementsByClassName("next")[0];
        prevButton.addEventListener("click", function () {
            plusSlides(-1);
        });
        nextButton.addEventListener("click", function () {
            plusSlides(1);
        });
    }
</script>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div class="wrapper row3 rows">
    <main class="container clear">
        <div style="height: 20px"></div>
        <div class="two_third first">
            <table class="table">
                <tr>
                    <td v-for="img in place_detail.image.split(',')" id="slideshow">
                        <img :src="img" style="width: 500px; height: 370px;">
                    </td>
                </tr>

                <!-- 이전/다음 버튼 -->
                <div class="prev" onclick="plusSlides(-1)">&#10094;</div>
                <div class="next" onclick="plusSlides(1)">&#10095;</div>
                <tr>
                    <td colspan="2">
                        <h3><span id="name">{{place_detail.title}}</span>&nbsp;<span class="subtitle">{{place_detail.subtitle}}</span>
                        </h3>
                    </td>
                </tr>
                <tr>
                    <th width=20%>주소</th>
                    <td width=80%>
                        {{place_detail.address}}<br>
                    </td>
                </tr>
                <tr>
                    <th width=20%>전화</th>
                    <td width=80%>{{place_detail.tel}}</td>
                </tr>
                <tr>
                    <th width=20%>홈페이지</th>
                    <td width=80%>{{place_detail.homepage}}</td>
                </tr>
                <tr>
                    <th width=20%>영업시간</th>
                    <td width=80%>{{place_detail.openhour}}</td>
                </tr>
                <tr>
                    <td colspan="2" class="text-right">
                        <a href="javascript:history.back()" class="btn btn-xs btn-danger">목록</a>
                    </td>
                </tr>
            </table>
            <div>
                <b-tabs content-class="mt-3" align="center">
                    <b-tab title="기본정보" active>
                        <tr>
                            <td style="display: flex; flex-direction: column;">
                                <img v-for="content in place_detail.content.split(',')" :src="content" style="width: 100%; padding-bottom: 15px;">
                            </td>
                        </tr>
                    </b-tab>
                    <b-tab title="위치정보">
                        <div class="one_third">
                            <div id="map" style="width:100%;height:350px;"></div>
                        </div>
                    </b-tab>
                    <b-tab title="리뷰">

                    </b-tab>
                </b-tabs>
            </div>
        </div>
    </main>
</div>
<script>
    new Vue({
        el: '.rows',
        data: {
            pno:${pno},
            place_detail: [],
            count: 0
        },
        mounted: function () {
            let _this = this
            axios.get("/place/place_detail_vue.do", {
                params: {
                    pno: _this.pno
                }
            }).then(function (response) {
                console.log(response.data)
                _this.place_detail = response.data

                if(window.kakao && window.kakao.maps)
                {
                    _this.initMap();
                }
                else
                {
                    _this.addScript();
                }
            })
        },
        methods:{
            addScript:function(){
                const script=document.createElement("script")
                // /!* global kakao *!/
                script.onload = () => kakao.maps.load(this.initMap)
                script.src='http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=b18319530b6d6d62d5c86a8807893413&libraries=services'
                document.head.appendChild(script)
            },
            initMap:function(){
                //let name=this.food_detail.name;
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                    mapOption = {
                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };

                // 지도를 생성합니다
                var map = new kakao.maps.Map(mapContainer, mapOption);

                // 주소-좌표 변환 객체를 생성합니다
                var geocoder = new kakao.maps.services.Geocoder();

                // 주소로 좌표를 검색합니다
                geocoder.addressSearch(this.place_detail.address, function(result, status) {

                    // 정상적으로 검색이 완료됐으면
                    if (status === kakao.maps.services.Status.OK) {

                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                        // 결과값으로 받은 위치를 마커로 표시합니다
                        var marker = new kakao.maps.Marker({
                            map: map,
                            position: coords
                        });

                        // 인포윈도우로 장소에 대한 설명을 표시합니다

                        var infowindow = new kakao.maps.InfoWindow({
                            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$('#name').text()+'</div>'
                        });
                        infowindow.open(map, marker);

                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        map.setCenter(coords);
                    }
                });
            }
        }
    })
</script>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>