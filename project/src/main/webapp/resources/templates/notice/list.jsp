<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../fragments/head.jsp"/>

<style type="text/css">
.button2{
  /* background-color:#82EB5A; */
  background-color:transparent;
  border: 1px solid;
  color: #666666;
  /* border-color: #8CF064;  */ 
  border-radius: 50px;
}
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
<div class="s21_best_m_top pr">
    <div class="s21_top_tbox">
        <div class="s21_top_tbox_left">
            <h3 class=""><span>투개더 공지사항</span></h3>
            <p class="s21_h3_line_l"></p>
            <p class="s21_h3_text_l">하트독에서 새로운 소식을 알려드립니다.</p>
            <!-- <form id="frmSetData" name="frmSetData" method="POST" onsubmit="return false;">
                <input type="hidden" id="m2Code" name="m2Code" value="tip">
                <input type="hidden" id="mode" name="mode" value="tiplist">
                <input type="hidden" id="page" name="page" value="0">
                
    				<button type="button" class="button">눈물</button>
                
            </form> -->
            <sec:authorize access="hasRole('ROLE_ADMIN')">
    <tr>
     <td>
      <a href="../notice/insert.do" class="btn btn-md" style="color:#f3f3f3;border-color: rgba(255, 255, 255, 0.2);background-color:transparent">새글</a>
     </td>
    </tr>
     </sec:authorize>
        </div>
    </div>
</div>
<div class="wrapper row3 rows">
  <main class="container clear">
   <div style="height: 20px"></div>
   <table class="table">
    <thead>
     <tr> 
      <th width=10% class="text-center">번호</th>
      <th width=45% class="text-center">제목</th>
      <th width=20% class="text-center">작성일</th>
      <th width=10% class="text-center">조회수</th>
     </tr>
    </thead>
    <tbody>
     <tr v-for="vo in notice_list"> 
      <td width=10% class="text-center">{{vo.nno}}</td>
      <td width=45%><a :href="'../notice/detail.do?nno='+vo.nno">{{vo.title}}</a></td>
      <td width=20% class="text-center">{{vo.dbday}}</td>
      <td width=10% class="text-center">{{vo.hit}}</td>
     </tr>
     <tr> 
      <td colspan="5" class="text-right">
       <input type=button value="이전" class="button2" v-on:click="prev()">
        <span style="color:#666666">{{curpage}} page / {{totalpage}} pages</span>
       <input type=button value="다음" class="button2" v-on:click="next()">
      </td>
     </tr>
    </tbody>
   </table>
  </main>
 </div>
 <script>
   new Vue({
	   el:'.rows',
	   data:{
	 	   notice_list:[],
		   curpage:1,
		   totalpage:0
	   },
	   mounted:function(){
		   this.send()
	   },
	   methods:{
		   send:function(){
			   let _this=this
			   axios.get("/notice/list_vue.do",{
				   params:{
					   page:this.curpage
				   }
			   }).then(function(response){
				   console.log(response.data)
				   _this.notice_list=response.data
				   _this.curpage=response.data[0].curpage
				   _this.totalpage=response.data[0].totalpage
			   }) 
		   },
		   prev:function(){
			   this.curpage=this.curpage>1?this.curpage-1:this.curpage
			   this.send()
		   },
		   next:function(){
			   this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage
			   this.send()
		   }
	   }
   })
 </script> 
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>