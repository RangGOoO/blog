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
				<div class="col-md-3" style="text-align: center;"><h1>${catevo.name }</h1></div>
				<div class="col-md-1 pt-3 offset-md-8 text-center"><a href="/content/create.do?cateno=${catevo.cateno}"><img class="img-fluid" id="content_add" src="/images/add_icon.png" style="width: 36px; height: 36px;"></a></div>
			</div>
		</div>
		<c:forEach var="contentvo" items="${content_list}">
			<div class="container p-2 mt-4 contnet_title" id="${contentvo.contentno}">
				<div class="row mb-4">
					<div class="col-md-10 p-1 bg-white rounded" style="float: none; margin:0 auto;">
						<div class="row" id="${contentvo.contentno}">
							<div class="col-md-4">
								<c:choose>
									<c:when test="${empty contentvo.thumb1}">
										<img src="/images/cat.png" class="img-fluid">
									</c:when>
									<c:otherwise>
										<img src="/contents/storage/${contentvo.thumb1}" class="img-fluid">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col">
								<div class="row border-bottom"><h4>${contentvo.title}</h4></div>
								<div class="row border-bottom pt-3 pb-3">
									<c:choose>
										<c:when test="${fn:length(contentvo.content) > 150}">
											${contentvo.content.substring(0,150)} . . .
										</c:when>
										<c:otherwise>
											${contentvo.content}
										</c:otherwise>
										</c:choose>
								</div>
								<div class="row">
									<div class="col-md-12 p-0">
										<ul class="list-inline pt-2">
								           	<li class="list-inline-item mr-5">${contentvo.rdate.substring(0,16)}</li>
								           	<li class="list-inline-item" style="float: right"><img class="img-fluid" src="/images/click_icon.png" style="width: 20px; height: 20px;"> &nbsp; ${contentvo.clickcnt}</li>
							        	</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="container p-2 pt-4 border-bottom">
			<div class="row">
				<div class="col-md-3" style="text-align: center; float: none; margin:0 auto;">
					<c:forEach var="i" begin="${start_page_num}" end="${end_page_num}">
						<span class="span_box_1 bg-dark"><a href="/content/cateno_search.do?cateno=${catevo.cateno }&page_num=${i}&word=${param.word}">${i }</a></span>
					</c:forEach>
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