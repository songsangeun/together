<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../fragments/head.jsp"/>

<style type="text/css">
.container{
	margin-top:50px;
}
.row{
	margin:0px auto;
	width: 900px;
}
h1{
	text-align: center;
}
.plusBtn{
 background: #b88ce9;
    color: #fff;
    border: 1px solid #b88ce9;
    float: center;
}
.plusBtn:hover{
	
    color: #c68ce9;
    background: #F7F9F9;
    border-color: #c68ce9;
}



.pageNav {
    position: relative;
    margin: 0 auto 30px;
    padding: 10px 0;
    
}

.pageNav ul {
    margin: 0 auto;
    padding: 0 10px;
    list-style: none;
    text-align: center;
    font-size: 0;
    
}

.pageNav ul li {
    margin: 0 auto;
    padding: 0;
    list-style: none;
    display: inline-block;
}

.pageNav ul li a {
    position: relative;
    display: block;
    margin: 0 5px;
    padding: 0 20px;
    height: 35px;
    line-height: 35px;
    font-size: 15px;
    font-weight: 500;
    background: #f3f3f3;
    color: #c68ce9;
    list-style: none;
    border-radius: 50px;
}

.pageNav ul li a:hover,.pageNav ul li.active a {
    background: #c68ce9;
    color: #fff;
}


.p-5{
	padding: 2rem!important;
}
.s21_best_m_top {
     width: 100%;
        background-color:#ff9b8e; 
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
</head>

<body>
<jsp:include page="../fragments/header.jsp"/>

<div id="wrap">

 <div class="wrapper row3 rows">
 <div class="s21_best_m_top pr">
    <div class="s21_top_tbox">
        <div class="s21_top_tbox_left">
            <h3 class=""><span>투개더 고객센터</span></h3>
            <p class="s21_h3_line_l"></p>
            <p class="s21_h3_text_l">투개더에 궁금한 점이 있으신가요?</p>
            <div style="width: 2px"></div>
            
            <td>
      <sec:authorize access="isAuthenticated()">
       <a href="/customer/insert" class="plusBtn">문의 작성하기</a>
      </sec:authorize>
     </td>
     <div class="pageNav">
      <ul>
        <li class="active">
          <a href="/customer/list">고객센터</a>
        </li>
        <li>
          <a href="/community/list.do">커뮤니티</a>
        </li>
        <li>
          <a href="/customer/faq">FAQ</a>
        </li>
        <li>
          <a href="/notice/list.do">공지사항</a>
        </li>
       </ul>
     </div>
     
        </div>
    </div>
</div>
  <main class="container clear">
   <div class="pageTopWrap">
   
     <!-- <div class="pageTitle">고객센터</div> 
     <!--  <div class="p-0 container-fluid">
    <div class="text-center" style="background: url('http://appdata.hungryapp.co.kr/images/hatdog/img/pc_img/album/top_bgr.png')">
        <div class="container">
                <div class="p-5">
                    <h1 class="text-light">
                        <strong>투개더 고객센터</strong>
                    </h1>
                    <p class="text-light mt-3">
                        투개더에 궁금한 점이 있으신가요?
                        <br/>
                        <tr>
     
    </tr>    
                    </p>

                </div>
                                         
        </div>
    </div>
</div>
     -->

   </div>

   <table class="table">
     <thead>
     	
       <tr>
         <th width=10% class="p-4 text-center">번호</th>
         <th width=15% class="p-4 text-center">작성자</th>
         <th width=35% class="p-4 text-center">제목</th>
         <th width=20% class="p-4 text-center">작성일</th>
         <th width=20% class="p-4 text-center">조회수</th>
       </tr>
     </thead>
     <tbody>
       <tr v-for="vo in cs_list">
         <td width=10% class="p-4 text-center">{{vo.nno}}</td>
         <td width=15% class="p-4 text-center">{{vo.name}}</td>
         <td width=35% class="p-4"><a :href="'/customer/detail?nno='+vo.nno">{{vo.subject}}</a></td>
         <td width=20% class="p-4 text-center">{{vo.dbday}}</td>
         <td width=20% class="p-4 text-center">{{vo.hit}}</td>
       </tr>
      


     </tbody>
   </table>
           <div class="mt-5">
        <div class="d-flex justify-content-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <div>
                        <li class="page-item disabled" v-if="isFirst">
                            <button class="page-link" type="button" v-on:click="prevPage()">&laquo;</button>
                        </li>
                        <li class="page-item" v-else>
                            <button class="page-link" type="button" v-on:click="prevPage()">&laquo;</button>
                        </li>
                    </div>
                    <div class="p-2 d-flex justify-content-center">
                        {{ page }} / {{ totalPage }}
                    </div>
                    <div>
                        <li class="page-item disabled" v-if="isLast">
                            <button class="page-link" type="button" v-on:click="nextPage()">&raquo;</button>
                        </li>
                        <li class="page-item" v-else>
                            <button class="page-link" type="button" v-on:click="nextPage()">&raquo;</button>
                        </li>
                    </div>
                </ul>
            </nav>
        </div>
    </div>
   </main>
  </div>
  </div>
<script>
  new Vue({
	 el:'.rows',
	 data:{
		 page:1,
		 totalCount:'',
		 totalPage:'',
		 isFirst:'',
		 isLast:'',
		 cs_list: []
		 
		 
	 },
	 mounted:function(){
		 this.send(1)
		 
	 },
	 methods:{
		 send:function(page){
			 let _this=this
			 axios.get("/customer/list_vue.do",{
				 params:{
					 page:page
				 }
			 }).then(function(response){
				 console.log(response.data)
				 _this.cs_list=response.data.items
                 _this.totalCount = response.data.totalItem;
                 _this.page = response.data.page;
                 _this.isFirst= response.data.first;
                 _this.isLast= response.data.last;
                 _this.totalPage = response.data.totalPage;
			 }) 	
		 },
		 nextPage: function () {
             this.page = this.page + 1;
             this.send(this.page);
         },
         prevPage: function () {
             this.page = this.page - 1;
             this.send(this.page);
         }
		 
	 }
  })
</script>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>