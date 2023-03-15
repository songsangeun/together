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
     <th width=20%>제목</th>
     <td width=80%><input type=text size="55" class="input-sm" v-model="title"></td>
    </tr>
    <tr>
     <th width=20%>내용</th>
     <td width=80%><textarea rows="10" cols="55" v-model="content"></textarea></td>
    </tr>
    <tr>
     <td colspan="2" class="text-center">
      <input type=button value="글쓰기" class="btn btn-sm btn-primary" v-on:click="write()">
      <input type=button value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
     </td>
    </tr>
   </table>
  </main>
 </div> 
 <script>
   new Vue({
	   el:'.rows',
	   data:{
		   name:'',
		   title:'',
		   content:''
	   },
	   methods:{
		   write:function(){
			   let _this=this;
			   axios.get('/notice/insert_vue.do',{
				   params:{
					   name:this.name,
					   title:this.title,
					   content:this.content,
				   }
			   }).then(function(response){
				   location.href="../notice/list.do"
			   })
		   }
	   }
   })
 </script> 
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>