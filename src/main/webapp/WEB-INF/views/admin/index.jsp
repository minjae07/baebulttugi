<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="context-path" th:content="@{/}"/>
    
    <title>HM & SB Blog - Admin</title>
    
    <!--  Common header -->
    <th:block th:include="common/include-link"></th:block>
    <!-- Custom styles for sidebar -->
    <link th:href="@{/css/admin-sidebar.css}" rel="stylesheet">
</head>
<body>
    <!-- Common script -->
    <th:block th:include="common/include-script"></th:block>
 
    <div class="wrapper">
        <!-- Sidebar Holder -->
        <nav th:replace="admin/sidebar"></nav>
 
        <div id="content" class="content">
            <button type="button" id="sidebarCollapse" class="navbar-btn"><i class="fas fa-bars"></i></button>
            <hr>
            <!-- Page Content Holder -->
            <div th:replace="${template}"></div>
        </div>
    </div>
    
    <nav id="sidebar">
    <th:block th:include="admin/sidebar-js"></th:block>
    <div class="sidebar-header">
        <h3><a th:href="@{/admin}">ADMIN</a></h3>
    </div>
 
    <ul class="list-unstyled components">
        <li><a th:href="@{/admin/category}">카테고리</a></li>
        <li><a th:href="@{/admin/users}">계정</a></li>
    </ul>
</nav>
</body>
<script th:inline="javascript">
$(function(){
    $('#sidebarCollapse').on('click', function() {
        $('#sidebar').toggleClass('active');
        $(this).toggleClass('active');
    });
});
</script>

</html>
