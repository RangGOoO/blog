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
				<table class="table form_center text-white"
					style="width: 95%; text-align: center;">
					<tr>
						<td>번호</td>
						<td>이름</td>
						<td>생성일</td>
						<td colspan="3">기타</td>
					</tr>
					<c:forEach var="categrpVO" items="${list }">
						<tr>
							<td>${categrpVO.seq }</td>
							<td><a href="/cate/list_by_categrpno.do?categrpno=${categrpVO.categrpno}">${categrpVO.catename}</a></td>
							<td>${categrpVO.cdate }</td>
							<td><a href="./read.do?categrpno=${categrpVO.categrpno }">수정</a></td>
							<td><a href="./delete.do?categrpno=${categrpVO.categrpno }">그룹
									삭제</a></td>
							<td><a
								href="/cate/catecreate.do?categrpno=${categrpVO.categrpno }">카테고리
									추가</a></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6"><button type="button" class="btn btn-dark" id="grp_add">+</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/js/grp_ajax.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
</body>
</html>