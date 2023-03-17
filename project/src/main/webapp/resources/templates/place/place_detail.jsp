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

    </style>
</head>

<body>
<jsp:include page="../fragments/header.jsp"/>
<div class="wrapper row3 rows" id="app">
    <main class="container clear">
        <div style="height: 20px"></div>
        <div class="two_third first">
            <table class="table">
                <tr>
                    <td colspan="2">
                        <h3><span id="name">{{place_detail.title}}</span>&nbsp;
                            <span class="subtitle">{{place_detail.subtitle}}</span>
                        </h3>
                    </td>
                </tr>
                <tr>
                    <%--<td v-for="img in place_detail.image.split(',')">
                        <img :src="img" style="width: 500px; height: 370px;">
                    </td>--%>
                    <td><img :src="place_detail.image.split(',')[0]" style="width: 500px; height: 370px;"></td>
                    <td><img :src="place_detail.image.split(',')[1]" style="width: 500px; height: 370px;"></td>
                </tr>
                <tr>
                    <th width=20%  style="text-align: right">주소 : </th>
                    <td width=80%>
                        {{place_detail.address}}<br>
                    </td>
                </tr>
                <tr>
                    <th width=20%  style="text-align: right">전화 : </th>
                    <td width=80%>{{place_detail.tel}}</td>
                </tr>
                <tr>
                    <th width=20%  style="text-align: right">홈페이지 : </th>
                    <td width=80%>{{place_detail.homepage}}</td>
                </tr>
                <tr>
                    <th width=20%  style="text-align: right">영업시간 : </th>
                    <td width=80%>{{place_detail.openHour}}</td>
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
                            <td class="d-flex justify-content-center">
                                <img v-for="content in place_detail.content.split(',')" :src="content" style="width: 70%; padding-bottom: 15px;">
                            </td>
                        </tr>
                    </b-tab>
                    <b-tab title="위치정보">
                        <table class="table">
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
                            <div class="one_third">
                                <div id="map" style="width:50%;height:350px;"></div>
                            </div>
                        </table>
                    </b-tab>
                    <b-tab title="리뷰">
                        <div id="review">
                            <div class="m-auto" style="max-width: 800px;">
                                <div class="form-group">
                                    <textarea class="form-control" v-model="reply_content" id="exampleFormControlTextarea1"
                                              rows="4"
                                              placeholder="댓글을 입력해주세요."></textarea>
                                    <div class="mt-3 d-flex justify-content-end">
                                        <button class="btn btn-outline-secondary" type="button"
                                                v-on:click="placeReplyWrite()">등록
                                        </button>
                                    </div>
                                </div>
                                <div class="mt-3" v-for="vo in place_reply_list">
                                    <div class="d-flex justify-content-start align-items-center mt-3">
                                        <div class="mr-3">
                                            {{ vo.writer }}
                                        </div>
                                        <div class="text-secondary">
                                            <small>{{ vo.regDate }}</small>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <p>{{ vo.content }}</p>
                                    </div>
                                </div>
                                <div class="mt-5 mb-3">
                                    <div class="d-flex justify-content-center">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <div>
                                                    <li class="page-item disabled" v-if="isFirst">
                                                        <button class="page-link" type="button" v-on:click="prevPage()">
                                                            &laquo;
                                                        </button>
                                                    </li>
                                                    <li class="page-item" v-else>
                                                        <button class="page-link" type="button" v-on:click="prevPage()">
                                                            &laquo;
                                                        </button>
                                                    </li>
                                                </div>
                                                <div class="p-2 d-flex justify-content-center">
                                                    {{ page }} / {{ totalPage }}
                                                </div>
                                                <div>
                                                    <li class="page-item disabled" v-if="isLast">
                                                        <button class="page-link" type="button" v-on:click="nextPage()">
                                                            &raquo;
                                                        </button>
                                                    </li>
                                                    <li class="page-item" v-else>
                                                        <button class="page-link" type="button" v-on:click="nextPage()">
                                                            &raquo;
                                                        </button>
                                                    </li>
                                                </div>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </b-tab>
                </b-tabs>
            </div>
        </div>
    </main>
</div>


<script>
    new Vue({
        el: '#app',
        data: {
            pno:${pno},
            place_detail: [],
            place_reply_list: [],
            count: 0,
            content: '',
            reply_content: '',
            totalCount: '',
            totalPage: '',
            isFirst: '',
            isLast: '',
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

                if (window.kakao && window.kakao.maps) {
                    _this.initMap();
                } else {
                    _this.addScript();
                }
            })
            this.pno = new URLSearchParams(location.search).get('pno');
            this.placeReplyList(1, this.pno);
        },
        methods: {
            addScript: function () {
                const script = document.createElement("script")
                // /!* global kakao *!/
                script.onload = () => kakao.maps.load(this.initMap)
                script.src = 'http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=ce7e1ba0d693dbff7b0aa170789fd3c0&libraries=services'
                document.head.appendChild(script)
            },
            initMap: function () {
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
                geocoder.addressSearch(this.place_detail.address, function (result, status) {

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
                            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + $('#name').text() + '</div>'
                        });
                        infowindow.open(map, marker);

                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        map.setCenter(coords);
                    }
                })
            },
            placeReplyList: function (page, pno) {
                let _this = this;
                axios.get('/review/review_list_vue', {
                    params: {
                        page: page,
                        pno: pno
                    }
                }).then(function (response) {
                    _this.place_reply_list = response.data.items;
                    _this.totalCount = response.data.totalItem;
                    _this.page = response.data.page;
                    _this.isFirst = response.data.first;
                    _this.isLast = response.data.last;
                    _this.totalPage = response.data.totalPage;
                })
            },
            placeReplyWrite: function () {
                let _this = this;
                this.pno = new URLSearchParams(location.search).get('pno');
                let data = {
                    content: this.reply_content,
                    pno: this.pno
                }
                axios.post('/review/review_insert_vue', JSON.stringify(data), {
                    headers: {
                        "content-type": 'application/json'
                    }
                }).then(function (response) {
                    _this.reply_content = '';
                    _this.placeReplyList(1, _this.pno);
                })
            }
        }
    });
</script>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>