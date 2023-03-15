<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../fragments/head.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<!-- <style>
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

/* 하단 리스트 */
.s21_event_list {
    width: 100%;
    margin: 10px auto 40px auto;
}
.review_conts {
    margin: 30px auto;
    width: 680px;
    text-align: center;
}
.review_list_bx {
    float: left;
    width: 100%;
    margin: 35px 0 0 0;
}
.review_list_bx {
    float: left;
    width: 100%;
    margin: 35px 0 0 0;
}
.review_list {
    width: 100%;
    float: left;
    margin: 10px 0 20px 0;
    padding-bottom: 30px;
    border-bottom: 2px solid #ebebeb;
}
.s21_album_desc_bx {
    display: inline-block;
    width: 100%;
    border-bottom: 0px dotted #e8e8e8;
    padding: 0px 0;
}
.s21_album_desc_bx p {
    float: left;
    width: 50px;
    margin-left: 0px;
    text-align: center;
}
.review_list p img {
    width: 50px;
    height: 50px;
}
.review_list dl {
    padding-left: 15px;
}
.swiper-container {
    margin-left: auto;
    margin-right: auto;
    position: relative;
    overflow: hidden;
    list-style: none;
    padding: 0;
    z-index: 1;
}
.review_btm_bx {
    float: left;
    width: 100%;
    margin: 20px 0 0 0;
}
.review_btm_shop {
    border-radius: 15px;
    background: #f8f7f2;
    border: 1px solid #eeede7;
    padding: 30px 0px 32px 0px;
    text-align: left;
    width: 100%;
    margin: 15px auto 10px auto;
    float: left;
}

/* 페이지네이션 */
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
    border: 1px solid #ddd;
    margin: 0 4px;
} 

</style>
-->
<body>
<jsp:include page="../fragments/header.jsp"/>

<div class="wrapper row3 rows">
  <main class="container clear">
    <table class="table">
      <tr>
        <td>
          <a href="/review/review_insert" class="btn btn-sm btn-primary">리뷰쓰기</a>
        </td>
      </tr>
    </table>
    <table class="table">
     <thead>
      <tr>
        <th width=10% class="text-center">번호</th>
        <th width=55% class="text-center">장소</th>
        <th width=15% class="text-center">작성자</th>
        <th width=20% class="text-center">작성일</th>
      </tr>
     </thead>
     <tbody>
       <tr v-for="vo in review_list">
        <td width=10% class="text-center">{{vo.prno}}</td>
        <td width=55%><a :href="'../review/review_detail.do?prno='+vo.prno">{{vo.pno}}</a></td>
        <td width=15% class="text-center">{{vo.writer}}</td>
        <td width=20% class="text-center">{{vo.createdAt}}</td>
      </tr>
      <tr>
        <td colspan="5" class="text-right">
         <input type=button value="이전"  class="btn btn-sm btn-danger" v-on:click="prev()">
          {{curpage}} page / {{totalpage}} pages
         <input type=button value="다음"  class="btn btn-sm btn-warning" v-on:click="next()">
        </td>
      </tr>
     </tbody>
    </table>
  </main>
</div>
<script>
  new Vue({
	  el:'.rows',
	  data:{
		  review_list:[],
		  curpage:1,
		  totalpage:0
	  },
	  mounted:function(){
		  this.send()
	  },
	  methods:{
		  send:function(){
			  let _this=this
			  axios.get("review/review_list_vue",{
				  params:{
					  page:this.curpage
				  }
			  }).then(function(response){
				  console.log(response.data)
				  _this.board_list=response.data
				  _this.curpage=response.data[0].curpage
				  _this.totalpage=response.data[0].totalpage
			  })
		  },
		  prev:function(){
			  this.curpage=this.curpage>1?this.curpage-1:this.curpage
			  this.send()
		  },
		  next:function(){
			  this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage
			  this.send()
		  }
	  }
  })
</script>

<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>