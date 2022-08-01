<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	<style>
		header {
			margin-bottom: 10px;
		}
		h1 {
			margin: auto;
		}
		.rightBtnDiv {
			display: flex; 
			float: right; 
			width: 13%;
		}
		.leftBtnDiv {
			display: flex; 
			float: left; 
			width: 6%;
		}
		img {
			margin-left: auto;
			margin-right: auto; 
			display: block;
		}
		#paginationBox {
		    justify-content: center;
		    display: flex;
		}
		#filterDiv {
			display: flex;
			justify-content: space-between;
		}
	</style>
<title>게시글 상세</title>
</head>
<body>
	<header>
		<div class="logoDiv">
			<img alt="logo" src="${pageContext.request.contextPath}/images/04-1.jpg" onclick="window.location.href='${pageContext.request.contextPath}/mainPage.do'">
		</div>
		<div class="userInfoDiv">
			[<c:out value="${USER.name}"></c:out>]님 반갑습니다
	
			<button type="button" class ="btn btn-primary btn-md" style="float: right" onclick="window.location.href='${pageContext.request.contextPath}/logout.do'"> 
			로그아웃 </button>
	
			<button type="button" class ="btn btn-outline-primary btn-md" style="float: right" onclick="window.location.href='${pageContext.request.contextPath}/userInfoConfirm.do'"> 
			내정보 </button>
					
		</div>
	</header>
	
	<table class="table table-light" style="width: 50%;">
		<tr>
			<th>제목</th>
			<td><c:out value="${board.title }"></c:out></td>
			<th style="width: 13%;">작성자</th>
			<td style="width: 13%;"><c:out value="${board.writerName }"></c:out></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td colspan="3" style="width: 90%; height: 100px;"><c:out value="${board.content}"></c:out></td>
		</tr>
		 
	</table>
	
	<button type="button" class="btn btn-secondary"
			onclick="history.back(); return false;">이전</button>
			
	<c:if test="${board.writerId == USER.userId }">
		<button type="button" class="btn btn-secondary"
				id="deleteBtn">삭제</button>
		<button type="button" class="btn btn-primary"
				onclick="window.location.href='${pageContext.request.contextPath}/boardModifyPage/${board.idx}.do'">
		수정</button>
	</c:if>

			
</body>

<script>

	window.onload = function() {
		
		var deleteBtn = document.getElementById("deleteBtn");
		
		deleteBtn.onclick = function() {
			if(confirm("삭제하시겠습니까?") == true){
				url = "${pageContext.request.contextPath}/boardDelete/${board.idx}.do";
				
				location.href= url;
// 				var params = {
// 						"idx": "${board.idx}"
// 				};
// 				post(path, params);
			}
			else {
				return;
			}
		}
		
// 		var modifyBtn = document.getElemenetById("modifyBtn");
		
// 		modifyBtn.onclick = function() {
// 			var path = "${pageContext.request.contextPath}/boardModifyPage.do";
// 			var params = {
// 					"idx": "${board.idx}"
// 			};
// 			post(path, params);
// 		}
	}
	
	function post(path, params) {
		
		const form = document.createElement('form');
		form.method = "post";
		form.action = path;
		
		for (const key in params) {
			if(params.hasOwnPropety(key)) {
				const hiddenField = document.createElement('input');
				hiddenField.type = 'hidden';
				hiddenField.name = key;
				hiddenField.value = params[key];
				
				form.appendChild(hiddenField);
			}
		}
		
		document.body.appendChild(form);
		from.submit();
	}
</script>
</html>