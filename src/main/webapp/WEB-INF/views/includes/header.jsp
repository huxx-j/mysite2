<%@ page import="com.huxx.vo.UserVO" %><%--
  Created by IntelliJ IDEA.
  User: Huxx_j
  Date: 2018. 4. 19.
  Time: 오전 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="header">
    <h1>MySite</h1>
    <ul>
        <c:choose>
            <c:when test="${empty authUser}">
                <li><a href="/user/loginform">로그인</a></li>
                <li><a href="/user/joinform">회원가입</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="/user/modifyform">회원정보수정</a></li>
                <li><a href="/user/logout">로그아웃</a></li>
                <li>${authUser.name}님 안녕하세요^^;</li>
            </c:otherwise>
        </c:choose>

    </ul>
</div>
<!-- /header -->
