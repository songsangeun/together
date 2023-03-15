<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../fragments/head.jsp"/>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div>
<div class="wrapper row3 rows" id="app">
  <main class="container clear">
    <table class="table">
      <tr>
        <th width=20% class="text-center">번호</th>
        <td width=30% class="text-center">${vo.nno}</td>
        <th width=20% class="text-center">작성일</th>
        <td width=30% class="text-center">${vo.dbday }</td>
      </tr>
      <tr>
        <th width=20% class="text-center">이름</th>
        <td width=30% class="text-center">${vo.name }</td>
        <th width=20% class="text-center">조회수</th>
        <td width=30% class="text-center">${vo.hit}</td>
      </tr>
      <tr>
        <th width=20% class="text-center">제목</th>
        <td colspan="3">${vo.subject }</td>
      </tr>
      <tr>
        <td colspan="4" class="text-left" valign="top" height="200"><pre style="white-space: pre-wrap;background-color: white;border: none">${vo.content}</pre></td>
      </tr>
      <tr>
        <td colspan="4" class="text-right">
        <sec:authentication property="principal.nickname" var="nickname"/>
          <c:if test="${vo.name eq nickname}">
          <a href="/customer/update?nno=${vo.nno }" class="btn btn-xs btn-danger" >수정</a>
          <a href="/customer/delete?nno=${vo.nno }" class="btn btn-xs btn-success">삭제</a>
          </c:if>
          <a href="/customer/list" class="btn btn-xs btn-info">목록</a>
          
        </td>
      </tr>
    </table>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
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
                <div class="card mb-3 border-0 shadow-sm">
                    <div class="card-body mt-2 p-0">
                        <p class="card-text text-dark">{{csReply.msg}}</p>
                    </div>
                </div>
        </div>
    </div>
  </main>
</div>
</div>
<script>
new Vue({
	  el:'#app',
	  data:{
		  csReply:{},
		  nno:'',
		  msg:''
	  },
	  mounted:function(){
		  this.list()

	  },
	  methods:{
		  list:function(){
			  let _this=this
			  this.nno=new URLSearchParams(location.search).get('nno')
			  axios.get('/customer/reply',{
				  params:{
					 nno:this.nno
				  }
			  }).then(function(response){
				  console.log(response)
				  _this.csReply=response.data
			  	  
			  })
		  },
		  write:function(){
			  let _this=this
			  this.nno=new URLSearchParams(location.search).get('nno')
			  let data={
				   nno:this.nno,
				   msg:this.msg
			  }
			  axios.post('/customer/write',JSON.stringify(data),{
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