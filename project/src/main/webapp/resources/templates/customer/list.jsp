<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>

<body>
<jsp:include page="../fragments/header.jsp"/>

 <div class="wrapper row3 rows">
  <main class="container clear">
   <table class="table">
     <tr>
      <td>
       <a href="/customer/insert" class="plusBtn">등록</a>
      </td>
     </tr>
   </table>
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
       
       <form id="boardSearchForm" name action="/customer/list" method="get"
        target="_top" enctype="multipart/form-data">
          <fieldset class="boardSearch">
            <legend>게시물 검색</legend>
            <div class="searchBar">
    <input id="searchQueryInput" type="text" name="ss" placeholder="검색해보걸아♡" value="${ss }" />
    <button id="searchQuerySubmit" type="submit" name="searchQuerySubmit">
      <svg style="width:24px;height:24px" viewBox="0 0 24 24"><path fill="#666666" d="M9.5,3A6.5,6.5 0 0,1 16,9.5C16,11.11 15.41,12.59 14.44,13.73L14.71,14H15.5L20.5,19L19,20.5L14,15.5V14.71L13.73,14.44C12.59,15.41 11.11,16 9.5,16A6.5,6.5 0 0,1 3,9.5A6.5,6.5 0 0,1 9.5,3M9.5,5C7,5 5,7 5,9.5C5,12 7,14 9.5,14C12,14 14,12 14,9.5C14,7 12,5 9.5,5Z" />
      </svg>
    </button>
  </div>
            <p>
              <select id="search_date" name="search_date" fw-filter fw-label fw-msg>
                <option value="week">일주일</option>
                <option value="month">한달</option>
                <option value="month3">세달</option>
                <option value="all">전체</option>
              </select>
            </p>
          </fieldset>
        </form>
       
       
       
       
       <tr>
         <td colspan="5" class="text-center">
           <input type=button value="이전" class="btn btn-sm btn-danger" v-on:click="prev()">
             {{curpage}} page / {{totalpage}} pages
           <input type=button value="다음" class="btn btn-sm btn-warning" v-on:click="next()">
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
				 _this.customer_list=response.data
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