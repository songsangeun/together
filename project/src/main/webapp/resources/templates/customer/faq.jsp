<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<jsp:include page="../fragments/head.jsp"/>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

.active, .accordion:hover {
  background-color: #ccc;
}

.panel {
  padding: 0 18px;
  background-color: white;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
}
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

/* Style the links inside the pill navigation menu */
.pill-nav a {
  display: inline-block;
  color: black;
  text-align: center;
  padding: 14px;
  text-decoration: none;
  font-size: 17px;
  border-radius: 5px;
  
}

/* 마우스 올렸을 때 색상 변경 */
.pill-nav a:hover {
  background-color: #ddd;
  color: black;
}

/* Add a color to the active/current link */
.pill-nav a.active {
  background-color: dodgerblue;
  color: white;
  text-align: center;
}
</style>
<body>
<jsp:include page="../fragments/header.jsp"/>

<div>
 <div class="container">
  <div class="row">
   <table class="table" style="background-color: #dfe9e8;">
    <tr class="text-center">
    <td>
      <h1><b style="color:#477A78;">FAQ</h1>
      <p>투개더에서 자주 묻는 질문들을 모아모아~</p>
      
    </td>
    </tr>
    </table>
    <div class="container">
    <div class="row">
     <div class="pill-nav">
  <a class="active" href="#home">자주묻는질문</a>
  <a class="text-center" href="#news">이용안내</a>
  <a href="#contact">리뷰관리</a>
  <a href="#about">불편문의</a>

</div>
     <td>
<p></p>
<div id="home">
<button class="accordion">[회원] 소셜 로그인으로 가입은 어떻게 진행되나요?</button>
<div class="panal">
  <p>소셜로그인은 별도 정보 입력 없이 이미 가입된 소셜로그인 (카카오,네이버,구글)정보만 인증하여 간편하게 가입/로그인 하실 수 있는 서비스입니다. 로그인 혹은 회원가입 페이지에서 선택하신 소셜로그인을 통해 진행이 가능합니다 .
  </p>
</div>

<button class="accordion">[회원] 탈퇴했던 아이디로 다시 가입할 수 있나요?
</button>
<div class="panel">
  <p>탈퇴한 아이디는 재가입이 불가능합니다.</p>
</div>

<button class="accordion">[회원] 회원탈퇴는 어떻게 하나요?
</button>
<div class="panel">
  <p> [마이페이지] > 설정(회원명 옆 톱니바퀴 모양) > [회원탈퇴] 에서 탈퇴 가능합니다.(보류)
  </p>
</div>

<button class="accordion">[회원] 이미 소셜로그인으로 가입 및 연동을 하였으나 다른 소셜로그인으로 가입하고 싶어요</button>
<div class="panel">
  <p> 이미 소셜로그인(카카오, 네이버, 구글)으로 가입을 한 경우 마이페이지_회원탈퇴를 진행 후 다른 소셜로그인으로 가입이 가능하며, 기존 이메일 계정에 소셜로그인을 연동하여 사용하신 경우 연동한 소셜로그인으로 로그인 한 후 마이페이지_이메일 정보_연동해제를 진행 후 다른 소셜로그인으로 가입이 가능합니다.
다만, 기존 회원정보에 본인인증을 한 경우 동일 휴대폰번호로 본인인증이 불가능합니다.
  </p>
</div>

<button class="accordion">[이용안내] 고객센터에 전화 연결이 되지 않을 경우는 어떻게 해야 하나요?
</button>
<div class="panel">
  <p> 고객센터 상담 시간은 평일 오전 9시 ~ 오후 6시이며(점심시간 오후 12시 ~ 13시), 토요일/공휴일은 휴무입니다.
고객센터 상담 시간 이외 또는 상담량이 많아 전화 연결이 되지 않을 경우에는 [마이페이지 > 고객센터] 채팅 또는 1:1문의로 연락주시면 신속히 안내해 드리겠습니다.
  </p>
</div>

<button class="accordion">[불편문의] 투개더에 없는 장소가 있다면 어떻게 등록을 할 수 있나요?
</button>
<div class="panel">
  <p> 투개더가 알려드리지 못하고 있는 반려견과 동반이 가능한 장소가 많이 있습니다. 혹시라도 주변에 같이 갈 수 있는 동반 장소가 있는데
  	투개더에 없는 곳을 발견하신다면 많은 분들이 함께 아실 수 있도록 투개더에게 알려주세요!
  	
  	> 1:1 문의에서 문의유형 "장소추가" 선택 후 글 작성
  </p>
</div>

<button class="accordion">[이용문의] '찜하기'한 장소는 어디서 볼 수 있나요?
</button>
<div class="panel">
  <p> [마이페이지] > 설정(회원명 옆 톱니바퀴 모양) > [회원탈퇴] 에서 탈퇴 가능합니다.
  </p>
</div>

<button class="accordion">[리뷰관리] 내가 작성한 리뷰들은 어디서 보나요?
</button>
<div class="panel">
  <p> 로그인 후 메뉴의 방문후기를 클릭하면 작성한 장소들의 리뷰가 리스트로 보여집니다.
  </p>
</div>

<button class="accordion">[회원] 회원탈퇴는 어떻게 하나요?
</button>
<div class="panel">
  <p> [마이페이지] > 설정(회원명 옆 톱니바퀴 모양) > [회원탈퇴] 에서 탈퇴 가능합니다.
  </p>
</div>
</div>
<div id="news">
<button class="accordion">[리뷰관리] 내가 작성한 리뷰들은 어디서 보나요?
</button>
<div class="panel">
  <p> 로그인 후 메뉴의 방문후기를 클릭하면 작성한 장소들의 리뷰가 리스트로 보여집니다.
  </p>
</div>
<button class="accordion">[리뷰관리] 내가 작성한 리뷰들은 어디서 보나요?
</button>
<div class="panel">
  <p> 로그인 후 메뉴의 방문후기를 클릭하면 작성한 장소들의 리뷰가 리스트로 보여집니다.
  </p>
</div>
<button class="accordion">[리뷰관리] 내가 작성한 리뷰들은 어디서 보나요?
</button>
<div class="panel">
  <p> 로그인 후 메뉴의 방문후기를 클릭하면 작성한 장소들의 리뷰가 리스트로 보여집니다.
  </p>
</div>
<button class="accordion">[리뷰관리] 내가 작성한 리뷰들은 어디서 보나요?
</button>
<div class="panel">
  <p> 로그인 후 메뉴의 방문후기를 클릭하면 작성한 장소들의 리뷰가 리스트로 보여집니다.
  </p>
</div>
<button class="accordion">[리뷰관리] 내가 작성한 리뷰들은 어디서 보나요?
</button>
<div class="panel">
  <p> 로그인 후 메뉴의 방문후기를 클릭하면 작성한 장소들의 리뷰가 리스트로 보여집니다.
  </p>
</div>
</div>
<div id="contact">
 <button class="accordion">[리뷰관리] 내가 작성한 리뷰들은 어디서 보나요?
</button>
<div class="panel">
  <p> 로그인 후 메뉴의 방문후기를 클릭하면 작성한 장소들의 리뷰가 리스트로 보여집니다.
  </p>
</div>
<button class="accordion">[리뷰관리] 내가 작성한 리뷰를 삭제하고 싶어요!
</button>
<div class="panel">
  <p> 마이페이지나 리뷰를 썼던 페이지에서 삭제가 가능합니다.
  </p>
</div>
<button class="accordion">[리뷰관리] 리뷰 작성시 중간 저장을 할 수 있나요?
</button>
<div class="panel">
  <p> 리뷰 작성시 중간 저장 기능은 따로 있지 않습니다!
  </p>
</div>
<button class="accordion">[리뷰관리] 
</button>
<div class="panel">
  <p> [마이페이지] > 설정(회원명 옆 톱니바퀴 모양) > [회원탈퇴] 에서 탈퇴 가능합니다.(보류)
  </p>
</div>
</div>

     </td>
    </tr>
  </div>
 </div>
</div>
<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}

</script>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>