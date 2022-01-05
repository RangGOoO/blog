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
		<div class="row mb-4 rounded text-black">
			<div class="col-md-12 p-3">
				<form action="./delete.do" method="POST">
					<input id="contentno" type='hidden' name='contentno' value='${param.contentno}'>
					<input id="cateno" type='hidden' name='cateno' value='${contentvo.cateno }'>
					<div class="row m-5">
						<div class="col-md-12 text-center font-weight-bold" style="font-size: 25px;">${contentvo.title } 글을 지우시겠습니까? 삭제시 복구가 불가능 합니다.</div>
					</div>
					<div class="row border-bottom m-5">
						<div class="col-md-12 text-center"><input class="input_css" type='password' name='passwd'  autofocus="autofocus" placeholder="패스워드 입력"></div>
					</div>
					<div class="row mb-2 pb-2 border-bottom mb-4" style="float: none; margin:0 auto;">	
						<div class="col-md-2" style="float: none; margin:0 auto; text-align: center;">
							<button type="submit" class="btn btn-dark">삭제</button>
						</div>
						<div class="col-md-2" style="float: none; margin:0 auto; text-align: center;">
							<button type="button" id="move_list" class="btn btn-dark">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<script type="text/javascript" src="/js/content_ajax.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
			crossorigin="anonymous"></script>
</body>
</html>