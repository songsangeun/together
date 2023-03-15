<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
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
        <td width=80%><input type=text size="15" class="input-sm" v-model="writer" :value="writer"></td>
      </tr>
      <tr>
        <th width=20%>내용</th>
        <td width=80%><textarea rows="10" cols="55" v-model="content">{{content}}</textarea></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
         <input type=button value="수정하기" class="btn btn-sm btn-primary" v-on:click="update()">
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
		  writer:'',
		  content:'',
		  prno:${prno}
	  },
	  mounted:function(){
			  let _this=this;
			  axios.get('/review/review_update_vue',{
				  params:{
					 prno:this.prno
				  }
			  }).then(function(response){
				  _this.writer=response.data.writer
				  _this.content=response.data.content
			  })
	  }
})
</script>

<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>