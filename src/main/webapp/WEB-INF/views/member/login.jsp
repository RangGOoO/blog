<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLOG</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/NanumGgocNaeEum.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body class="pt-5" id="bg" >
	<jsp:include page="../menu/top.jsp" flush='false' />
	<div class="container-fluied p-2 mt-4">
		<div class="row m-0">
			<div class="col-md-12 text-center">
				<form action="" class="border rounded center validation-form bg-light" style="width: 30%; opacity: 0.7">
					<div class="row mt-4 mb-4">
						<h3 class="center">Welcome!</h3>
					</div>
					<div class="row mt-4 mb-4">
						<div class="col-md-9 center">
							<input type="text" class="input_css3 border-bottom border-dark" placeholder="ID" name="id" id="id">
						</div>
					</div>
					<div class="row mt-4 mb-4">
						<div class="col-md-9 center">
							<input type="password" class="input_css3 border-bottom border-dark" placeholder="PASSWD" name="passwd" id="passwd">
						</div>
					</div>
					<div class="row mt-4 mb-4">
						<div class="col-md-9 center">
							<button type="button" class="btn btn-ligth border bg-dark text-light" id="login">LOG IN</button>	
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/js/member_ajax.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>