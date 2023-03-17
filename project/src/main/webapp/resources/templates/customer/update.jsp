<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../fragments/head.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  .s21_best_m_top {
        width: 100%;
        background-color: #FF9B8E;
        min-height: 300px;
        background-size: 100%;
    }

    .pr {
        position: relative;
    }

    .s21_top_tbox {
        width: 1260px;
        margin: 0px auto;
    }

    .s21_top_tbox_left {
        float: left;
        width: 40%;
        text-align: left;
    }

    .s21_top_tbox h3 {
        width: 100%;
        text-align: left;
        color: #fff;
        font-size: 45px;
        font-weight: 300;
        padding: 50px 0 0 0px;
        letter-spacing: -0.03em;
    }

    .s21_top_tbox h3 span {
        color: #fff;
        font-size: 45px;
        font-weight: 400;
    }

    .s21_h3_line_l {
        width: 30px;
        height: 3px;
        background: #fff;
        margin: 15px 10px;
        text-align: left;
    }

    .s21_h3_text_l {
        font-size: 16px;
        color: #fff;
        font-weight: 200;
        opacity: 0.7;
        text-align: left;
        line-height: 26px;
        padding-left: 10px;
        letter-spacing: -0.05em;
    }

</style>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div>
<div class="s21_best_m_top pr">
    <div class="s21_top_tbox">
        <div class="s21_top_tbox_left">
            <h3 class=""><span>투개더 고객센터</span></h3>
            <p class="s21_h3_line_l"></p>
            <p class="s21_h3_text_l">1:1 문의글 수정</p>
            
        </div>
    </div>
</div>
<div class="wrapper row3 rows">
  <main class="container clear">
    <table class="table">
      <tr>
        <th width="20%">작성자</th>
        <td width="80%">${vo.name}</td>
      </tr>
      <tr>
        <th width="20%">제목</th>
        <td width="80%"><input type="text" size="45" class="input-sm" v-model="subject" :value="subject"></td>
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
          <input type="button" value="수정" class="btn btn-sm btn-primary" v-on:click="update('${vo.pwd}')">
          <input type="button" value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
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
       name:'',
       subject:'',
       content:'',
       pwd:'',
       nno:${nno}
    },
     mounted:function(){
       
          let _this=this;
          axios.get('/customer/update_vue.do',{
             params:{
               nno:this.nno
             }
          }).then(function(response){
              _this.name=response.data.name
              _this.subject=response.data.subject
              _this.content=response.data.content
          }) 
    }, 
    methods:{
   	 update:function(pwd){
   		 let _this=this;
   		  
   		   
            axios.get('/customer/update_ok_vue.do',{
               params:{
                 nno:this.nno,
                 subject:this.subject,
                 content:this.content,
                 pwd:this.pwd
               }
            }).then(function(response){
            	let res=response.data;
            	if(res==='yes')
            	{
            		location.href="/customer/detail?nno="+_this.nno
            	}
            	else
            	{
              		alert('비밀번호를 확인해주세요!!')
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