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
<div class="container">
  <div class="row">
   <table class="table" style="background-color: #dfe9e8;">
    <tr class="text-center"> 
     <td>
       <h1><b style="color:#477A7B;">투개더 공지사항</b></h1>
       <p>투개더에서 새로운 소식을 알려드립니다.</p>
     </td>
    </tr>
   </table>  
 </div>
  
<div class="wrapper row3 rows">
  <main class="container clear">
    <table class="table">
      <tr>
        <th width="20%" class="text-center">번호</th>
        <td width="30%" class="text-center">{{notice_detail.cno}}</td>
      </tr>
      <tr>
        <th width="20%" class="text-center">제목</th>
        <td colspan="3">{{notice_detail.title}}</td>
      </tr>
      <tr>
        <td colspan="4" class="text-left" valign="top" height="200"><pre style="white-space: pre-wrap;background-color: white;border: none;">{{notice_detail.content}}</pre></td>
      </tr>
      <tr>
        <th width="20%" class="text-center">작성일</th>
        <td width="30%" class="text-center">{{notice_detail.dbday}}</td>
        <th width="20%" class="text-center">조회수</th>
        <td width="30%" class="text-center">{{notice_detail.hit}}</td>
      </tr>
      
      
      <tr>
        <td colspan="4" class="text-right">
          <sec:authorize access="hasRole('ROLE_ADMIN')">
           <a :href="'../notice/delete.do?nno='+notice_detail.nno" class="btn btn-xs btn-success">삭제</a>
          </sec:authorize>
          <a href="../notice/list.do" class="btn btn-xs btn-info">목록</a>
        </td>
      </tr>
    </table>
  </main>
</div>
</div>
<script>
  new Vue({
     el:'.rows',
     data:{
        nno:${nno},
        notice_detail:{}
     },
     mounted:function(){
        let _this=this
        axios.get("/notice/detail_vue.do",{
           params:{
              nno:this.nno
           }
        }).then(function(response){
           _this.notice_detail=response.data
        })
     }
  })
</script>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>