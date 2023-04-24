 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>배불뚝이</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		 loadList();
  	});
  	function loadList() {
  		//서버와 통신 : 게시판 리스트 가져오기
  		$.ajax({
  			url : "board/all", 
  			type : "get",
  			dataType : "json",
  			success : makeView,	//콜백 함수
  			error : function(){	alert("error");	}
  		});
  	}
  	function makeView(data){	//JSON 데이터
  		var listHtml="<table class='table table-boardered'>";
  		listHtml+="<tr>";
  		listHtml+="<td>번호</td>";
  		listHtml+="<td>제목</td>";
  		listHtml+="<td>작성자</td>";
  		listHtml+="<td>작성일</td>";
  		listHtml+="<td>조회수</td>";
  		listHtml+="</tr>";
  		$.each(data, function(index,obj){
  			listHtml+="<tr>";
  			listHtml+="<td>"+index+"</td>";
  			listHtml+="<td id='_title"+obj.idx+"'><a href='javascript:goContent("+obj.idx+")'>"+obj.title+"</a></td>";
  			listHtml+="<td>"+obj.writer+"</td>";
  			listHtml+="<td>"+obj.indate.split(' ')[0]+"</td>";
  			listHtml+="<td id='_hit"+obj.idx+"'>"+obj.count+"</td>";
  			listHtml+="</tr>";
  			
  			listHtml+="<tr id='content"+obj.idx+"' style='display:none'>";
  			listHtml+="<td>내용</td>";
  			listHtml+="<td colspan='4'>";
  			listHtml+="<textarea id='_text"+obj.idx+"' readonly rows='7' class='form-control'></textarea>";
  			if("${mvo.memID}"==obj.memID){
  			listHtml+="<br/>";
  			listHtml+="<span id='_update"+obj.idx+"'><button class='btn btn-success btn-sm' onclick='goUpdateForm("+obj.idx+")'>수정화면</button></span>&nbsp;";
  			listHtml+="<button class='btn btn-warning btn-sm' onclick='goDelete("+obj.idx+")'>삭제</button>";
  			}else{
  				listHtml+="<br/>";
  	  			
  			}
  			listHtml+="</td>";
  			listHtml+="</tr>";
  		} );
  		
  		//로그인을 해야 보이는 버튼
  	if(${!empty mvo}){
  		listHtml+="<tr>";
  		listHtml+="<td colspan='5'>";
  		listHtml+="<button class='btn btn-primary btn-sm' onclick='goForm()'>글쓰기</button>";
  		listHtml+="</td>";
  		listHtml+="</tr>";
  		}
  		listHtml+="</table>";	
  		//$(): 선택자, 무엇을 선택할때 사용
  		$("#view").html(listHtml);
  		
  	  $("#view").css("display","block");
  	  $("#wfrom").css("display","none");
  	}
  	function goForm(){
  		$("#view").css("display","none");	//버튼 누를시 감춤
  		$("#wfrom").css("display","block");
  	}
	function goList(){
  		$("#view").css("display","block");	//버튼 누를시 감춤
  		$("#wfrom").css("display","none");
  	}
	
	function goInsert(){
		//var title = $("#title").val();
		//var content = $("#content").val();
		//var writer = $("#writer").val();
		
		var fData=$("#frm").serialize();
		
		$.ajax({
			url : "board/new",
			type : "post",
			data : fData,
			success : loadList,
			error : function() {
				alert("error");
			}
			//alert("글이 등록되었습니다");
		});
		
		//폼 초기화
		//$("#title").val("");
		//$("#content").val("");
		//$("#writer").val("");
		$("#fclear").trigger("click");
	}
	function goContent(idx){
		if($("#content"+idx).css("display")=="none"){
			$.ajax({
        	    url: "board/"+idx,
       	  		type: "get",
      	 	   // data: {"idx" : idx},
       	 	    dataType : "json",
        	    success: function(data){
       		     	$("#_text"+idx).val(data.content);
          		  },
            error : function() {alert("error");}
        });	
			
		$("#content"+idx).css("display","table-row");	//보이게
		$("#_text"+idx).attr("readonly",true);
	}else{
		$("#content"+idx).css("display","none");	//감추기
		$.ajax({
			url : "board/count/"+idx,
			type : "put",
			//type : "get",
			//data : { "idx" : idx},
			dataType : "json",
			success : function(data) {
				$("#_hit"+idx).text(data.count);
			},
			error : function() {
				alert("error");
			}
		});
	}
	}
	function goDelete(idx){
		$.ajax({
			url : "board/"+idx,
			type : "delete",
			//type : "get",
			//data : {"idx":idx},
			success : loadList,
			error : function() {alert("error");}
		});
	}	
	function goUpdateForm(idx){
		$("#_text"+idx).attr("readonly",false);	//텍스트 제거
		var title = $("#_title"+idx).text();
		 
		var newInput="<input type='text' id='_newtText"+idx+"' class='form-control' value='"+title+"'/>";	
		$("#_title"+idx).html(newInput);	//제목 수정
		
		var newButton="<button class='btn btn-primary btn-sm' onclick='goUpdate("+idx+")'>수정</button>"
		$("#_update"+idx).html(newButton);	//수정화면을 수정으로 바꿈
	}
	function goUpdate(idx){
		var title=$("#_newtText"+idx).val();
		var content=$("#_text"+idx).val();
		$.ajax({
			url: "board/update",
			type : "put",
			contentType:'application/json;charset=utf-8',
			data : JSON.stringify({"idx":idx,"title":title,"content":content}),
			success : loadList,
			error: function(){alert("error");}
		})
	}
	
	
  </script>
  

</head>
<body>
 
<div class="container">
<jsp:include page="../common/header.jsp"/>
  <h2>Q&A</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD</div>
    <div class="panel-body" id="view" >Panel Content</div>
    <div class="panel-body" id="wfrom" style="display: none">
      <form id="frm">
      <input type="hidden" name="memID" id="memID" value="${mvo.memID}" />
					<table class="table">
						<tr>
							<td>제목</td>
							<td><input type="text" id="title" name="title" class="form-control" /></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea rows="7" id="content" name="content" class="form-control"></textarea></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" id="writer" name="writer" class="form-control" value="${mvo.memName}" readonly="readonly"/></td>
						</tr>
						<tr>
						<td colspan="2" align="center">
						<button type="button" class="btn btn-success btn-sm" onclick="goInsert()">등록</button>
						<button type="reset" class="btn btn-warning btn-sm" id="fclear">취소</button>
						<button type="button" class="btn btn-info btn-sm" onclick="goList()">목록</button>
						</tr>
					</table>
				</form>
      </div>
    <div class="panel-footer">게시판</div>
  </div>
</div>

</body>
</html>
