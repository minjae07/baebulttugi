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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <style type="text/css">
  .search-btn {
  color: #6D6D6D;
  float: right;
  width: 35px;
  height: 35px;
  border-radius: 50%;
  background: #EDEDED;
  display: flex;
  align-items: center;
  justify-content: center;
}

.searchText {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
  </style>
  
  
  <script type="text/javascript">
  	$(document).ready(function(){
  		var result = '${result}';
  		checkModal(result);
 
  		$('#sherchBtn').click(function() {
  			var searchType = $('.searchType1 option:selected').val();
  			var keyWord = $('.keyWord1').val();
  			
  			$('#searchType').val(searchType);  			
  			$('#keyWord').val(keyWord);  			
  			$('#searchForm').submit();
		}) 
  	});
  	
  	function checkModal(result){
  		if(result==''){
  			return;
  		}
  		if(parseInt(result)>0){
  			$(".modal-body").html("게시글 "+${fn:length(list)- i.index}+"번이 등록되었습니다.");
  		}
  			$("#myModal").modal("show");
  	};
  	
  	function search(){
  		 $("#sherchBtn").trigger("click");
  	};
  	
  	function detail(index) {
  		$(".idx").val(index);
		$("#detail").submit();
	};
  	
  	function wrt() {
  		location.href="${cpath}/register.do";
	};
  </script>
  
</head>
<body>
<div class="container">
<jsp:include page="../common/header.jsp"/>
  <h2>게시판</h2>
  <div class="panel panel-default" >
  <form class="form-inline" id="searchForm"  action="/tboard.do" method="POST">
	<input type="hidden" id="searchType" name="searchType" value="">
	<input type="hidden" id="keyWord" name="keyWord" value="">
    <div class="form-group" >
    	<select class="form-control searchType1">
    		<option value="title">제목</option>
    		<option value="writer">작성자</option>
    		<option value="content">내용</option>
    	</select>
    	<input type="text" class="form-control keyWord1" onkeypress="if(event.keyCode==13){search();}" value="">
    	<button type="submit" class="search-btn" id="sherchBtn" value="검색">
    		<i class="fas fa-search"></i>
    	</button>
   </form>
   	</div>
   	<form class="frm" id="detail" action="/view.do" method="get">
    <input type="hidden" value="" name="idx" class="idx">
   	</form>
    <div class="panel-body">
    <table class="table table-boardered table-hover">
    		<thead>
    			<tr>
    				<th>번호</th>
    				<th>제목</th>
    				<th>작성자</th>
    				<th>작성일</th>
    				<th>조회수</th>
    			</tr>
    		</thead>
    		<c:forEach var="vo" items="${list}" varStatus="i">
    			<tr onclick="detail(${vo.idx});">
    				<td>${fn:length(list)- i.index}</td>
    				<td>${vo.title}</td>
    				<td>${vo.writer}</td>
    				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.indate}"/></td>
    				<td>${vo.count}</td>
    			</tr>
    		</c:forEach>
    		<c:if test="${!empty mvo}">
    		<tr>
    			<td colspan="5">
    				<button id="regBtn" class="btn btn-sm btn-primary pull-right" onclick="wrt();">글쓰기</button>
    			</td>
    		</tr>
    		</c:if>
    	</table>
    	
    	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">등록</h4>
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

    
    </div>
    <div class="panel-footer">게시판</div>
  </div>
</div>

</body>
</html>
