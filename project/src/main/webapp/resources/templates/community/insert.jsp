<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../fragments/head.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.container{
   margin-top: 70px;
}
.row{
   margin: 0px auto;
   width:700px;
}
h1{
   text-align: center;
}
.select_box{
   background-color: #dfe9e8;
   color: #477A7B;
}
.btn1{
   background-color: #477a7b;
   color: #fff;
   border: 1px solid #477a7b;
   padding: 0 10px;
   display :inline-block;
   text-align: center;
   cursor: pointer;
   font-weight: 500;
   line-height: 50px;
   width: 200px;
}
.btn2{
  background-color: #fff;
   color: #477a7b;
   border: 1px solid #477a7b;
   padding: 0 10px;
   display :inline-block;
   cursor: pointer;
   font-weight: 500;
   line-height: 50px;
   width: 200px;
}
#addBtn{
  background-color: #7FFFD4;
}
#removeBtn{
  background-color: #AFFFEE;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

</head>
<body>
<jsp:include page="../fragments/header.jsp"/>
   <div class="container">
     <div class="row">
      <form method=post action="insert_ok.do" enctype="multipart/form-data">
       <table class="table">
       <tr>
        <th width=100% class="text-center"></th>
         <td width=85%>
          <select class="select_box" name="type" style="width:100%;height:35px;border:none">
           <option value="review">여행후기</option>
           <option value="food">맛집추천</option>
           <option value="place">장소추천</option>
           <option value="share">유머나라</option>
           <option value="mydog">내반려견</option>
          </select>
         </td>
       </tr>
       <%-- @Insert("INSERT INTO pet_community_2_1 VALUES(" 
			+ "#{cno},4,#{title},#{content},SYSDATE,#{type},0,#{name},#{pwd},#{filesize},#{filename})") --%>
       <tr>
           <th width=15% class="text-right">닉네임</th>
           <td width=85%>
             <input type=text name="name" size=50 class="input-sm">
           </td>
         </tr>
         
         <tr>
           <th width=15% class="text-right">제목</th>
           <td width=85%>
             <input type=text name="title" size=50 class="input-sm">
           </td>
         </tr>
         <tr>
           <th width=15% class="text-right">내용</th>
           <td width=85%>
             <textarea rows="10" cols="50" name="content"></textarea>
           </td>
         </tr>
         <tr>
           <th width=15% class="text-right">첨부파일</th>
           <td width=85%>
             
			<input type=file name="files" size=20 class="input-sm">              
           </td>
         </tr>
         <tr>
           <th width=15% class="text-right">비밀번호</th>
           <td width=85%>
             <input type=password name="pwd" size=50 class="input-sm">
           </td>
         </tr>
        <div class="clear">
         <tr>
           <td colspan="2" class="text-center">
             <input type=submit value="전송" class="btn1">
             <input type=button value="취소" class="btn2" onclick="javascript:history.back()">
           </td>
         </tr>
        </div> 
       </table>
       </form>
     </div>
   </div>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>












