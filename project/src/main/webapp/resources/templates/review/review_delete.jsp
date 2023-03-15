<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!--       <tr>
        <td class="text-center inline">
         비밀번호:<input type=password size=20 class="input-sm" ref="pwd" v-model="pwd">
        </td>
      </tr> -->
      <tr>
        <td class="text-center">
          <input type=button value="삭제" class="btn btn-sm btn-danger" v-on:click="del()">
          <input type=button value="취소" class="btn btn-sm btn-danger"  onclick="javascript:history.back()">
        </td>
      </tr>
    </table>
  </main>
</div>
<script>
new Vue({
	  el:'.rows',
	  data:{
		  prno:${prno}
	  },
	  methods:{
		  del:function(){
			 let _this=this
			 axios.get('review/review_list_vue',{
				 params:{
					 prno:this.prno,
				 }
			 }).then(function(response){
				 if(response.data==='yes')
				 {
					 location.href="../board/list.do"
				 }
			 })
		  }
	  }
})
</script>

<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>