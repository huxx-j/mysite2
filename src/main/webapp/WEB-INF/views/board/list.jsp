<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
        <div id="board">
            <form id="search_form" action="/board/list" method="get">
                <input type="hidden" name="num" value="1">
                <input type="text" id="kwd" name="kwd" value="">
                <input type="hidden" name="pc" value="1">
                <input type="submit" value="찾기">
            </form>
            <table class="tbl-ex">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>조회수</th>
                    <th>작성일</th>
                    <th>&nbsp;</th>
                </tr>
                <c:if test="${r_Map.list != null}">
                    <c:forEach items="${r_Map.list}" var="vo">
                        <tr>
                            <td>${vo.no}</td>
                            <td>
                                <a href="/board/view?no=${vo.no}&crtPage=${param.crtPage}&kwd=${r_Map.kwd}">${vo.title}</a>
                            </td>
                            <td>${vo.name}</td>
                            <td>${vo.hit}</td>
                            <td>${vo.date}</td>
                            <td>
                                <c:if test="${vo.userNo eq authUser.no}">
                                    <a href="/board/del?no=${vo.no}&userNo=${vo.userNo}"
                                       class="del">삭제</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
            <div class="pager">
                <ul>
                    <c:if test="${r_Map.prev}">
                        <li><a href="/board/list?&crtPage=${r_Map.startPageBtnNo-1}&kwd=${r_Map.kwd}">◀</a></li>
                    </c:if>

                    <c:forEach var="i" begin="${r_Map.startPageBtnNo}" end="${r_Map.endPageBtnNo}">
                        <li class="${param.crtPage eq i?'selected':''}"><a href="/board/list?crtPage=${i}&kwd=${r_Map.kwd}">${i}</a></li>
                    </c:forEach>

                    <c:if test="${r_Map.next}">
                        <li><a href="/board/list?crtPage=${r_Map.endPageBtnNo+1}&kwd=${r_Map.kwd}">▶</a></li>
                    </c:if>
                </ul>
            </div>

            <div class="bottom">
                <c:if test="${authUser != null}">
                    <a href="/board/writeform?crtPage=${param.crtPage}" id="new-book">글쓰기</a>
                </c:if>

            </div>
        </div>
    </div>

    <c:import url="/WEB-INF/views/includes/footer.jsp"/>

</div>
</body>
</html>