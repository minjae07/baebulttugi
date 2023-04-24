<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
  <title>배불뚝이</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
<jsp:include page="../common/header.jsp"/>
  <h2>게시판</h2>
  <div class="panel panel-default">
    <div class="panel-body">
    	<form action = "${cpath}/register.do" method="post">
    	<input type="hidden" name="memID" value="${mvo.memID}"> 
    		<div class="form-group">
    			<label>제목</label>
    				<input type="text" name="title" class="form-control"/>
    		</div>
    		<div class="form-group">
    			<label>내용</label>
    				<textarea rows="10" name="content" class="form-control"></textarea>
    		</div>
    		<div class="form-group">
    			<label>작성자</label>
    				<input type="text" name="writer" value="${mvo.memName}" class="form-control" readonly="readonly"/>
    		</div>
    		<button class="btn btn-default btn-sm">등록</button>
    		<button type="reset" class="btn btn-default btn-sm">취소</button>
    	</form>
    </div>
    <div class="panel-footer">footer</div>
  </div>
</div>