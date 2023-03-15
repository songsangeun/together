<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../fragments/head.jsp"/>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
    <!-- Add this after vue.js -->
    <script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
    <script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.container{
	margin-top:50px;
}
.row{
	margin:0px auto;
	width: 900px;
}
h1{
	text-align: center;
}
.plusBtn{

}

.xans-board-search {
    padding: 20px 0 20px 10px;
    color: #2e2e2e;
}

.xans-board-search .boardSearch {
    display: block;
    width: 100%;
    max-width: 500px;
    margin: 0 auto;
}

.xans-board-search p {
    margin: 0 0 10px;
    padding: 0 0 0;
}

.xans-board-search .category select {
    margin: 0 4px 0 0;
    width: 150px;
}

.xans-board-search .category select#product_category_depth1 {
    margin: 0 5px 0 10px;
}

.xans-board-search select {
    margin: 0 1% 0 0;
    width: 32.33333333%;
    float: left;
}

.xans-board-search select#search_date {
    margin: 0 1% 0 0;
    width: 32.33333333%
}

.xans-board-search select#search_key {
    margin: 0 1% 0 0;
    width: 32.33333333%
}

.xans-board-search input#search {
    margin: 0 0 0 0;
    width: 33.33333333%
}

.xans-board-search .boardSearch a {
    margin: 10px 0 0;
    vertical-align: middle;
}

.searchBar {
  width: 100%;
  display: flex;
  flex-direction: row;
  align-items: center;
}

#searchQueryInput {
  width: 100%;
  height: 2.8rem;
  background: #f5f5f5;
  outline: none;
  border: none;
  border-radius: 1.625rem;
  padding: 0 3.5rem 0 1.5rem;
  font-size: 18px;
}

#searchQuerySubmit {
  width: 3.5rem;
  height: 2.8rem;
  margin-left: -3.5rem;
  background: none;
  border: none;
  outline: none;
}

#searchQuerySubmit:hover {
  cursor: pointer;
}

.pageTopWrap {
    position: relative;
    width: 100%;
    padding: 0 0 0;
    margin: 0 0;
    background: #dfe9e8;
}

.pageTopMargin {
    height: 30px;
    width: 100%;
    background: #dfe9e8;
    margin: 0 0 30px;
}

.pageTopWrap.gray {
    background: #fafafa;
}

.pageTopWrap.white {
    background: #fff;
}

.sectionT,.pageTitle,.titleArea h2,.bestTitle {
    position: relative;
    display: block;
    font-size: 30px;
    font-weight: 600;
    text-align: center;
    text-transform: uppercase;
    letter-spacing: -0.02em;
    color: #477A7B;
    margin: 0 0 30px;
    padding: 0 10px;
    line-height: 1.2em;
}

.per_10 {
	width:10%;
	float:left;
}

.pconly {
	display: block !important;
}
.per_50 {
	width:50%;
	float:left;
}

.per_20 {
	width: 20%;
	float: left;
}

.pageSubtitle {
    padding-bottom: 10px;
    border-bottom: 1px solid #e8e8e8;
    margin: 0 0 30px;
}

.pageNav {
    position: relative;
    margin: 0 auto 30px;
    padding: 10px 0;
}

.pageNav ul {
    margin: 0 auto;
    padding: 0 10px;
    list-style: none;
    text-align: center;
    font-size: 0;
}

.pageNav ul li {
    margin: 0 auto;
    padding: 0;
    list-style: none;
    display: inline-block;
}

.pageNav ul li a {
    position: relative;
    display: block;
    margin: 0 5px;
    padding: 0 20px;
    height: 35px;
    line-height: 35px;
    font-size: 15px;
    font-weight: 500;
    background: #f3f3f3;
    color: #477A7B;
    list-style: none;
    border-radius: 50px;
}

.pageNav ul li a:hover,.pageNav ul li.active a {
    background: #477A7B;
    color: #fff;
}

.pBtn{

}

.nBtn{

}
</style>
</head>

<body>
<jsp:include page="../fragments/header.jsp"/>
<div id="wrap">
 <div class="wrapper row3 rows">
  <main class="container clear">
   <div class="pageTopWrap">
     <div class="pageTitle">커뮤니티</div>
     <div class="pageNav">
      <ul>
        <li class="active">
          <a href="#">~~~</a>
        </li>
        <li>
          <a href="#">QNA</a>
        </li>
        <li>
          <a href="#">FAQ</a>
        </li>
        <li>
          <a href="#">고객센터</a>
        </li>
       </ul>
     </div>
   </div>
   <tr>
     <td>
      <sec:authorize access="isAuthenticated()">
       <a href="../customer/insert" class="plusBtn" style="background-color:transparent;color:black;border-color: black">글쓰기</a>
      </sec:authorize>
     </td>
    </tr> 
   <table class="table">
     <thead>
     	
       <tr>
         <th width=10% class="text-center">번호</th>
         <th width=45% class="text-center">작성자</th>
         <th width=15% class="text-center">제목</th>
         <th width=20% class="text-center">작성일</th>
         <th width=10% class="text-center">조회수</th>
       </tr>
     </thead>
     <tbody>
       <tr v-for="vo in cs_list">
         <td width=10% class="text-center">{{vo.nno}}</td>
         <td width=15% class="text-center">{{vo.name}}</td>
         <td width=45%><a :href="'/customer/detail?nno='+vo.nno">{{vo.subject}}</a></td>
         <td width=20% class="text-center">{{vo.dbday}}</td>
         <td width=10% class="text-center">{{vo.hit}}</td>
       </tr>
      
       
       <tr>
         <td colspan="5" class="text-center">
           <input type=button value="이전" class="pBtn" v-on:click="prev()">
             {{curpage}} page / {{totalpage}} pages
           <input type=button value="다음" class="nBtn" v-on:click="next()">
         </td>
       </tr>
     </tbody>
   </table>

   </main>
  </div>
  </div>
<script>
  new Vue({
	 el:'.rows',
	 data:{
		 cs_list:[],
		 curpage:1,
		 totalpage:0
	 },
	 mounted:function(){
		 this.send()
		 
	 },
	 methods:{
		 send:function(){
			 let _this=this
			 axios.get("/customer/list_vue.do",{
				 params:{
					 page:this.curpage
				 }
			 }).then(function(response){
				 console.log(response.data)
				 _this.cs_list=response.data
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