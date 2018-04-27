<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
				<div id="guestbook" class="delete-form">
					
					<form method="get" action="/guest/del">
						
						<label>비밀번호</label>
						<input type="hidden" name="no" value="${param.no}">
						<input type="password" name="password">
						<input type="submit" value="확인">
					</form>
					<a href="/guest/list">방명록 리스트</a>
					
				</div>
			</div><!-- /content -->
		</div><!-- /wrapper -->

		<c:import url="/WEB-INF/views/includes/footer.jsp"/>



	</div> <!-- /container -->

</body>
</html>