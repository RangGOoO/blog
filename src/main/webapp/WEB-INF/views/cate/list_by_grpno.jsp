<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLOG</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/NanumGgocNaeEum.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
</head>
<body class="pt-5">
	<jsp:include page="../menu/top.jsp" flush='false' />
	<div class="container p-2 mt-4">
		<div class="row mb-4 bg-dark rounded text-white">
			<div class="col-md-12 p-3"> 
				<table class="table form_center text-white text-center" style="width: 70%;">
					<input type="hidden" name="categrpno" value="${grpvo.categrpno }" id="grpno"">
					<tr style="text-align: left;">
						<td colspan="6">${grpvo.catename}그룹 카테고리 목록</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>이름</td>
						<td>생성일</td>
						<td>컨텐츠 개수</td>
						<td colspan="2">기타</td>
					</tr>
					<c:forEach var="cateVO" items="${catelist}">
						<tr>
							<td>${cateVO.cateno }</td>
							<td><a href="/content/cateno_search.do?cateno=${cateVO.cateno}">${cateVO.name}</a></td>
							<td>${cateVO.registdate }</td>
							<td>${cateVO.contentcnt }</td>
							<td><button class="btn btn-outline-light cate_edit" type="button" id="${cateVO.cateno }">수정</button></td>
							<td><button class="btn btn-outline-light cate_edit" type="button" id="${cateVO.cateno }">글쓰기</button></td>
							<%-- <td><a href="/content/create.do?cateno=${cateVO.cateno }">글쓰기</a></td> --%>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6"><button type="button" class="btn btn-dark" id="cate_add">+</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="container p-2 mt-4" id="edit_box" style="display: none;">
		<div class="row mb-4 bg-dark rounded text-white">
			<div class="col-md-12 p-3" id="edit_main"> 
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="/js/cate_ajax.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
</body>
</html>