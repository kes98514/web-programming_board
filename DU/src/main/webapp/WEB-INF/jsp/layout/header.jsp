<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="logoDiv">
		<img alt="logo" src="${pageContext.request.contextPath}/images/04-1.jpg" onclick="window.location.href='mainPage.do'">
	</div>
	<div class="userInfoDiv">
		[<c:out value="${USER.name}"></c:out>]님 반갑습니다

		<button type="button" class ="btn btn-primary btn-md" style="float: right" onclick="window.location.href='logout.do'"> 
		로그아웃 </button>

		<button type="button" class ="btn btn-outline-primary btn-md" style="float: right" onclick="window.location.href='userInfoConfirm.do'"> 
		내정보 </button>				
	</div>
</body>
</html>