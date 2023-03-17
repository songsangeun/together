<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../fragments/head.jsp"/>
<style type="text/css">
.btn3{
  position: relative;
  margin: 0 5px; 
  padding: 0 20px;
  height: 35px;
  line-height: 35px;
  font-size: 15px;
  font-weight: 500;
  background-color: #477A7B;
  color:#f3f3f3;
  list-style: none;
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
 <div class="container">
  <div style="height: 20px"></div>
<div class="wrapper row3 rows">
  <main class="container clear">
    <table class="table">
      <tr>
        <th width="20%" class="text-center">번호</th>
        <td width="30%" class="text-center">{{community_detail.cno}}</td>
        <th width="20%" class="text-center">이름</th>
        <td width="30%" class="text-center">{{community_detail.name}}</td>
      </tr>
      <tr>
        <th width="20%" class="text-center">제목</th>
        <td colspan="3">{{community_detail.title}}</td>
      </tr>
      <tr>
        <td><img :src="'/image/upload/'+community_detail.filename" style="width:250px;height:250px"></td>
        <td colspan="4" class="text-left" valign="top" height="200"><pre style="white-space: pre-wrap;background-color: white;border: none;">{{community_detail.content}}</pre></td>
      </tr>
      <tr>
        <th width="20%" class="text-center">파일크기</th>
        <td width="30%" class="text-center">{{community_detail.filesize}}</td>
        <th width="20%" class="text-center">파일이름</th>
        <td width="30%" class="text-center">{{community_detail.filename}}</td>
      </tr>
      <tr>
        <th width="20%" class="text-center">작성일</th>
        <td width="30%" class="text-center">{{community_detail.dbday}}</td>
        <th width="20%" class="text-center">조회수</th>
        <td width="30%" class="text-center">{{community_detail.hit}}</td>
      </tr>
      <tr>
        <td colspan="4" class="text-right">
          <a :href="'../community/update.do?cno='+cno" class="btn btn-xs btn-default">수정</a>
          <a :href="'../community/delete.do?cno='+cno" class="btn btn-xs btn-default">삭제</a>
          <a href="../community/list.do" class="btn btn-xs btn-info">목록</a>
        </td>
      </tr>
    </table>
        <sec:authorize access="isAuthenticated()">
    <div class="form-group">
                <textarea class="form-control" id="exampleFormControlTextarea1" v-model="msg" rows="4"
                          placeholder="댓글을 입력해주세요."></textarea>
                <div class="mt-3 d-flex justify-content-end">
                    <button class="btn btn-outline-secondary" type="button" v-on:click="write()">등록</button>
                </div>
            </div>  
     </sec:authorize>
     <!-- 댓글 폼 -->
         <div class="row">
        <div class="col-md-4 p-3">
                <div class="card mb-3 border-0 shadow-sm" v-for="r in reply_list">
                    <div class="card-body mt-2 p-0">
                        <p class="card-text text-dark">{{r.msg}}</p>
                    </div>
                </div>
        </div>
    </div>
  </main>
</div>
</div>
<script>
  new Vue({
     el:'.rows',
     data:{ 
    	cmReply:{},
        cno:${cno},
        community_detail:{},
        msg:'',
        reply_list:[]
        },
     mounted:function(){
        let _this=this
        axios.get("/community/detail_vue.do",{
           params:{
              cno:this.cno
           }
        }).then(function(response){
        	console.log(response.data)
           _this.community_detail=response.data
        })
     },
     methods:{
		  list:function(){
			  let _this=this
			  this.cno=new URLSearchParams(location.search).get('cno')
			  axios.get('/community/reply',{
				  params:{
					 cno:this.cno
				  }
			  }).then(function(response){
				  console.log(response)
				  _this.reply_list=response.data
			  	  
			  })
		  },
		  write:function(){
			  let _this=this
			  this.cno=new URLSearchParams(location.search).get('cno')
			  let data={
				   cno:this.cno,
				   msg:this.msg
			  }
			  axios.post('/community/write',JSON.stringify(data),{
				  headers:{
					  'Content-type':'application/json'
				  }
			  }).then(function(response){
				  _this.msg=''
				  _this.list()
			  })
		  }
	  }
		  
})
</script>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>