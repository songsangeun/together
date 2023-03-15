<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <th width=20% class="text-center">번호</th>
        <td width=30% class="text-center">{{review_detail.prno}}</td>
        <th width=20% class="text-center">장소</th>
        <td width=30% class="text-center">{{review_detail.pno}}</td>
      </tr>
      <tr>
        <th width=20% class="text-center">작성자</th>
        <td width=30% class="text-center">{{review_detail.writer}}</td>
        <th width=20% class="text-center">작성일</th>
        <td width=30% class="text-center">{{review_detail.createdAt}}</td>
      </tr>
      <tr>
        <th width=20% class="text-center">작성자</th>
        <td colspan="3">{{review_detail.writer}}</td>
      </tr>
      <tr>
        <td colspan="4" class="text-left" valign="top" height="200"><pre style="white-space: pre-wrap;background-color: white;border: none">{{review_detail.content}}</pre></td>
      </tr>
      <tr>
        <td colspan="4" class="text-right">
          <a :href="'../review/review_update.do?prno='+reivew_detail.prno" class="btn btn-xs btn-danger">수정</a>
          <a :href="'../review/review_delete.do?prno='+review_detail.prno" class="btn btn-xs btn-success">삭제</a>
          <a href="../review/review_list.do" class="btn btn-xs btn-info">목록</a>
        </td>
      </tr>
    </table>
  </main>
</div>
<script>
  new Vue({
	  el:'.rows',
	  data:{
		  prno:${prno},
		  review_detail:{}
	  },
	  mounted:function(){
		  let _this=this
		  axios.get("/review/review_detail_vue",{
			  params:{
				  prno:this.prno
			  }
		  }).then(function(response){
			  _this.review_detail=response.data
		  })
  })
</script>

<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>