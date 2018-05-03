<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="/assets/css/user.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/assets/js/jquery/jquery-1.12.4.js"></script>
	<title>Insert title here</title>
</head>
<body>

	<div id="container">

		<c:import url="/WEB-INF/views/includes/header.jsp"/>
		<c:import url="/WEB-INF/views/includes/navigation.jsp"/>

		<div id="wrapper">
			<div id="content">
				<div id="user">
	
					<form id="join-form" name="joinForm" method="get" action="/user/join">
						<input type="hidden" name="cmd" value="join">
						<label class="block-label" for="name">이름</label>
						<input id="name" name="name" type="text" value="">
						<input type="hidden" id="isIdCheck" value="false"><br>

						<div id="name_Msg"></div>
	
						<label class="block-label" for="email">이메일</label>
						<input id="email" name="email" type="text" value="">
						<%--<input type="button" id="btnEmailCheck" value="id 중복체크"><br>--%>
						<div id="id_Msg"></div>
						<div id="idCheck_Msg"></div>
						
						<label class="block-label">패스워드</label>
						<input name="password" id="password" type="password" value=""><br>
						<div id="password_Msg"></div>
						
						<fieldset>
							<legend>성별</legend>
							<label>여</label> <input type="radio" name="gender" value="female" checked="checked">
							<label>남</label> <input type="radio" name="gender" value="male">
						</fieldset>
						
						<fieldset>
							<legend>약관동의</legend>
							<input id="agree-prov" class="prov" type="checkbox" name="agreeProv" value="y">
							<label>서비스 약관에 동의합니다.</label><br>
							<div id="prov_Msg"></div>
						</fieldset>
						
						<input type="submit" id="submit" value="가입하기">
						
					</form>
					
				</div><!-- /user -->
			</div><!-- /content -->
		</div><!-- /wrapper -->

		<c:import url="/WEB-INF/views/includes/footer.jsp"/>

	</div> <!-- /container -->

</body>

<script type="text/javascript">

    $("#email").on("blur",function () {
        var email = $("#email").val();
        $.ajax({
            url : "/user/emailcheck",
            type : "post",
            data : {email : email},
            dataType : "json",
            success : function (isExists) {
                if("x"==isExists){
                    $("#id_Msg").html("사용중인 아이디 입니다.").css("color","red");
                    $("#isIdCheck").val("false");
                }else if ("empty"==isExists) {
                    $("#id_Msg").html("아이디를 입력하세요.").css("color","red");
                    $("#isIdCheck").val("false");
                } else {
                    $("#id_Msg").html("사용가능한 아이디 입니다.").css("color","blue");
                    $("#isIdCheck").val("true");
                    $("#idCheck_Msg").html("");
                }
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    });

    $("#submit").on("click", function () {
		var flag1,flag2,flag3,flag4 = true;
			if($("#agree-prov").is(":checked")){
                $("#prov_Msg").html("");
			} else {
			    flag4 = false;
                $("#prov_Msg").html("약관에 동의하세요.").css("color", "red");
			}
		    if($("#name").val()=="") {
                $("#name_Msg").html("이름을 입력하세요").css("color", "red");
                flag1 = false;
            } else {
                $("#name_Msg").html("");
		        flag1 = true;
			}
			if($("#email").val()=="") {
                $("#id_Msg").html("이메일을 입력하세요").css("color", "red");
                flag2 = false;
            } else {
                $("#id_Msg").html("");
                if($("#isIdCheck").val()=="false") {
                    $("#id_Msg").html("사용중인 아이디 입니다.").css("color","red");
				} else {
                    flag2 = true;
                }
			}
			if($("#password").val()==""){
                $("#password_Msg").html("비밀번호를 입력하세요").css("color","red");
                flag3 = false;
            } else {
                $("#password_Msg").html("");
                flag3 = true;
			}
            if (flag1 && flag2 && flag3 && flag4) {
		        return true;
			} else {
		        return false;
			}
    });

</script>

</html>