<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../fragments/head.jsp"/>
<style>

/* 전체 */
.container{
	float: left;
	text-align: center;
	width: 100%;
	margin: 0px auto 70px auto;
	border: 0px solid #000;
}
*{
	font-family: 'Cafe24Ssurround';
}
div{
	display: block;
}
body{
	font-size: 12px;
	color: #666;
}

.top{
	width: 100%;
	background-color: #85F2AE;
	min-height: 200px;
	background-size: 100%
}
.pr{
	position: relative;
}

/* 베스트팁 상단 */
.top h3{
	width: 100%;
	text-align: center;
	color: #fff;
	font-size: 45px;
	font-weight: 300;
	padding: 40px 0 0 0;
	letter-spacing: -0.03em;
}

.top h3 span{
	color: #fff;
	font-size: 45px;
	font-weight: 600;
}

.search_box{
	width: 100%;
	margin: 0px auto;
	text-align: center;
	height: 70px;
	z-index: 1;
}

.search_title{
	top: -35px;
	width: 100%;
	background: #fff;
	border-radius: 40px;
	height: 70px;
	line-height: 70px;
	font-size: 20px;
}
.pa{
	position: absolute;
}
.search_title span{
	padding-left: 35px;
	background-size: 24px ! important;
}

/* list */
.list_area{
	width: 100%;
	margin: 40px auto 40px auto;
}
.area{
	max-width: 1200px ! important;
	min-width: 1260px ! important;
}
.list_box{
	width: 100%;
	margin: 0 0% 0 0%;
	border: 0px solid #000;
}

</style>
<!-- //////////////// 스타일 끝 //////////////// -->

<body>
<jsp:include page="../fragments/header.jsp"/>
<div class="container">
 <div class="top pr">
  <h3>투개더
  <span>Best tip</span>
  </h3>
 </div>
 <div class="search_box">
   <div class="search_title pa">
     <span class="best_tip_title">{{vo.title}}</span>
   </div>
 </div>
 <div class="list_area area pr">
   <div class="list_box">
     <div class="prev_btn"><a href="#"><img src="" alt="이전"></a></div>
     <div class="next_btn"><a href="#"><img src="" alt="다음"></a></div>
     <p class="content_posters">
       <img :src="(vo,index) in contents" style="max-width:100%">
     </p>
   </div>
 <div class="comments_area">
   <div class="comments">
     <h5>
     "댓글"
     <span id="total">{{comments.count}}</span>
     <form>
       <div class="write">
         <textarea id="writecomment" placeholder="댓글을 입력해주세요."></textarea>
          <span class="form_btn">
          <div class="register_area">
           <span class="register_btn" style="margin-right: 5px;">
             <a>등록</a>
           </span>
         </div>
        </span>
        <div class="comments_list" id="comments_list">
          <div class="comments_list_pr">
            <p><img src="" style="width:50px; height:50px"></p>
            <dl>
             <dt>
               {{vo.mno}}
               <span>{{vo.created_at}}</span>
             </dt>
             <dd>
               <span id="commts_contents">{{vo.content}}</span>
             </dd>
            </dl>
            <div class="comments_comments">
              <a onclick="reply">댓글</a>
            </div>
          </div>
        </div> 
       </div>
     </form>
     </h5>
   </div>
 </div>
 <div class="page_done">
  <div class="paging" id="pagenav">
    <a class="active">1</a>
  </div>
 </div>
 </div>
</div>
<jsp:include page="../fragments/footer.jsp"/>

<script>
  new Vue({
	  el:'',
	  data:{
		  
	  }
  })
</script>
</body>
</html>