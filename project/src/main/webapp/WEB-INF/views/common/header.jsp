<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* 네비게이션 바 */
.navbar {
    background-color: #ffffff;
    border-bottom: 1px solid #e0e0e0;
    position: fixed;
    width: 100%;
    top: 0;
    left: 0;
    z-index: 1000;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 30px;
    box-sizing: border-box;
    height: 80px;
}
.navbar .logo a {
    font-size: 1.5em;
    font-weight: bold;
    color: #333333;
    text-decoration: none;
}

.navbar .menu {
    display: flex;
    gap: 20px;
}

.navbar .menu a {
    color: #333333;
    text-decoration: none;
    padding: 10px;
    font-weight: bold;
}

.navbar .menu a:hover {
    color: #e71a0f;
}
.navbar a {
    color: #333333;
    text-decoration: none;
    padding: 10px;
    font-weight: bold;
}

.navbar a:hover {
    color: #e71a0f;
}
</style>
</head>
<body>
	 <!-- 네비게이션 바 -->
    <nav class="navbar">
        <div class="logo">
           <a href="<c:url value="/main/home"/>">KH CINEMA</a>
        </div>
		<div class="menu">
    		<!-- 비로그인 상태에서 회원가입과 로그인 버튼 표시 -->
			<c:if test="${user == null}">
				<a href="<c:url value="/guest/signup"/>">회원가입</a>
	        	<a href="<c:url value="/guest/login"/>">로그인</a>
			</c:if> 
   		 	<!-- 로그인 상태에서 로그아웃 버튼 표시 -->

		    <c:if test="${user != null }">
	        	<a href="<c:url value="/refund/ticketingList"/>">환불</a>
	        	<a href="<c:url value="/member/logout"/>">로그아웃</a>
		    </c:if>    
    		<!-- 관리자 로그인 시 영화 등록 버튼 표시 -->
       			<a href="<c:url value="/main/movieregistration"/>">영화 등록</a>
   			<c:if test="${isAdmin}">
   			</c:if>
		</div>
    </nav>
</body>
</html>
