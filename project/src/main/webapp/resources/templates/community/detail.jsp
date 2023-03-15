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
<style type="text/css">
.btn3{
  position: relative;
  margin: 0 5px; 
  padding: 0 20px;
  height: 35px;
  line-height: 35px;
  font-size: 15px;
  font-weight: 500;
  background-color: #477A7B;
  color:#f3f3f3;
  list-style: none;
  border-radius: 50px;
} 
</style>
<body>
<jsp:include page="../fragments/header.jsp"/>
 <div class="container">
  <div class="row">
   <table class="table" style="background-color: #dfe9e8;">
    <tr class="text-center"> 
     <td>
       <h1><b style="color:#477A7B;">커뮤니티 혜택</b></h1>
       <p>투개더에서 우리 반려동물에 대한 이야기를 공유해보세요.</p>
     </td>
    </tr>
     <tr class="text-center">
      <td>
       <a href="../community/insert.do" class="btn btn-md" style="background-color:transparent;color:white;border-color: white">커뮤니티에 글쓰기</a>
      </td>
    </tr>
   </table>  
 </div>
  
<div class="wrapper row3 rows">
  <main class="container clear">
    <table class="table">
      <tr>
        <th width="20%" class="text-center">번호</th>
        <td width="30%" class="text-center">{{community_detail.cno}}</td>
        <th width="20%" class="text-center">이름</th>
        <td width="30%" class="text-center">{{community_detail.name}}</td>
      </tr>
      <tr>
        <th width="20%" class="text-center">제목</th>
        <td colspan="3">{{community_detail.title}}</td>
      </tr>
      <tr>
        <td colspan="4" class="text-left" valign="top" height="200"><pre style="white-space: pre-wrap;background-color: white;border: none;">{{community_detail.content}}</pre></td>
      </tr>
      <tr>
        <th width="20%" class="text-center">파일크기</th>
        <td width="30%" class="text-center">{{community_detail.filesize}}</td>
        <th width="20%" class="text-center">파일이름</th>
        <td width="30%" class="text-center">{{community_detail.filename}}</td>
      </tr>
      <tr>
        <th width="20%" class="text-center">작성일</th>
        <td width="30%" class="text-center">{{community_detail.dbday}}</td>
        <th width="20%" class="text-center">조회수</th>
        <td width="30%" class="text-center">{{community_detail.hit}}</td>
      </tr>
      <tr>
        <td colspan="4" class="text-right">
          <a :href="'../community/update.do?cno='+cno" class="btn btn-xs btn-danger">수정</a>
          <a :href="'../community/delete.do?cno='+cno" class="btn btn-xs btn-success">삭제</a>
          <a href="../community/list.do" class="btn btn-xs btn-info">목록</a>
        </td>
      </tr>
    </table>
  </main>
</div>
    <div class="form-group">
                <textarea class="form-control" v-model="content" id="exampleFormControlTextarea1" rows="4"
                          placeholder="댓글을 입력해주세요."></textarea>
                <div class="mt-3 d-flex justify-content-end">
                    <button class="btn btn-outline-secondary" type="button" v-on:click="writeReply()">등록</button>
                </div>
            </div>
</div>
<script>
  new Vue({
     el:'.rows',
     data:{
        cno:${cno},
        community_detail:{}
     },
     mounted:function(){
        let _this=this
        axios.get("/community/detail_vue.do",{
           params:{
              cno:this.cno
           }
        }).then(function(response){
           _this.community_detail=response.data
        })
     }
  })
</script>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>