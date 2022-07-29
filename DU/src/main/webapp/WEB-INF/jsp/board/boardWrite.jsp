<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 등록</title>
</head>
<body>
	<header>
		<div class="logoDiv">
			<img alt="logo" src="images/04-1.jpg" onclick="window.location.href='mainPage.do'">
		</div>
		<div class="userInfoDiv">
			[<c:out value="${USER.name}"></c:out>]님 반갑습니다
	
			<button type="button" class ="btn btn-primary btn-md" style="float: right" onclick="window.location.href='logout.do'"> 
			로그아웃 </button>
	
			<button type="button" class ="btn btn-outline-primary btn-md" style="float: right" onclick="window.location.href='userInfoConfirm.do'"> 
			내정보 </button>
					
		</div>
	</header>
	<form action="boardWrite.do" method="post">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" required/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea style="width: 100%; height: 100px;" name="content" required></textarea></td>
		</table>
		<button type="submit" class="btn btn-primary">등록</button>
	</form>
</body>
</html>