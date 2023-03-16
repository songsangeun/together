<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../fragments/head.jsp"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<jsp:include page="../fragments/head.jsp"/>
<body>
<jsp:include page="../fragments/header.jsp"/>

<div class="wrapper row3 rows">
  <main class="container clear">
    <table class="table">
      <tr>
        <th width=20%>작성자</th>
        <td width=80%><sec:authentication property="principal.nickname"/></td>
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
		  content:'',
		  pno=${pno}
	  },
	  methods:{
		  write:function(){
			  let _this=this;
			  let data = {
					  content:this.content,
					  pno:this.pno
			  }
			  axios.post('/review/review_insert_vue',JSON.stringify(data),{
				  headers:{
					  "content-type":'application/json'
				  }
			  }).then(function(response){
				  location.href="/review/review_list"
			  })
		  }
	  }
  })
</script>

<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>