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
            <p class="s21_h3_text_l">1:1 문의글 삭제</p>
            
        </div>
    </div>
</div>
<div class="wrapper row3 rows">
  <main class="container clear">
    <table class="table">
      <tr>
        <td class="text-center inline">
         비밀번호:<input type=password size=20 class="input-sm" ref="pwd" v-model="pwd">
        </td>
      </tr>
      <tr>
        <td class="text-center">
          <input type=button value="삭제" class="btn btn-sm btn-danger" v-on:click="del()">
          <input type=button value="취소" class="btn btn-sm btn-danger"  onclick="javascript:history.back()">
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
		  pwd:''
	  },
	  methods:{
		  del:function(){
			 let _this=this
			 axios.get('/customer/delete_vue.do',{
				 params:{
					 nno:this.nno,
					 pwd:this.pwd
				 }
			 }).then(function(response){
				 if(response.data==='yes')
				 {
					 location.href="/customer/list"
				 }
				 else
				 {
				     alert("비밀번호가 틀립니다!!")
				     _this.pwd='';
				     _this.$refs.pwd.focus();
				 }
			 })
		  }
	  }
})
</script>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>