<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<form class="text-center p-5 form_center" action="grpcreate.do" method="post" style="width: 50%">
					<input type="text" name="catename" class="form-control mb-4" placeholder="Categroup name">
					<label>출력 순서</label>
					<input type="number" name="seq" class="form-control mb-4" value='1'>
					<div class="form-row">
						<div class="col">
							<button class="btn btn-outline-light" type="submit">등록</button>
						</div>
						<div class="col">
							<button class="btn btn-outline-light" type="button" id="show_list">목록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<script type="text/javascript" src="/js/grp_ajax.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
			crossorigin="anonymous"></script>
</body>
</html>