<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../fragments/head.jsp"/>
<style>
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

    .s21_top_tbox_right {
        float: right;
        width: 58%;
        margin-right: 0%;
    }

    .s21_top_cal {
        float: left;
        width: 97%;
        margin: 20px 0 0 3%;
    }

    .s21_tour_list {
        width: 100%;
        margin: 40px auto 40px auto;
    }

    .area {
        max-width: 1200px ! important;
        min-width: 1260px ! important;
    }

    .s21_tour_list_box {
        width: 100%;
        margin: 0 0% 0 0%;
        border: 0px solid #000;
    }

    a {
        cursor: pointer;
        color: #666;
        text-decoration: none;
    }

    .s21_tour_list_photo dt {
        float: left;
        width: 65.5%;
    }

    .s21_tour_list_conts {
        float: left;
        width: 28%;
        margin: 20px 4.5% 0 0;
        padding: 1%;
        border: 1px solid #fff;
    }

    .s21_tour_list_photo {
        width: 100%;
    }

    .s21_tour_list_photo dt img {
        height: 350px;
    }

    .s21_tour_list_photo img {
        width: 350px;;
    }

    .s21_tour_list_tbox {
        width: 100%;
        margin: 10px 0 0 0;
        display: inline-block;
    }

    .s21_tour_list_tbox h4 {
        height: 30px;
        line-height: 35px;
        font-size: 20px;
        color: #585858;
        text-align: left;
        padding-left: 40px;
        width: 90%;
        font-weight: 500;
        text-overflow: ellipsis;
        word-break: break-all;
        overflow: hidden;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
    }

    .s21_best_tip {
        background: url("http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/best/tip_ico.png") no-repeat;
        background-size: 25px 30px;
    }

    .s21_page {
        width: 100%;
        padding: 30px 0;
        display: inline-block;
        margin-top: 40px;
        margin-left: 0%;
        border-top: 1px solid #ebebeb;
    }

    .s21_pagination {
        display: inline-block;
    }

    .s21_pagination a.active {
        background-color: #333;
        border: 1px solid #333;
        color: #fff;
    }

    .s21_pagination a {
        float: left;
        font-size: 15px;
        padding: 12px 18px;
        text-decoration: none;
        transition: background-color .3s;
        margin: 0 4px;
    }

</style>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div class="wrapper row3 rows">
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
            <%-- <sec:authorize access="hasRole('ROLE_ADMIN')">
    <tr>
     <td>
      <a href="../notice/insert.do" class="btn btn-md" style="color:#f3f3f3;border-color: rgba(255, 255, 255, 0.2);background-color:transparent">새글</a>
     </td>
    </tr>
     </sec:authorize> --%>
        </div>
    </div>
</div>
  <main class="container clear">
<div style="height: 20px"></div>
   <table class="table">
    <tr>
     <th width=20%>제목</th>
     <td width=80%><input type=text size="55" class="input-sm" v-model="title"></td>
    </tr>
    <tr>
     <th width=20%>내용</th>
     <td width=80%><textarea rows="10" cols="55" v-model="content"></textarea></td>
    </tr>
    <tr>
     <td colspan="2" class="text-center">
      <input type=button value="글쓰기" class="btn btn-sm" style="background-color: " v-on:click="write()">
      <input type=button value="취소" class="btn btn-sm" onclick="javascript:history.back()">
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
		   content:''
	   },
	   methods:{
		   write:function(){
			   let _this=this;
			   axios.get('/notice/insert_vue.do',{
				   params:{
					   name:this.name,
					   title:this.title,
					   content:this.content,
				   }
			   }).then(function(response){
				   location.href="../notice/list.do"
			   })
		   }
	   }
   })
 </script> 
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>