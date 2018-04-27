<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="/assets/css/guestbook.css" rel="stylesheet" type="text/css">
    <title>Insert title here</title>
</head>
<body>

<div id="container">

    <c:import url="/WEB-INF/views/includes/header.jsp"/>
    <c:import url="/WEB-INF/views/includes/navigation.jsp"/>


    <div id="wrapper">
        <div id="content">
            <div id="guestbook">

                <form action="/guest/add" method="get">
                    <table>
                        <tr>
                            <td>이름</td>
                            <td><input type="text" name="name"/> </td>
                            <td>비밀번호</td>
                            <td><input type="password" name="password"/></td>
                        </tr>
                        <tr>
                            <td colspan=4><textarea name="content" id="content"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan=4 align=right><input type="submit" VALUE=" 확인 "/></td>
                        </tr>
                    </table>
                </form>
                <ul>
                    <li>
                        <c:if test="${list != null}">
                            <c:forEach items="${list}" var="vo">
                                <table width=510 border=1>
                                    <tr>
                                        <td>[${vo.no}]</td>
                                        <td>${vo.name}</td>
                                        <td>${vo.reg_date}</td>
                                        <td><a href="/guest/delform?no=${vo.no}"> 삭제 </a></td>
                                    </tr>
                                    <tr>
                                        <td colspan=4>${vo.content}</td>
                                    </tr>
                                </table>
                                <br/>
                            </c:forEach>
                        </c:if>
                        <br>
                    </li>
                </ul>

            </div><!-- /guestbook -->
        </div><!-- /content -->
    </div><!-- /wrapper -->

    <c:import url="/WEB-INF/views/includes/footer.jsp"/>



</div> <!-- /container -->

</body>
</html>