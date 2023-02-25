<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-default">		<!-- 색상변경 -->
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${contextPath}/">홈페이지</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${contextPath}/">Home</a></li>
        <li><a href="board.do">게시판</a></li>   
        <li><a href="QnA.do">고객센터</a></li>   
      </ul>
      <c:if test="${empty mvo}">
	      <ul class="nav navbar-nav navbar-right">
	            <li><a href="${contextPath}/memLoginForm.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
	            <li><a href="${contextPath}/memJoin.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>            
	      </ul>
      </c:if>
      <c:if test="${!empty mvo}">
	      <ul class="nav navbar-nav navbar-right">
	      		<li class="dropdown">
			        <a class="dropdown-toggle" data-toggle="dropdown" href="#">마이페이지
			        <ul class="dropdown-menu">
			          <li><a href="${contextPath}/memImageForm.do"><span class="glyphicon glyphicon glyphicon-picture"></span> 사진등록</a></li>
			           <li><a href="${contextPath}/mypage.do"><span class="glyphicon glyphicon glyphicon-wrench"></span> 회원정보수정</a></li>
			          <li><a href="#">Page 1-3</a></li>
			        </ul>
			      </li>
	            <li><a href="${contextPath}/memLogout.do"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>            
	            <c:if test="${!empty mvo}">
			    <c:if test="${mvo.memProfile eq ''}">
			      <li><img class="img-circle" src="${contextPath}/resources/images/person.PNG" style="width: 50px; height: 50px"/> ${mvo.memName} 님</li>
			    </c:if>
			    <c:if test="${mvo.memProfile ne ''}">
			      <%-- <li><img class="img-circle" src="${contextPath}/resources/upload/${mvo.memProfile}" style="width: 50px; height: 50px"/> ${mvo.memName} 님</li> --%>
			      <li><img class="img-circle" src="${contextPath}/resources/upload/${mvo.memProfile}" style="width: 50px; height: 50px"/> ${mvo.memName} 님</li>
			    </c:if>			  
			  </c:if>
	      </ul>
      </c:if>
    </div>
  </div>
	<div style="text-align: right" id="google_translate_element" class="hd_lang"></div>
</nav>
  <script type="text/javascript">
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