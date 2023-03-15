<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header>
    <div class="header-area ">
        <div id="sticky-header" class="main-header-area">
            <div class="container">
                <div>
                    <div>
                        <div class="main-menu d-none d-lg-inline">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="justify-content-start">
                                    <a href="/">
                                        <h1>LOGO</h1>
                                    </a>
                                </div>
                                <nav class="d-flex justify-content-center">
                                    <ul id="navigation">
                                        <li class="m-0">
                                           <a href="../place/place_list.do">여행지정보</a>
                                        </li>
                                        <li>
                                            <a href="/">여행앨범
                                                <i class="ti-angle-down"></i>
                                            </a>
                                            <ul class="submenu">
                                                <li>
                                                    <a href="/">여행노트</a>
                                                </li>
                                                <li>
                                          <a href="../notice/list.do">공지사항</a>
                                        </li>
                                            </ul>
                                        </li>
                                        <li><a href="../community/list.do">커뮤니티 <i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li>
                                                    <a href="/besttip/list">베스트팁</a>
                                                </li>
                                                <li>
                                                    <a href="/review/review_list">리뷰모음</a>
                                                </li>
                                                <li>
                                                    <a href="/">Q&A</a>
                                                </li>
                                                <li>
                                                    <a href="/customer/faq">FAQ</a>
                                                </li>
                                                 <li>
                                                    <a href="/customer/list">고객센터</a>
                                                </li>
                                                
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                                <div class="d-flex justify-content-end">
                                    <sec:authorize access="isAuthenticated()">
                                        <ul>
                                            <li class="m-0">
                                                <a href="/member/mypage">
                                                    <sec:authentication property="principal.nickname"/>
                                                    <i class="ti-angle-down"></i>
                                                </a>
                                                <ul class="submenu">
                                                    <li>
                                                        <a href="/member/mypage">마이페이지</a>
                                                    </li>
                                                    <hr class="m-0">
                                                    <li>
                                                        <a href="#" class="text-danger small" onclick="document.getElementById('logout-form').submit()">로그아웃</a>
                                                        <form class="m-0" id="logout-form" action="/member/logout" method="post"></form>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </sec:authorize>
                                    <sec:authorize access="isAnonymous()">
                                        <ul>
                                            <li class="m-0">
                                                <a href="/member/login">로그인</a>
                                            </li>
                                            <li class="ml-2">
                                                <a href="/member/signup">회원가입</a>
                                            </li>
                                        </ul>
                                    </sec:authorize>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>