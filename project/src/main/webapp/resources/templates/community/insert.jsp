<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../fragments/head.jsp"/>

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
.container{
   margin-top: 30px;
}
.row{
   margin: 0px auto;
   width:1000px;
}
h1{
   text-align: center;
} 
/* .select_box{
   background-color: #dfe9e8;
   color: #477A7B;
} */
.btn1{
   /* background-color: #FFF0F0; */
   /* color: #fff; */
    /* border-color: #FFBCB9; */
   padding: 0 10px;
   display :inline-block;
   text-align: center;
   cursor: pointer;
   font-weight: 500;
   line-height: 50px;
   width: 200px;
   background-color:transparent;
}
.btn2{
 /*  background-color: #fff; */
   /* color: #477a7b; */
   /* border: 1px solid #477a7b; */
   padding: 0 10px;
   display :inline-block;
   cursor: pointer;
   font-weight: 500;
   line-height: 50px;
   width: 200px;
   background-color:transparent;
}
#addBtn{
  background-color: #7FFFD4;
}
#removeBtn{
  background-color: #AFFFEE;
}
/* .row rows{
  width:700px;
} */
</style>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> -->
</head>
<body>
<jsp:include page="../fragments/header.jsp"/>
   <div class="s21_best_m_top pr">
    <div class="s21_top_tbox">
        <div class="s21_top_tbox_left">
            <h3 class=""><span>투개더 커뮤니티</span></h3>
            <p class="s21_h3_line_l"></p>
            <p class="s21_h3_text_l">하트독에서 우리 반려견에 대한 이야기를 공유해보세요.</p>
            <!-- <form id="frmSetData" name="frmSetData" method="POST" onsubmit="return false;">
                <input type="hidden" id="m2Code" name="m2Code" value="tip">
                <input type="hidden" id="mode" name="mode" value="tiplist">
                <input type="hidden" id="page" name="page" value="0">
                
    				<button type="button" class="button">눈물</button>
                
            </form> -->
            
        </div>
    </div>
</div>

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











