<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../fragments/head.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.pageTopWrap{
  position:relative;
  width:100%;
  padding: 0 0 0;
  margin: 0 0;
  background-color: white;
}
.pageNav ul{
  position:relative;
  left:250px;
  display: inline-block;
  text-align: center;
}
.pageNav ul li{
  margin: 0 auto;
  padding: 0;
  list-style: none;
  display: inline-block;
}
.pageNav ul li a{
  position: relative;
  display: block;
  margin: 0 5px;
  padding: 0 20px;
  height: 35px;
  line-height: 35px;
  font-size: 15px;
  font-weight: 500;
  background-color: #f3f3f3;
  color:#477A7B;
  list-style: none;
  border-radius: 50px;
}
.pageNav ul li a:hover{
  background-color: #477A7B;
  color: #fff;
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
  <div class="pageTopWrap">
   <nav class="pageNav">
    <ul id="navigation">
    <li>
      <a href="/">유머나라</a>
     </li>
     <li>
      <a href="/">여행후기</a>
     </li>
     <li>
      <a href="/">맛집추천</a>
     </li>
     <li>
      <a href="/">장소추천</a>
     </li>
     <li>
      <a href="/">내반려견</a>
     </li>
    </ul>
   </nav> 
  </div> 
  <div class="container containers">
  <div class="communityArea">
   <table class="table">
    <thead>
     <tr>
      <th width=10% class="text-center">번호</th>
      <th width=45% class="text-center">제목</th>
      <th width=15% class="text-center">이름</th>
      <th width=20% class="text-center">작성일</th>
      <th width=10% class="text-center">조회수</th>
     </tr>
    </thead>
    <tbody>
     <tr>
      <td width=10% class="text-center">{{vo.cno}}</td>
      <td width=45%><a :href="'../community/detail.do?no='+vo.cno">{{vo.title}}</a></td>
      <td width=15% class="text-center">{{vo.name}}</td>
      <td width=20% class="text-center">{{vo.dbday}}</td>
      <td width=10% class="text-center">{{vo.hit}}</td>
     </tr>
     <tr> 
      <td colspan="5" class="text-right">
       <input type=button value="이전" class="btn btn-sm btn-danger" v-on:click="prev()">
        {{curpage}} page / {{totalpage}} pages
       <input type=button value="다음" class="btn btn-sm btn-warning" v-on:click="next()">
      </td>
     </tr>
    </tbody>
   </table>
  </div>
  </div>
 </div>
</div>
<script>
new Vue({
	   el:'.containers',
	   data:{
	 	   community_list:[],
		   curpage:1,
		   totalpage:0
	   },
	   mounted:function(){
		   this.send()
	   },
	   methods:{
		   send:function(){
			   let _this=this
			   axios.get("http://localhost/web/community/list_vue.do",{
				   params:{
					   page:this.curpage
				   }
			   }).then(function(response){
				   console.log(response.data)
				   _this.community_list=response.data
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