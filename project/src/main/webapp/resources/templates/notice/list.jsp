<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../fragments/head.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div class="wrapper row3 rows">
  <main class="container clear">
   <table class="table">
    <tr>
     <td>
      <a href="../notice/insert.do" class="btn btn-sm btn-primary">새글</a>
     </td>
    </tr>
   </table>
   <table class="table">
    <thead>
     <tr> 
      <th width=10% class="text-center">번호</th>
      <th width=45% class="text-center">제목</th>
      <th width=20% class="text-center">작성일</th>
      <th width=10% class="text-center">조회수</th>
     </tr>
    </thead>
    <tbody>
     <tr v-for="vo in board_list"> 
      <td width=10% class="text-center">{{vo.nno}}</td>
      <td width=45%><a :href="'../notice/detail.do?nno='+vo.nno">{{vo.title}}</a></td>
      <td width=20% class="text-center">{{vo.dbday}}</td>
      <td width=10% class="text-center">{{vo.hit}}</td>
     </tr>
     <tr> 
      <td colspan="5" class="text-right">
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
	 	   notice_list:[],
		   curpage:1,
		   totalpage:0
	   },
	   mounted:function(){
		   this.send()
	   },
	   methods:{
		   send:function(){
			   let _this=this
			   axios.get("/notice/list_vue.do",{
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