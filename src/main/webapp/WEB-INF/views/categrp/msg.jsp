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
	<ul style="list-style: none;">
		<c:choose>
			<c:when test="${param.code == 'pwd_fail'}">
				<LI style="width: 10%; margin-left: auto; margin-right: auto;"><span>패스워드가 일치하지 않습니다.</span></LI>
			</c:when>
			<c:when test="${param.code == 'create_success'}">
				<LI style="width: 10%; margin-left: auto; margin-right: auto;"><span>등록
						성공.</span></LI>
			</c:when>
			<c:when test="${param.code == 'update_fail'}">
				<LI style="width: 10%; margin-left: auto; margin-right: auto;"><span>수정에
						실패했습니다.</span></LI>
			</c:when>
			<c:when test="${param.code == 'delete_fail'}">
				<LI style="width: 10%; margin-left: auto; margin-right: auto;"><span>삭제에
						실패했습니다.</span></LI>
			</c:when>
		</c:choose>
		<LI style="width: 10%; margin-left: auto; margin-right: auto;">
			<button type='button' onclick="location.href='/categrp/grplist.do'"
				class="btn">목록</button>
		</LI>
	</ul>
	</div>
	</div>
	</div>
</body>
</html>