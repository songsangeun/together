<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../fragments/head.jsp"/>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div id="container">
 <div class="wrap">
   <div class="list_area">
     <div v-for="vo in review_list">
       <div><a href="'/review/detail.do?no='+vo.no">{{vo.title}}</a></div>
     </div>
   </div>
 </div>
</div>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>