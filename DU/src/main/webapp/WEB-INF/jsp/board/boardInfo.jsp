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
	
	<section>
			<table class="table table-light" style="width: 60%;">
				<tr>
					<th>제목</th>
					<td><c:out value="${board.title }" /></td>
					<th style="width: 10%">작성자</th>
					<td style="width: 10%"><c:out value="${board.writerName }" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3" style="width: 90%; height: 100px;"><c:out value="${board.content }" /></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3">
						<a href="#" onclick="downloadFile(); return false;" >${board.attFilename }</a>
					</td>
				</tr>
			</table>
		
			<button type="button" class="btn btn-secondary" onclick="history.back(); return false;">이전</button>
			
		<c:if test="${board.writerId == USER.userId }">
			<button type="button" class="btn btn-secondary" onclick="clickDeleteBtn('${board.idx}', '${board.attIdx}');"
					id="deleteBtn">삭제</button>
			<button type="button" class="btn btn-primary"
					id="modifyBtn">수정 </button>
		</c:if>	
		</section>
		
		<form id="fileDownload" action="${pageContext.request.contextPath }/download/boardAttFile.do" method="post">
			<input type="hidden" name="boardIdx" value="${board.idx }" />
			<input type="hidden" name="idx" value="${board.attIdx }" />		
		</form>
		
		<div id="replyDiv" style="margin-top: 10px;">
			<form action="${pageContext.request.contextPath }/replyWrite.do" method="post">
				<table class="table table-light" style="width: 50%;">
					<tr>
						<th style="width: 10%;">댓글</th>
						<td>
							<input type="text" name="content" style="width: 90%;"/>
							<button type="submit" class="btn btn-success">등록</button>
						</td>
					</tr>
					
					<c:forEach items="${replyList}" var="item" varStatus="status">
						<tr>
							<th style="width: 10%;"><c:out value="${item.writerName }"/></th>
							<td data-idx="${item.idx}">
								<span><c:out value="${item.content }"/></span>
								
								<button type="button" style="float:right; margin-left: 5px;"
									class="btn btn-primary replyModifyBtn">수정</button>
								<button type="button" style="float:right;" class="btn btn-secondary"
									onclick="deleteReply('${item.idx}')">삭제</button>
																								
								<fmt:parseDate value="${item.registDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="date"/>		
								<br>(<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm:ss"/>)
							</td>
						</tr>
					</c:forEach>
					
					
				</table>
				<input type="hidden" name="boardIdx" value="${board.idx }" />
			</form>
		</div>
		
		<form id="hiddenForm" style="display:none;"
			action="${pageContext.request.contextPath}/replyModify.do" method="post">
			<input type="text" name="content" style="width: 80%; margin-right: 6px;"/>
			<input type="hidden" name="idx"/>
			<input type="hidden" name="boardIdx" value="${board.idx}"/>
			<button type="submit" class="btn btn-primary">확인</button>
		</form>
			
	</body>
	
	<script>
		
		window.onload = function() {
			
			var modifyBtn = document.getElementById("modifyBtn");
			
			modifyBtn.onclick = function() {
				var path = '${pageContext.request.contextPath}/boardModifyPage.do'
				var params = {
						"idx": "${board.idx}"
				}
				
				post(path, params);
			}
			
			var replyModifyBtns = document.querySelectorAll("replyModifyBtn");
			
			replyModifyBtns.forEach(el => el.addEventListener('click', event => {
				var td = el.parentNode;
				var content = td.getElementsByTagName('a')[0].innerHTML;
				
				td.innerHTML = '';
				td.append(makeReplyUpdateForm(td.getAttribute('data-idx'), content));
			}));
		}
		
		function clickDeleteBtn(idx, attIdx){
			if(confirm("삭제하시겠습니까?") == true){
				var path = "${pageContext.request.contextPath }/boardDelete.do";
				var params = {
					"idx"		: idx,
					"attIdx"	: attIdx
				}
				post(path, params);
			} else {
				return;
			}
		}
		
		function deleteReply(idx) {
			if(confirm("댓글을 삭제하시겠습니까?") == true) {
				var path = "${pageContext.request.contextPath }/replyDelete.do";
				var parmas = {
						"idx" : idx,
						"boardIdx" : "${board.idx}"
				};
				post(path, parmas);
			} else {
				return;
			}
		}
		
		function makeReplyUpdateForm(idx, content){
			var form = document.getElementById('hiddenForm').cloneNode(true);
			form.style.display = '';
			
			var contentInput = form.getElementsByTagName("input")[0];
			contentInput.value = content;
			
			var idxInput = form.getElementsByTagName("input")[1];
			idxInput.value = idx;
		    
		    return form;
		}
		
		function post(path, params) {
			
			const form = document.createElement('form');
			form.method = 'post';
			form.action = path;
			
			for(const key in params) {
				if(params.hasOwnProperty(key)) {
					const hiddenField = document.createElement('input');
					hiddenField.type = 'hidden';
					hiddenField.name = key;
					hiddenField.value = params[key];
					
					form.appendChild(hiddenField);
				}
			}
			
			document.body.appendChild(form);
			form.submit();
		}
		
		function downloadFile(){
			var inputIdx = document.querySelector('#fileDownload > input[name="idx"]');
			if(inputIdx.value){
				document.forms["fileDownload"].submit();
			}
		}

	</script>
</html>