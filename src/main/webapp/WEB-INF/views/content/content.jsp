<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<div class="col-md-10">
				<h1>${contentvo.title}</h1>
			</div>
			<div class="col-md-2 text-center pt-4">
				${contentvo.rdate.substring(0,16)}</div>
		</div>
	</div>
	<div class="container p-2 pt-4 pb-4 border-bottom">
		<div class="row">
			<div class="col">${contentvo.content}</div>
		</div>
	</div>
	<div class="container p-2 pt-4 border-bottom edit_box" id=${contentvo.contentno }>
		<div class="row">
			<div class="col">
				<ul class="list-inline pb-4">
					<li class="list-inline-item mr-5" style="float: left">
						<img class="img-fluid" src="/images/coment_icon.png" style="width: 20px; height: 20px;"> &nbsp;
							${contentvo.replycnt}
					</li>
					<li class="list-inline-item mr-5" style="float: right">
						<button id="delete" class="btn p-0" type="button"><img class="img-fluid" src="/images/delete_icon.png" style="width: 26px; height: 26px;"></button>
							
					</li>
					<li class="list-inline-item mr-5" style="float: right">
						<button id="edit" class="btn p-0" type="button"><img class="img-fluid" src="/images/edit.png" style="width: 26px; height: 26px;"></button>
					</li>
					<li class="list-inline-item mr-5" style="float: right">
						<button id="recom" type="button" class="btn p-0"><img class="img-fluid" src="/images/recomend.png" style="width: 26px; height: 26px;"></button>
						 &nbsp; <span id="show_recom">${contentvo.recomcnt}</span>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<c:choose>
		<c:when test="${empty contentvo.file1}">
		</c:when>
		<c:otherwise>
			<div class="container p-2 pt-4 border-bottom">
				<div class="row">
					<div class="col-md-3">
						<img class="img-fluid" src="/images/file_icon.png"
							style="width: 20px; height: 20px;"><a
							href='/download?dir=/contents/storage&filename=${contentvo.file1saved}&downname=${contentvo.file1}'>${contentvo.file1}</a>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<script type="text/javascript" src="/js/content_ajax.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
</body>
</html>