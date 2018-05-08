<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/assets/css/gallery.css" rel="stylesheet" type="text/css">
	<link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/assets/js/jquery/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="/assets/bootstrap/js/bootstrap.min.js"></script>

<style>
	#img_id {
		width: 100%;
		max-width: 500px;
	}

	.card {
		border: 1px solid black; 
		float: left; 
		
		margin-right: 5px; 
		margin-bottom: 5px; 
	}
	
	
	.cardImg {
		width: 100%; 
		max-width:128px; 
		vertical-align: middle"
	} 
</style>

<title>Mysite</title>
</head>
<body>
	
	<div id="container">
		
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<c:import url="/WEB-INF/views/includes/navigation.jsp"></c:import>
		
		<div id="wrapper">
			<div id="content">
				
				<div id="gallery">
					<c:if test="${authUser != null}">
						<form method="post" action="/gallery/upload2"  enctype="multipart/form-data">
							<input type="hidden" id="session_no" name="userNo" value="${authUser.no}">
							<table>
								<%--<tr>--%>
									<%--<td>첨부파일</td>--%>
									<%--<td><input type="file" name="file"></td>--%>
									<%--<td><input type="submit" value="파일업로드"></td>--%>
								<%--</tr>--%>
								<tr>
									<td>첨부파일</td>
									<td><input type="file" name="file" multiple></td>
									<td><input type="submit" value="파일업로드"></td>
								</tr>
							</table>
						</form>
					</c:if>

					<ul id="fetch_List"></ul>
				</div>

			</div><!-- /content -->
		</div><!-- /wrapper -->
		
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		
	</div><!-- /container -->
	<!-- 삭제팝업(모달)창 -->
	<div class="modal fade" id="sizeup">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Detail</h4>
				</div>
				<div class="modal-body">
					<img id="img_id" src="">
				</div>
				<div class="modal-footer"></div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	
</body>

<script type="text/javascript">
	// 리스트 출력부분
	$(document).ready(function () {
		fetchList();
    });
	function fetchList() {
        $.ajax({
            url: "/api/gallery/list",
            type: "post",
            dataType: "json",
            success: function (list) {
                for(var i =0; i<list.length; i++) {
                    render(list[i])
                }
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }

    function render(galleryVO) {
	    var str = "";
	    str += "<li id='" + galleryVO.no + "'>";
        str += "<div>";
        str += "<img data-no='" + galleryVO.no + "'data-userno='" + galleryVO.userNo + "' src='/upload/" + galleryVO.saveName+ "'>";
        str += "</div>";
        str += "</li>";

        $("#fetch_List").append(str);
    }
    // 리스트출력 끝


	// 삭제버튼 출력
	$("ul").on("click","img",function() {
		if ($("#session_no").val()==$(this).data("userno")) {
		    var $this = $(this).data("no");
		    var str="";
            str+="<button data-no='" + $this + "' type='button' class='btn btn-danger' id='btn_del'>삭제</button>";
            $(".modal-footer").append(str);
		}
		$("#img_id").attr("src",$(this).attr("src"));
        $("#sizeup").modal();
    });
	//삭제버튼 끝


	//삭제 기능
	$(".modal-footer").on("click","button",function () {
	    galleryVO = {no: $(this).data("no"),
					saveName: $("#img_id").attr("src")};
        $.ajax({
            url: "/api/gallery/del",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(galleryVO),
            dataType: "json",
            success: function (no) {
                if(no==0) {
                    alert("error!!")
                } else {
                    $("#"+no).remove();
                    $("#sizeup").modal("hide");
                }
            },

            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    });
	//삭제기능 끝


	//모달 닫기
	$("#sizeup").on("click",function () {
	    $("#btn_del").remove();
        $("#sizeup").modal("hide");
    });
	//모달 닫기 끝
</script>
</html>		
		
