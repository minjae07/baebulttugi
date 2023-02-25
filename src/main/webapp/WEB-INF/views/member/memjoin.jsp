<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원가입</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		if(${!empty msgType}){
			//if(${msgType eq "실패 메세지"}){ --성공할시 바로 리다이렉트하므로 굳이 if문을 통해 실패 메세지를 나타낼 필요가 없다.
				$("#messageType").attr("class","modal-content panel-warning");
				$("#myMessage").modal("show");
		}
	});
function registerCheck(){
    var memID=$("#memID").val();
        $.ajax({
            url : "${contextPath}/memRegisterCheck.do",
            type : "get",
            data : {"memID" : memID},
            success : function(result) {
                //중복 여부 출력 (result = 1 : 사용 가능, result = 0  사용 불가능)
                if(result==1){
                    $("#checkMessage").html("사용할 수 있는 아이디 입니다.");
                    $("#checkType").attr("class","modal-content panel-success");
                }else{
                    $("#checkMessage").html("사용할 수 없는 아이디입니다.");
                    $("#checkType").attr("class","modal-content panel-warning");
                    $("#memID").val('');
                }
                $("#modal").modal("show");
            },
            error : function(){alert("error");    }
        });
    }
    function passwordCheck(){
        var memPassword1=$("#memPassword1").val();
        var memPassword2=$("#memPassword2").val();
        if(memPassword1 != memPassword2){
            $("#passMessage").html("비밀번호가 서로 일치하지 않습니다.");
        }else{
            $("#passMessage").html("");
            $("#memPassword").val(memPassword1);
        }
    }
    function goInsert(){
    	var id= $('#memID').val();
    	var password=$(".password").val();
    	var name= $('#memName').val();
    	var memAge=$("#memAge").val();
    	var email=$('#memEmail').val();
    	
    	if (id == "") {
    		swal("주의", "아이디가 입력되지 않았습니다!", "warning");
    		return;
		}
    	
    	if(password == ""){
    		swal("주의", "비밀번호가 입력되지 않았습니다!", "warning");
    		return;
		}
    	
    	if(name == ""){
    		swal("주의", "이름이 입력되지 않았습니다!", "warning");
    		return;
    	}
    	
    	if(memAge==null || memAge=="" || memAge==0){
    		swal("주의", "나이가 입력되지 않았습니다!", "warning");
    		return false;
    	}
    	
    	if(email == ""){
    		swal("주의", "이메일이 입력되지 않았습니다!", "warning");
    		return;
    	}
    	
    	document.frm.submit();
    }
</script>
<body>
<div class="container">
<jsp:include page="../common/header.jsp"/>
  <h2>회원가입</h2>
  <div class="panel panel-default">   
    <div class="panel-heading">회원가입</div>
    <div class="panel-body">
    	<form name="frm" action="${contextPath}/memRegister.do" method="post">
    		<input type="hidden" id="memPassword" name="memPassword" value=""/>
    		<table class="table table-bordered" style="text-align: center; border: 1px solid;">
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">아이디</td>
    			<td><input id="memID" name="memID" class="form-control" type="text" maxlength="20" placeholder="아이디를 입력하세요"/></td>
    			<td style="width: 110px;"><button type="button" class="btn btn-primary btn-sm" onclick="registerCheck()">중복확인</button></td>
    		</tr>
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">비밀번호</td>
    			<td colspan="2"><input id="memPassword1" name="memPassword1" onkeyup="passwordCheck()" class="form-control password" type="password" maxlength="20" placeholder="비밀번호를 입력하세요"/></td>
    		</tr>
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">비밀번호 확인</td>
    			<td colspan="2"><input id="memPassword2" name="memPassword2" onkeyup="passwordCheck()" class="form-control password" type="password" maxlength="20" placeholder="비밀번호를 다시 입력하세요"/></td>
    		</tr>
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">사용자 이름</td>
    			<td colspan="2"><input id="memName" name="memName" class="form-control" type="text" maxlengt h="20" placeholder="이름을 입력하세요"/></td>
    		</tr>
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">나이</td>
    			<td colspan="2"><input id="memAge" name="memAge" class="form-control" type="number" maxlength="20" placeholder="나이를 입력하세요"/></td>
    		</tr>
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">성별</td>
				<td colspan="2">
					<div class="form-group" style="text-align: center; margin: 0 auto; ">
						<div class= "btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input id="memGender" name="memGender" type="radio" autocomplete="off" value="남자" checked/> 남자
							</label>
							<label class="btn btn-primary">
								<input id="memGender" name="memGender" type="radio" autocomplete="off" value="여자"/> 여자
							</label>
					</div>
    		</tr>
    		
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">이메일</td>
    			<td colspan="2"><input id="memEmail" name="memEmail" class="form-control" type="text" maxlength="20" placeholder="이메일을 입력하세요"/></td>
    		</tr>
    		<tr>
    			<td colspan="3" style="text-align: left;">
    				<span id="passMessage" style="color: red"></span> <input type="button" class="btn btn-primary btn-sm pull-right" value="등록" onclick="goInsert()"/>
    			</td>
    		</tr> 
    		</table>
    	</form>
    </div>
    <!--  다이얼로그창(모달) -->
    <!-- Modal -->
	<div id="modal" class="modal fade" role="dialog" >
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div id="checkType" class="modal-content panel-info">
	      <div class="modal-header panel-heading">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">메세지 확인</h4>
	      </div>
	      <div class="modal-body">
	        <p id="checkMessage"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>	
	  </div>
	</div> 
	<!-- 실패 메세지를 출력(modal) -->
	<div id="myMessage" class="modal fade" role="dialog" >
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div id="messageType" class="modal-content panel-info">
	      <div class="modal-header panel-heading">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">${msgType}</h4>
	      </div>
	      <div class="modal-body">
	        <p>${msg}</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>	
	  </div>
	</div>    
    <div class="panel-footer">게시판</div>
  </div>
</div>
</body>
</html>