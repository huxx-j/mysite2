<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>mysite</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <link href="/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="container">

    <c:import url="/WEB-INF/views/includes/header.jsp"/>
    <c:import url="/WEB-INF/views/includes/navigation.jsp"/>


    <div id="content">
        <div id="board" class="board-form">
            <table class="tbl-ex">
                <tr>
                    <th colspan="2">글보기</th>
                </tr>
                <tr>
                    <td class="label">제목</td>
                    <td>${boardVO.title}
                    </td>
                </tr>
                <tr>
                    <td class="label">내용</td>
                    <td>
                        <div class="view-content">
                            ${boardVO.content}
                        </div>
                    </td>
                </tr>
            </table>
            <div class="bottom">
                        <c:choose>
                            <c:when test="${boardVO.userNo eq authUser.no}">
                                <a href="/board/list?&crtPage=${param.crtPage}&kwd=${param.kwd}">글목록</a>
                                <a href="/board/modifyform?crtPage=${param.crtPage}&no=${boardVO.no}&kwd=${param.kwd}">글수정</a>
                            </c:when>
                            <c:otherwise>
                                <a href="/board/list?&crtPage=${param.crtPage}&kwd=${param.kwd}">글목록</a>
                            </c:otherwise>
                        </c:choose>
            </div>
        </div>
    </div>

    <c:import url="/WEB-INF/views/includes/footer.jsp"/>

</div>
</body>
</html>