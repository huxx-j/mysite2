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
            <form id="search_form" action="/board/search" method="get">
                <%--<input type="hidden" name="snum" value="1">--%>
                <input type="text" id="kwd" name="kwd" value="">
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
                <c:if test="${list != null}">
                    <c:forEach items="${list}" var="vo">
                        <tr>
                            <td>${vo.no}</td>
                            <c:choose>
                                <c:when test="${param.kwd==null}">
                                    <td><a href="/board/view?no=${vo.no}&num=${param.num}&pc=${param.pc}">${vo.title}</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td>
                                        <a href="/board/view?no=${vo.no}&snum=${param.snum}&kwd=${param.kwd}&${param.pc}">${vo.title}</a>
                                    </td>
                                </c:otherwise>
                            </c:choose>
                            <td>${vo.name}</td>
                            <td>${vo.hit}</td>
                            <td>${vo.date}</td>
                            <td>
                                <c:if test="${vo.userNo eq authUser.no}">
                                    <a href="/board/del?no=${vo.no}&userNo=${vo.userNo}&num=${param.num}&pc=${param.pc}" class="del">삭제</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                ${list.size()}<br> ${list.get(0).tnum}<br> ${param.num*5}

            </table>
            <div class="pager">
                <ul>
                    <c:choose>

                        <c:when test="${param.num!=null}">
                            <c:if test="${param.pc!=1}">
                                <li><a href="/board/list?&num=${(param.pc-1)*5}&pc=${param.pc-1}">◀</a></li>
                            </c:if>

                            <c:choose>
                                <c:when test="${list.get(0).tnum>=param.pc*25}">
                                    <c:forEach var="i" begin="${(param.pc*5)-4}" end="${param.pc*5}">
                                        <li class="${param.num eq i?'selected':''}"><a
                                                href="/board/list?num=${i}&pc=${param.pc}">${i}</a></li>
                                    </c:forEach>
                                </c:when>

                                <c:otherwise>
                                    <c:forEach var="i" begin="${(param.pc*5)-4}" end="${list.get(0).tnum%5==0?(list.get(0).tnum)/5:((list.get(0).tnum)/5)+1}" step="1">
                                        <li class="${param.num eq i?'selected':''}"><a
                                                href="/board/list?num=${i}&pc=${param.pc}">${i}</a></li>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>

                            <c:if test="${param.pc*25<list.get(0).tnum}">
                                <li><a href="/board/list?num=${((param.pc+1)*5)-4}&pc=${param.pc+1}">▶</a></li>
                            </c:if>
                        </c:when>

                        <c:otherwise>
                            <c:if test="${param.pc!=1}">
                                <li><a href="/board/search?snum=${param.pc-1}&kwd=${param.kwd}">◀</a></li>
                            </c:if>

                            <c:choose>
                                <c:when test="${list.get(0).tnum>=param.pc*25}">
                                    <c:forEach var="i" begin="${(param.pc*5)-4}" end="${param.pc*5}">
                                        <li class="${param.num eq i?'selected':''}"><a
                                                href="/board/list?num=${i}&pc=${param.pc}&kwd=${param.kwd}">${i}</a></li>
                                    </c:forEach>
                                </c:when>

                                <c:otherwise>
                                    <c:forEach var="i" begin="${(param.pc*5)-4}" end="${((list.get(0).tnum)/5)+1}" step="1">
                                        <li class="${param.num eq i?'selected':''}"><a
                                                href="/board/list?num=${i}&pc=${param.pc}&kwd=${param.kwd}">${i}</a></li>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>

                            <c:if test="${list.size()==5 && list.get(0).num>param.snum*5}">
                                <li><a href="/board/search?snum=${param.pc+1}&kwd=${param.kwd}">▶</a></li>
                            </c:if>
                        </c:otherwise>
                    </c:choose>


                </ul>
            </div>

            <div class="bottom">
                <c:if test="${authUser != null}">
                    <a href="/board/writeform?num=${param.num}&pc=${param.pc}" id="new-book">글쓰기</a>
                </c:if>

            </div>
        </div>
    </div>

    <c:import url="/WEB-INF/views/includes/footer.jsp"/>

</div>
</body>
</html>