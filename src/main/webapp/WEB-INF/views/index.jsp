<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>메인 화면</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
		if(${!empty msgType}){
				$("#messageType").attr("class","modal-content panel-success");
			$("#myMessage").modal("show");
		} 
	});
  
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage: 'ko',
			includedLanguages: 'ko,ja,en,zh-CN,zh-TW',
			layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
			autoDisplay: false
		}, 'google_translate_element');
	}
</script>
<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
  
</head>
<body>
<div class="container">
<jsp:include page="common/header.jsp"/>  
<%-- 	<c:if test="${empty mvo}">
		<h2>메인 화면</h2>
		</c:if>
 --%>	
 	 <div class="panel panel-default">
			<!-- <div id="google_translate_element" class="hd_lang"></div> -->
  	 		<div>
				<img src="${contextPath}/resources/images/main.png" style="width:100%; height:400px;" />
			</div>
  	 	 	<div class="panel-body">
				<ul class="nav nav-tabs">
				  <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
				  <li><a data-toggle="tab" href="#menu1">인기게시글</a></li>
				  <li><a data-toggle="tab" href="#menu2">공지사항</a></li>
				</ul>
				
				<div class="tab-content">
				  <div id="home" class="tab-pane fade in active">
				   	 <jsp:include page="home.jsp"/>  
				  </div>
				  <div id="menu1" class="tab-pane fade">
				    <h3>인기게시글 BEST3</h3>
				     <div class="panel panel-default">
					    <div class="panel-heading">게시판</div>
					    <div class="panel-body">
					    	<table class="table table-bordered table-hover">
					    		<tr>
					    			<td>번호</td>
					    			<td>제목</td>
					    			<td>작성자</td>
					    			<td>작성일</td>
					    			<td>조회수</td>
					    		</tr>
					    		<c:forEach var="vo" items="${list}">
					    			<tr>
					    				<td>${vo.idx}</td>
					    				<td>${vo.title}</td> 			
					    				<td>${vo.writer}</td>
					    				<td>${fn:split(vo.indate," ")[0]}</td>
					    				<td>${vo.count}</td>
					    			</tr>
					    		</c:forEach>
					    	</table>
					    </div>
    				</div>
				  </div>
				  <div id="menu2" class="tab-pane fade">
				    <h3>공지사항</h3>
				    <p>공지사항 입니다.</p>
				  </div>
				</div>
  	 	 	</div>
  	 	 	

   		 	<div class="panel-footer">게시판</div>
 	 </div>
</div>


<!-- 성공 메세지를 출력(modal) -->
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
	
	
</body>
</html>
