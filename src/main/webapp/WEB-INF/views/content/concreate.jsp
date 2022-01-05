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
	<div class="container p-2 pt-4 border-bottom">
		<div class="row">
			<div class="col-md-12">
				<h4>${grpvo.catename } > ${catevo.name}</h4>
			</div>
		</div>
	</div>
	<div class="container p-2 pt-4">
		<div class="row">
			<div class="col-md-12">
				<form name="frm" action="./create.do" method='POST' style="width: 100%; margin: 0 auto;" enctype="multipart/form-data">
					<input type="hidden" name="categrpno" value="${catevo.categrpno }">
					<input type="hidden" id="cateno" name="cateno" value="${param.cateno }">
					<input type="hidden" name="adminno" value="1">
					<div class="row mb-2 pb-2 border-bottom">
						<div class="col-md-12"><input type="text" name="title" placeholder="제목을 입력하세요" style="border:none; width: 100%; height: 100%; font-size: 30px;"></div>
					</div>
					<div class="row mb-2 pb-2 border-bottom"">
						<div class="col-md-12">
							<textarea rows="12" name="content" class="form-control" style="height: 600px; border: none;"></textarea>
						</div>
					</div>
					<div class="row mb-2 pb-2 border-bottom"">
						<div class="col-md-12">
							<input type="text" name="word" placeholder="태그 입력" style="border:none; width: 100%; height: 100%; font-size: 15px;">
						</div>
					</div>
					<div class="row mb-2 pb-2 border-bottom"">
						<div class="col-md-12">
							<input type="text" name="passwd" placeholder="password" style="border:none; width: 100%; height: 100%; font-size: 15px;">
						</div>
					</div>
					<div class="row mb-2 pb-2 border-bottom"">
						<div class="col-md-12">
							<input type="file" name="file1MF" id="formFileMultiple" placeholder="파일 선택" style="border:none; width: 100%; height: 100%;">
						</div>
					</div>
					<div class="row mb-2 pb-2 border-bottom" style="float: none; margin:0 auto;">	
						<div class="col-md-2" style="float: none; margin:0 auto; text-align: center;">
							<button type="submit" class="btn btn-dark">등록</button>
						</div>
						<div class="col-md-2" style="float: none; margin:0 auto; text-align: center;">
							<button type="button" id="move_list" class="btn btn-dark">목록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="/js/content_ajax.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
</body>
</html>