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
    <script src="https://cdn.jsdelivr.net/npm/vue-infinite-loading@2.4.5/dist/vue-infinite-loading.min.js"></script>
</head>
<style>
    .form-select {
        margin: 10px;
        border: 1px solid #ddd;
        border-radius: 60px;
        padding: 10px 28px;
        width: 140px;
    }

    .s21_sm_search {
        top: -80px;
        width: 100%;
        background: #fff;
        border: 1px solid #f3ebe1;
        border-radius: 40px;
        height: 150px;
        box-shadow: 5px 5px 48px rgb(207 207 207 / 60%);
        -webkit-box-shadow: 5px 5px 48px rgb(207 207 207 / 60%);
        -moz-box-shadow: 5px 5px 48px rgba(207, 207, 207, 0.6);
    }

    .s21_SearchInput {
        margin: 10px;
        border: 1px solid #ddd;
        border-radius: 60px;
        padding: 10px 28px;
    }

    .s21_tour_search_button {
        padding: 10px 17px;
        color: #fff;
        margin: 10px;
        background: #477A7B;
        text-decoration: none;
        border: 1px solid #E0E0E0;
        border-radius: 60px;
        font-size: 13px;
        max-width: 100%;
        min-height: 40px;
        background-size: 20px auto;
        background-position: right 10px center;
        background-repeat: no-repeat;
    }

    .s21_tour_search_button:hover {
        background: #f3f3f3;
        color: #477A7B;
        text-decoration: none;
        border: 1px solid #E0E0E0;
    }

    .search_keyword {
        display: inline-block;
        padding: 0 13px;
        margin: 2px 2px;
        font-size: 13px;
        text-align: center;
        background: #f3f3f3;
        border: 1px solid #0000;
        height: 35px;
        line-height: 35px;
        border-radius: 20px;
        color: #477A7B;
        text-decoration: none;
    }

    .search_keyword:hover {
        background: #477A7B;
        color: #fff;
        text-decoration: none;
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

    .talent_list .thumb {
        overflow: hidden;
        position: relative;
        max-width: 210px;
        height: 140px;
        margin-bottom: 12px;
        border-radius: 6px;
        background-position: center;
        background-size: cover;
    }

    .talent_list .talent_info {
        display: flex;
        align-items: center;
        position: relative;
    }

    .talent_list .talent_info .user {
        padding-left: 16px;
        font-weight: bold;
        font-size: 11px;
        background: url(https://front-img.taling.me/Content/app3/img/icon/icClasscardWish@2x.png) no-repeat left/12px 12px;
    }
</style>
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
<!-- 슬라이드 이미지를 감싸는 div -->
<div id="slideshow">
    <!-- 이미지 목록 -->
    <img src="/image/place_image/dog2.jpeg">
    <img src="/image/place_image/dog2.jpeg">
    <img src="/image/place_image/dog3.jpeg">
    <img src="/image/place_image/dog4.jpeg">
    <img src="/image/place_image/dog5.jpeg">
</div>

<!-- 이전/다음 버튼 -->
<div class="prev" onclick="plusSlides(-1)">&#10094;</div>
<div class="next" onclick="plusSlides(1)">&#10095;</div>

<div class="container app">
    <div class="s21_sm_search">
        <div class="d-flex justify-content-center">
            <div class="d-flex justify-content-center city_select">
                <select id="region-select" ref="selectedRegion" v-model="selectedRegion" class="form-select"
                        aria-label="Default select example">
                    <option value="전국">전국</option>
                    <option v-for="region in regions" :value="region">{{ region }}</option>
                </select>
                <select id="city-select" ref="selectedCity" v-model="selectedCity" class="form-select"
                        aria-label="Default select example">
                    <option value="시군선택">시군선택</option>
                    <option v-for="city in cities[selectedRegion]" :value="city">{{ city }}</option>
                </select>
                <select class="form-select" aria-label="Default select example" ref="category" v-model="category">
                    <option value="0">여행지선택</option>
                    <option value="관광지">관광지</option>
                    <option value="음식점">음식점</option>
                    <option value="숙소">숙소</option>
                    <option value="캠핑">캠핑</option>
                    <option value="쇼핑">쇼핑</option>
                    <option value="호텔링">호텔링</option>
                </select>
                <input type="text" class="s21_SearchInput" name="sch_text" id="sch_text" placeholder="여행지명을 입력하세요"
                       ref="title" v-model="title">
                <button type="button" class="s21_tour_search_button" v-on:click="find()">검색하기</button>
            </div>
        </div>
        <div class="d-flex justify-content-center">
            <strong style="margin: 5px;">추천검색어</strong>
        </div>
        <div class="d-flex justify-content-center">
            <p>
                <a href="/product/search.html?keyword=UFO 넥카라" class="search_keyword">UFO 넥카라</a>
                <a href="/product/search.html?keyword=꿀잠방석" class="search_keyword">꿀잠방석</a>
                <a href="/product/search.html?keyword=논슬립 슬라이드 계단" class="search_keyword">논슬립 슬라이드 계단</a>
            </p>
        </div>
    </div>

    <div class="d-flex justify-content-end">
        <button type="button" style="margin: 5px;" class="s21_tour_search_button" ref="created_at"
                v-on:click="sort1('created_at')">최신순
        </button>
        <button type="button" style="margin: 5px;" class="s21_tour_search_button" ref="hit"
                v-on:click="sort1('hit')">조회순
        </button>
    </div>
    <%--<div v-for="item in searchList" :key="item.id" class="col-md-3">
        <li class="swiper-slide swiper-slide-active" style="width: 210px; margin-right: 15px;">
            <a :href="'../place/place_detail.do?pno=' + item.pno">
                <img :src="item.image">
            <div class="thumb lazyloaded" style="background-image: url(&quot;//img.taling.me/Content/Uploads/Images/b8fd2c6e36ed2c459171ce1afc7d7f1d98e97626.jpg&quot;);"></div>
            <div class="card_cnt">
                <h3 class="talent_title">{{ item.title }}</h3>
                <div class="talent_info">
                    &lt;%&ndash;<span class="user">{{}}</span>&ndash;%&gt;
                    <span class="reward_badge" style="background-image:url('//front-img.taling.me/Content/app3/img/icon/icClasscardReview@2x.png')">조회수{{}}</span>
                </div>
            </div>
            </a>
            <button type="button" class="btn_wish " onclick="updateWish(this,36694);"></button>
        </li>
    </div>
    <infinite-loading @infinite="infiniteHandler"></infinite-loading>--%>

    <div class="row">
        <div v-if="searchList.length > 0">
            <div v-for="item in searchList" :key="item.id" class="col-md-3">
                <div class="thumbnail">
                    <a :href="'../place/place_detail.do?pno=' + item.pno">
                        <img :src="item.image" style="height: 211px; width:100%">
                        <div class="caption">
                            <p>{{ item.title }}</p>
                            <p style="color: #a6a6a6; font-size: 14px;">{{ item.subtitle }}</p>
                        </div>
                    </a>
                </div>
            </div>
            <infinite-loading @infinite="infiniteHandler"></infinite-loading>
        </div>
        <div v-else>
            <div v-for="item in placeList" :key="item.id" class="col-md-3">
                <div class="thumbnail">
                    <a :href="'../place/place_detail.do?pno=' + item.pno">
                        <a :href="'../place/place_detail.do?pno=' + item.pno">
                        <img :src="item.image" style="height: 211px; width:100%">
                        <div class="caption">
                            <p>{{ item.title }}</p>
                            <p style="color: #a6a6a6; font-size: 14px;">{{ item.subtitle }}</p>
                        </div>
                    </a>
                </div>
            </div>
            <infinite-loading @infinite="infiniteHandler"></infinite-loading>
        </div>
    </div>
</div>
<jsp:include page="../fragments/footer.jsp"/>
<script>
    new Vue({
        el: '.app',
        data: {
            placeList: [],
            searchList: [],
            page: 1, // 현재 페이지
            loading: false, // 데이터 로딩 상태
            hasMore: true, // 추가 데이터 존재 여부
            selectedRegion: '전국',
            selectedCity: '시군선택',
            category: '여행지선택',
            title: '',
            regions: [
                '경기도', '서울특별시', '인천시', '강원도', '충청남도', '세종특별자치시', '대전시', '충청북도',
                '경상북도', '대구광역시', '전라북도', '전라남도', '광주광역시', '경상남도', '부산광역시', '울산광역시', '제주특별자치도'
            ],
            cities: {
                '서울특별시': [
                    '강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구',
                    '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구',
                    '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구',
                    '중랑구'
                ],
                '경기도': [
                    '수원시', '성남시', '의정부시', '안양시', '부천시', '광명시', '평택시', '동두천시', '안산시',
                    '고양시', '과천시', '구리시', '남양주시', '오산시', '시흥시', '군포시', '의왕시', '하남시', '용인시',
                    '파주시', '이천시', '안성시', '김포시', '화성시', '광주시', '양주시', '포천시', '여주시', '연천시',
                    '가평시', '양평시'
                ],
                '인천시': [
                    '계양구', '남동구', '동구', '미추홀구', '부평구', '서구', '연수구', '옹진구',
                    '중구'
                ],
                '강원도': [
                    '춘천시', '원주시', '강릉시', '동해시', '태백시', '속초시', '삼척시', '홍천시', '횡성시', '영월시',
                    '평창시', '정선시'
                ],
                '충청남도': [
                    '천안시', '공주시', '보령시', '아산시', '서산시', '논산시', '계룡시', '당진시', '금산시', '부여시',
                    '서천시', '연기시', '예산시', '청양시', '태안시', '홍성시'
                ],
                '세종특별자치시': [
                    '조치원읍', '연기면', '연동면', '부강면', '금남면', '장군면', '연서면', '전의면', '전동면', '소정면', '한솔동', '도담동'
                    , '아름동', '종촌동', '고운동', '보람동', '새롬동', '대평동', '소담동', '다정동', '해밀동', '반곡동'
                ],
                '대전광역시': [
                    '동구', '중구', '서구', '유성구', '대덕구'
                ],
                '충청북도': [
                    '청주시', '충주시', '제천시', '보은시', '옥천시', '영동시', '진천시', '괴산시', '음성시', '단양시'
                ],
                '경상북도': [
                    '포항시', '경산시', '경주시', '구미시', '김천시', '문경시', '상주시', '안동시', '영주시', '영천시',
                    '칠곡시', '예천시', '울진시', '의성시', '청도시', '청송시', '칠곡시'
                ],
                '대구광역시': [
                    '중구', '동구', '서구', '남구', '북구', '수성구', '달서구', '달성군'
                ],
                '전라북도': [
                    '전주시', '군산시', '익산시', '정읍시', '김제시', '남원시', '고창시', '부안시'
                ],
                '전라남도': [
                    '목포시', '여수시', '순천시', '나주시', '광양시', '담양시', '곡성시', '구례시', '고흥시', '보성시',
                    '화순시', '장흥시', '강진시', '해남시', '영암시', '무안시', '함평시', '영광시', '장성시', '완도시',
                    '진도시', '신안시'
                ],
                '광주광역시': [
                    '동구', '서구', '남구', '북구', '광산구'
                ],
                '경상남도': [
                    '창원시', '김해시', '진주시', '양산시', '거제시', '통영시', '사천시', '밀양시', '함안시', '거창시',
                    '창녕시', '고성시', '남해시', '하동시', '산청시', '함양시', '합천시'
                ],
                '부산광역시': [
                    '중구', '서구', '동구', '영도구', '부산진구', '동래구', '남구', '북구', '강서구',
                    '해운대구', '사하구', '금정구', '연제구', '수영구', '사상구', '기장군'
                ],
                '울산광역시': [
                    '중구', '남구', '동구', '북구', '울주군'
                ],
                '제주특별자치도': [
                    '제주시', '서귀포시'
                ]
            },
        },
        mounted: function () {
            this.infiniteHandler();
        },
        methods: {
            infiniteHandler($state) {
                // 데이터 로드
                axios.get("/place/place_list_infinite.do", {
                    params: {
                        page: this.page
                    },
                }).then(response => {
                    const {data} = response
                    // 로드한 데이터를 items 배열에 추가
                    this.placeList.push(...data)
                    // 다음 페이지 번호 증가
                    this.page++
                    // 로딩 상태를 종료
                    $state.loaded()
                }).catch(() => {
                    // 로딩 실패 시 로딩 상태 종료
                    $state.complete()
                })
            },
            sort1: function (sort) { //최신순, 조회순 정렬
                let _this = this;
                axios.get("/place/place_list_sort.do", {
                    params: {
                        sort: sort
                    }
                }).then(function (response) {
                    console.log(response.data)
                    _this.placeList = response.data;
                })
            },
            find: function () {
                let _this = this;
                this.placeList = [];
                axios.get("/place/place_search_vue.do", {
                    params: {
                        selectedRegion: this.selectedRegion,
                        selectedCity: this.selectedCity,
                        category: this.category,
                        title: this.title
                    }
                }).then(function (response) {
                    console.log(response.data)
                    _this.searchList = response.data;
                })
            },
            addJjim: function () {
                let _this = this;
                axios.get("/place/place_addJjim.do", {
                    params: {
                        pno: this.pno
                    }
                }).then(function (response) {
                    console.log(response.data)
                    _this.searchList = response.data;
                })
            }
        }
    })
</script>

</body>
</html>