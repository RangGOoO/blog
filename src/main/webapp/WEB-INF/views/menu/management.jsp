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
		<div class="row mb-4">
			<div class="col-md-12 p-5">
				<div class="row">
					<div class="col-md-12 text-secondary border-bottom">
						<h1>Management</h1>
					</div>
				</div>
				<div class="row pt-4">
					<div class="col-md-12 text-secondary border-bottom">
						<button class="btn btn-ligth text-secondary shadow-none" id="cate_btn"><h4>카테고리 관리</h4></button>
					</div>
				</div>
				<div class="row pt-4">
					<div class="col-md-12 text-secondary border-bottom">
						<button class="btn btn-ligth text-secondary shadow-none" id="member_btn"><h4>회원 관리</h4></button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#cate_btn").on("click",function (e) {
		    console.log("카테고리 관리 클릭")
		    location.href = "http:/categrp/grplist.do"
		})	
		$("#member_btn").on("click",function (e) {
		    console.log("카테고리 관리 클릭")
		    location.href = "http:/member/member_list.do"
		})
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
</body>
</html>