<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="/assets/css/guestbook.css" rel="stylesheet" type="text/css">
    <link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
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
                <%--<input type="button" id="btnShowMore" value="ShowMore">--%>

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
                <div id="msg"></div>
                <input type="hidden" name="modalNo" value="" id="modalNo"> <br>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btn_cancle" data-dismiss="modal">취소</button>
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
        c = 1;
        fetchScroll(c);
    });

    $(window).on("scroll",function () {
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
            c++;
            fetchScroll(c);
        }
    });

    // $("#btnShowMore").on("click",function () {
    //    c++;
    //    fetchList(a,b)
    // });

    function fetchScroll(c) {
        // 리스트 요청 ajax
        $.ajax({
            url: "/api/guest/list",
            type: "post",
            data: {"c": c},
            dataType: "json",
            success: function (list) {
                console.log(list.length);
                for(var i =0; i<list.length; i++) {
                    render(list[i],"down")
                }
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    }

    // function fetchList(a,b) {
    //     // 리스트 요청 ajax
    //     $.ajax({
    //         url: "/api/guest/list",
    //         type: "post",
    //         dataType: "json",
    //         success: function (list) {
    //             for(var i =b; i<a; i++) {
    //                 render(list[i],"down")
    //             }
    //         },
    //         error: function (XHR, status, error) {
    //             console.error(status + " : " + error);
    //         }
    //     });
    // }

    function render(guestVO,updown) {
        var str = "";
        str += "<li class='" + guestVO.no + "'>";
        str += "    <table width='510' border='1'>";
        str += "        <tr>";
        str += "            <td>[" + guestVO.no + "]</td>";
        str += "            <td>" + guestVO.name + "</td>";
        str += "            <td><input type='button' data-delno='" + guestVO.no + "' value='delete'></td>";
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

    // //파라미터로 add 할때
    // $("#btnAdd").on("click",function() {
    //     var name = $("[name=name]").val();
    //     var password = $("[name=password]").val();
    //     var content = $("[name=content]").val();
    //
    //     $.ajax({
    //         url: "/api/guest/add",
    //         type: "post",
    //         data: {"name": name, "password": password, "content": content},
    //         dataType: "json",
    //         success: function (guestVO) {
    //             /*성공시 처리해야될 코드 작성*/
    //             render(guestVO,"up");
    //             $("[name=name]").val("");
    //             $("[name=password]").val("");
    //             $("[name=content]").val("");
    //         },
    //         error: function (XHR, status, error) {
    //             console.error(status + " : " + error);
    //         }
    //     });
    // });

    //JSON으로 add 할때
    $("#btnAdd").on("click",function() {
        guestVO = {name : $("[name=name]").val(),
                    password : $("[name=password]").val(),
                    content : $("[name=content]").val().replace(/\n/g,"<br>")};
        $.ajax({
            url: "/api/guest/add",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(guestVO),
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
        // var $this = $(this);
        var no = $(this).data("delno");
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
                if(no==0) {
                    $("#msg").html("비밀번호를 확인하세요").css("color","red");
                } else {
                    $("." + no).remove();
                    $("#modalPassword").val("");
                    $("#msg").html("");
                    $("#del-pop").modal("hide");
                }
            },

            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
    });
    $("#btn_cancle").on("click",function () {
        $("#modalPassword").val("");
        $("#msg").html("");
    });

</script>
</html>