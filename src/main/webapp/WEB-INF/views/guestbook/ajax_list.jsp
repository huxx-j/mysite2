<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/guestbook.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/assets/js/jquery/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="/assets/bootstrap/js/bootstrap.min.js"></script>
    <title>Insert title here</title>
</head>
<body>

<div id="container">

    <c:import url="/WEB-INF/views/includes/header.jsp"/>
    <c:import url="/WEB-INF/views/includes/navigation.jsp"/>


    <div id="wrapper">
        <div id="content">
            <div id="guestbook">

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
                            <td colspan=4 align=right><input type="button" id="btnAdd" VALUE=" 확인 "/></td>
                        </tr>
                    </table>

                <ul id="guestbook_list"></ul>

            </div><!-- /guestbook -->
        </div><!-- /content -->
    </div><!-- /wrapper -->

    <c:import url="/WEB-INF/views/includes/footer.jsp"/>

</div> <!-- /container -->

<!-- 삭제팝업(모달)창 -->
<div class="modal fade" id="del-pop">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">방명록삭제</h4>
            </div>
            <div class="modal-body">
                <label>비밀번호</label>
                <input type="password" name="modalPassword" id="modalPassword"><br>
                <input type="hidden" name="modalNo" value="" id="modalNo"> <br>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-danger" id="btn_del">삭제</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

</body>

<script type="text/javascript">
    $(document).ready(function () {
        fetchList();
    });

    function fetchList() {
        // 리스트 요청 ajax
        $.ajax({
            url: "/api/guest/list",
            type: "post",
            dataType: "json",
            success: function (list) {
                for(var i =0; i<list.length; i++) {
                    render(list[i],"down")
                }
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }

    function render(guestVO,updown) {
        var str = "";
        str += "<li class='" + guestVO.no + "'>";
        str += "    <table width='510' border='1'>";
        str += "        <tr>";
        str += "            <td>[" + guestVO.no + "]</td>";
        str += "            <td>" + guestVO.name + "</td>";
        str += "            <td><input type='button' id='" + guestVO.no + "' value='delete'></td>";
        str += "        </tr>";
        str += "        <tr>";
        str += "            <td colspan='3'>"+ guestVO.content +"</td>";
        str += "        </tr>";
        str += "    </table>";
        str += "    </br>";
        str += "</li>";

        if (updown == "up") {
            $("#guestbook_list").prepend(str);
        } else if (updown == "down") {
            $("#guestbook_list").append(str);
        } else {
            console.log("오류")
        }
    }

    $("#btnAdd").on("click",function() {
        var name = $("[name=name]").val();
        var password = $("[name=password]").val();
        var content = $("[name=content]").val();

        $.ajax({
            url: "/api/guest/add",
            type: "post",
            // contentType: "application/json",
            data: {name: name, password: password, content: content},
            dataType: "json",
            success: function (guestVO) {
                /*성공시 처리해야될 코드 작성*/
                render(guestVO,"up");
                $("[name=name]").val("");
                $("[name=password]").val("");
                $("[name=content]").val("");
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    });

    $("ul").on("click","input",function () {
        var $this = $(this);
        var no = $this.attr("id");
        console.log($this);
        $("#modalNo").val(no);
        $("#del-pop").modal();
    });

    $("#btn_del").on("click",function () {
        var password = $("[name=modalPassword]").val();
        var no = $("[name=modalNo]").val();

        $.ajax({
            url: "/api/guest/del",
            type: "post",
            // contentType: "application/json",
            data: {no: no, password: password},
            dataType: "json",
            success: function (no) {
                /*성공시 처리해야될 코드 작성*/
                $("."+no).remove();
                $("#modalPassword").val("");
                $("#del-pop").modal("hide");
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    });

</script>
</html>