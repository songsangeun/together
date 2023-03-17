<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../fragments/head.jsp"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">


.wBtn{
    background: #477a7b;
    color: #fff;
    border: 1px solid #477a7b;
    height: 50px;
    line-height: 50px;
    padding: 0 10px;
    width: 50%;
    display: block;
    text-align: center;
    cursor: pointer;
    float: left;
    clear:both;
}
.cBtn{
	background: #fff;
	color:#477a7b;
	display:block;
	border: 1px solid #477a7b;
	height: 50px;
	line-height:50px;
	padding: 0 10px;
	width: 50%;
	text-align:text-center;
	cursor:pointer;
}
body{
	display: block;
}

.select_box{
   background-color: #dfe9e8;
   color: #477A7B;
}


.Wbtn:hover {
    color: #477a7b;
    background: #F7F9F9;
    border-color: #477a7b;
}

.btnB.inlineblock,.btnW.inlineblock {
    display: inline-block;
    width: auto;
    vertical-align: middle;
}

.postBtn {
    height: 40px;
    line-height: 40px;
    font-size: 12px;
}

@media only screen and (max-width: 900px)
.btnB, .btnW{
	height:40px;
	line-height:40px;
	
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let fileIndex=0;
$(function(){
	$('#addBtn').click(function(){
		$('#user-table').append(
		'<tr id="m'+(fileIndex)+'">'
		+'<td width="20%">File '+(fileIndex+1)+'</td>'
		 +'<td width="80%"><input type=file name=files['+fileIndex+']></td>'
		 +'</tr>'
		)
		fileIndex++;
	})
		$('#removeBtn').click(function(){
		if(fileIndex>0)
	    {
			$('#m'+(fileIndex-1)).remove();
			fileIndex--;
	    }
		
	})
	
})
</script>
</head>
<body>
<jsp:include page="../fragments/header.jsp"/>

 <!--<div class="wrapper row3 rows">
  <main class="container clear">
   <table class="table">
    <tbody>
 <tr>
<th scope="row">제목</th>
<td> <select id="subject" name="subject" fw-filter="isFill" fw-label="제목" fw-msg=""  >
<option value="[회원] 상품관련 문의 드립니다.">[상품] 상품관련 문의 드립니다.</option>
<option value="[이용] 배송관련 문의 드립니다.">[배송] 배송관련 문의 드립니다.</option>
<option value="[광고] 입금관련 문의 드립니다.">[입금확인] 입금관련 문의 드립니다.</option>
<option value="[추천] 주문취소 문의 드립니다. ">[주문취소] 주문취소 문의 드립니다. </option>
</select>  
</td>
</tr> 

<tr>

</tr>
</tbody>
<tbody class="">-->
<div class="wrapper row3 rows">
  <main class="container">
    <table class="table">
    <tr>
        <th width=100%>문의유형</th>
         <td width=85%>
          <select class="select_box" name="type" style="width:100%;height:35px;border:none">
           <option value="cs_user">이용관련문의</option>
           <option value="cs_loca">장소관련문의</option>
           <option value="cs_ad">광고관련문의</option>
           <option value="cs_my">회원관련문의</option>
          </select>
         </td>
       </tr>
      <tr>
        <th width=20%>작성자</th>
        <td width=80%><sec:authentication property="principal.nickname"/></td>
      </tr>
      <tr>
        <th width=20%>제목</th>
        <td width=80%><input type=text size="55" class="input-sm" v-model="subject"></td>
      </tr>
      <tr>
        <th width=20%>내용</th>
        <td width=80%><textarea rows="10" cols="105" v-model="content"></textarea></td>
      </tr>
      <tr>
<th scope="row">첨부파일1</th>
                    <td><input name="attach_file[]" type="file"  /></td>
                </tr>
<tr>
<th scope="row">첨부파일2</th>
                    <td><input name="attach_file[]" type="file"  /></td>
                </tr>

</tbody>
<tbody>

<tr class="">
<th scope="row">비밀글설정</th>
                    <td><input id="secure0" name="secure" fw-filter="isFill" fw-label="비밀글설정" fw-msg="" value="F" type="radio" checked="checked"  /><label for="secure0" >공개글</label>
<input id="secure1" name="secure" fw-filter="isFill" fw-label="비밀글설정" fw-msg="" value="T" type="radio"  /><label for="secure1" >비밀글</label></td>
                </tr>

      <tr>
        <th width=20%>비밀번호</th>
        <td width=80%><input type=password size="10" class="input-sm" v-model="pwd"></td>
      </tr>
      
      <tr>
        <td colspan="2" class="text-center">
         <input type=submit value="글쓰기" class="wbtn" v-on:click="write()">
         <input type=button value="취소" class="cBtn" onclick="javascript:history.back()">
        </td>
      </tr>
      <tr>
      <td>
         
      
      <!-- <div class="ec-base-button">
      <div class="clear"></div>
      <a href="#" class="per_50 cBtn">취소</a>
      <a href="#" class="per_50 wBtn" v-on:click="BOARD_WRITE.form_submit('boardWriteForm');">등록</a>
      </div> -->
      </td>
      </tr>
      </tbody>
     </table>
            
   </main>
  </div>

  </body>
<script>
  new Vue({
	  el:'.rows',
  	  data:{
  		  name:'',
  		  subject:'',
  		  content:'',
  		  pwd:''
  	  },
  	  methods:{
  		  write:function(){
  			  let _this=this;
  			  let data = {
  					name:this.name,
					  subject:this.subject,
					  content:this.content,
					  pwd:this.pwd
  					  
  			  }
  			  if(this.pwd===''){
  				alert("비밀번호를 입력해주세요");
				  return false;
  			  }
  			  axios.post('/customer/insert_vue.do',JSON.stringify(data),{
  				  headers:{
  					  "content-type":'application/json'
  				  }
  				  
  			  }).then(function(response){
  				  location.href="/customer/list"
  			  })
  		  }
  	  }
  })
</script>
<jsp:include page="../fragments/footer.jsp"/>

</html>