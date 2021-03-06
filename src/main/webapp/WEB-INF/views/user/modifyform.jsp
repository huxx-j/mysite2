<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="/assets/css/user.css" rel="stylesheet" type="text/css">
	<title>Insert title here</title>
</head>
<body>

	<div id="container">

		<c:import url="/WEB-INF/views/includes/header.jsp"/>
		<c:import url="/WEB-INF/views/includes/navigation.jsp"/>

		<div id="wrapper">
			<div id="content">
				<div id="user">
	
					<form id="join-form" name="joinForm" method="get" action="/user/update">

						
						<label class="block-label" for="name">이름</label>
						<input id="name" name="name" type="text" value="${authUser.name}" />
						<input type="hidden" name="no" value="${authUser.no}">
	
						<label class="block-label" for="email">이메일</label>
						<input type="text" name="email" value="${userVO.email}" readonly="readonly">
						<strong></strong>
						
						<label class="block-label">패스워드</label>
						<input name="password" type="password" value="${userVO.password}" />
						
						<fieldset>
							<legend>성별</legend>
							
							<label>여</label> <input type="radio" name="gender" value="female" ${"female" eq (userVO.gender)?"checked":""} >
							<label>남</label> <input type="radio" name="gender" value="male" ${"male" eq (userVO.gender)?"checked":""}>
							
						</fieldset>
						
						<input type="submit" value="수정완료">
						
					</form>
				</div><!-- /user -->
			</div><!-- /content -->
		</div><!-- /wrapper -->

		<c:import url="/WEB-INF/views/includes/footer.jsp"/>

	</div> <!-- /container -->

</body>
</html>
