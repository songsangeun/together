<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../fragments/head.jsp"/>

<style type="text/css">
.btn3{
  position: relative;
  /* display: block; */
  margin: 0 5px; 
  padding: 0 20px;
  height: 35px;
  /* line-height: 35px; */
  border-color: #FFBCB9;
  font-size: 15px;
  font-weight: 500;
  background-color:transparent;
  color:#666666; 
  list-style: none;
  border-radius: 50px;
} 
.button1{
  /* background-color:#FFE6E6; */
  border: 1px solid;
  color: #666666;
  /* border-color: #FFBCB9; */
  border-radius: 50px;
  background-color:transparent;
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
            <h3 class=""><span>투개더 커뮤니티</span></h3>
            <p class="s21_h3_line_l"></p>
            <p class="s21_h3_text_l">하트독에서 우리 반려견에 대한 이야기를 공유해보세요.</p>
            <!-- <form id="frmSetData" name="frmSetData" method="POST" onsubmit="return false;">
                <input type="hidden" id="m2Code" name="m2Code" value="tip">
                <input type="hidden" id="mode" name="mode" value="tiplist">
                <input type="hidden" id="page" name="page" value="0">
                
    				<button type="button" class="button">눈물</button>
                
            </form> -->
            <sec:authorize access="isAuthenticated()">
     <tr class="text-center">
      <td>
       <a href="../community/insert.do" class="btn btn-md" style="background-color:transparent;color:white;border-color: white">커뮤니티에 글쓰기</a>
      </td>
    </tr>
     </sec:authorize>
        </div>
    </div>
</div>
 <div class="container app">
<div style="height: 20px"></div>
    <div>
  <div class="row rows"> 
   <div class="inline text-center">
    <button class="btn3" v-on:click="change('humor')">유머나라</button>
    <button class="btn3" v-on:click="change('review')">여행후기</button>
    <button class="btn3" v-on:click="change('place')">장소추천</button>
    <button class="btn3" v-on:click="change('food')">맛집추천</button>
    <button class="btn3" v-on:click="change('mydog')">내반려견</button>  
   </div>  
  </div> 
  <div class="container containers">
  <div class="communityArea">
   <table class="table">
    <thead>
     <tr>
      <th width=5% class="text-center"></th>
      <th></th>
      <th width=15% class="text-center"></th>
      <th width=20% class="text-center"></th>
      <th width=15% class="text-center"></th>
      <th width=20% class="text-center"></th>
       <th width=10% class="text-center"></th>
     </tr>
    </thead>
    <tbody>
     <tr v-for="vo in community_list">
      <td width=10% class="text-center">{{vo.cno}}</td>
      <td><img :src="'/image/upload/'+vo.filename" style="width:150px;height:150px"></td>
      <td width=15% class="text-center">{{vo.type}}</td>
      <td width=20%><a :href="'../community/detail.do?cno='+vo.cno">{{vo.title}}</a></td>
      <td width=15% class="text-center">{{vo.name}}</td>
      <td width=20% class="text-center">{{vo.dbday}}</td>
      <td width=10% class="text-center">{{vo.hit}}</td>
     </tr>
     <tr> 
      <td colspan="5" class="text-center">
       <input type=button value="이전" class="button1" v-on:click="prev()">
        <span style="color: #666666">{{curpage}} page / {{totalpage}} pages</span>
       <input type=button value="다음" class="button1" v-on:click="next()">
      </td>
     </tr>
    </tbody>
   </table>
  </div>
  </div>
 </div>
<script>
 /*  new Vue({
	el:'.rows',
	data:{
		community_list:[],
		
		type:'humor'
	},
	methods:{
		change:function(type){
			let _this=this;
			axios.get("/community_change.do",{
				params:{
					type:type
				}
			}).then(function(response){
				console.log(response.data)
				_this.community_list=response.data
			})
		}
	}
	
})   */
new Vue({
	   el:'.app',
	   data:{
	 	   community_list:[],
		   curpage:1,
		   totalpage:0,
		   type:'review'
	   },
	   mounted:function(){
		   this.send()
	   },
	   methods:{
		   send:function(){
			   let _this=this
			   axios.get("/community/list_vue.do",{
				   params:{
					   page:_this.curpage,
					   type:this.type
				   }
			   }).then(function(response){
				   console.log(response.data)
				   _this.community_list=response.data
				   _this.curpage=response.data[0].curpage
				   _this.totalpage=response.data[0].totalpage
			   }) 
		   },
		   change:function(type){
			   //alert(type)
			   this.type=type
			   this.curpage=1
			   this.send()
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