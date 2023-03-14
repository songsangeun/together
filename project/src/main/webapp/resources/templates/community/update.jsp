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
        <th width="20%">이름</th>
        <td width="80%"><input type="text" size="15" class="input-sm" v-model="name" :value="name"></td>
      </tr>
      <tr>
        <th width="20%">제목</th>
        <td width="80%"><input type="text" size="45" class="input-sm" v-model="title" :value="title"></td>
      </tr>
      <tr>
        <th width="20%">내용</th>
        <td width="80%"><textarea rows="10" cols="45" v-model="content">{{content}}</textarea></td>
      </tr>
      <tr>
        <th width="20%">비밀번호</th>
        <td width="80%"><input type="password" size="10" class="input-sm" v-model="pwd" ref="pwd"></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type="button" value="수정하기" class="btn btn-sm btn-primary" v-on:click="update()">
          <input type="button" value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
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
        content:'',
        pwd:'',
        cno:${cno}
     },
     mounted:function(){
           let _this=this;
           axios.get('/community/update_vue.do',{
              params:{
                 no:this.no
              }
           }).then(function(response){
              _this.name=response.data.name
              _this.title=response.data.title
              _this.content=response.data.content
           })
     },
     methods:{
        update:function(){
           let _this=this;
           axios.get('/community/update_ok_vue.do',{
              params:{
                 cno:this.cno,
                 name:this.name,
                 title:this.title,
                 content:this.content,
                 pwd:this.pwd
              }
           }).then(function(response){
              let res=response.data;
              if(res==='yes')
              {
            	  location.href="../community/detail.do?cno="+_this.cno
               }
              else
              {
            	  alert('비밀번호가 틀립니다')
            	  _this.pwd=''
            	  _this.$refs.pwd.focus()
               }
           })
        }
     }
  })

</script>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>