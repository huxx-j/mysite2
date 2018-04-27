<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
				<form class="board-form" method="get" action="/board/update">
					<table class="tbl-ex">
						<tr>
							<th colspan="2">글수정</th>
							<input type="hidden" name="no" value="${param.no}">
							<input type="hidden" name="kwd" value="${param.kwd}">
							<input type="hidden" name="num" value="${param.num}">
							<input type="hidden" name="pc" value="${param.pc}">
						</tr>
						<tr>
							<td class="label">제목</td>
							<td><input type="text" name="title" value="${boardVO.title}"></td>
						</tr>
						<tr>
							<td class="label">내용</td>
							<td>
								<textarea id="content" name="content">${boardVO.content}</textarea>
							</td>
						</tr>
					</table>
					<div class="bottom">
							<a href="/board/view?no=${param.no}&num=${param.num}&kwd=${param.kwd}&pc=${param.pc}">취소</a>
						<input type="submit" value="수정">
					</div>
				</form>				
			</div>
		</div>

		<c:import url="/WEB-INF/views/includes/footer.jsp"/>


	</div>
</body>
</html>