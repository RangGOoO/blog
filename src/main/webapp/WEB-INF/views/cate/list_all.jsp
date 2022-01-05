<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="../menu/top.jsp"></jsp:include>
	<table class="table"
		style="width: 70%; margin-left: auto; margin-right: auto;">
		<tr>
			<th>그룹 번호</th>
			<th>소속 그룹</th>
			<th>이름</th>
			<th>번호</th>
			<th>생성일</th>
			<th>컨텐츠 개수</th>
		</tr>
		<c:forEach var="cateVO" items="${cate_list}">
			<tr>
				<td>${cateVO.grpno }</td>
				<td>${cateVO.grpname}</td>
				<td>${cateVO.name}</td>
				<td>${cateVO.cateno }</td>
				<td>${cateVO.registdate }</td>
				<td>${cateVO.contentcnt }</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	</div>
	</div>
</body>
</html>