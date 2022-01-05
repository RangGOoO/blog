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
	<div class="container-fluied p-2 mt-4" style="width: 80%; margin: 0 auto">
		<div class="row mb-4">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12 text-secondary border-bottom">
						<h1>Member List</h1>
					</div>
				</div>
				<div class="row pt-4">
					<div class="col-md-12 text-secondary border-bottom">
						<table class="table text-center">
							<tr>
								<td>NAME</td>
								<td>ID</td>
								<td>Phone Number</td>
								<td>Address</td>
								<td>Sing up date</td>
								<td>Option</td>
							</tr>
							<c:forEach var="member" items="${member_list}">
								<tr id='${member.MEMBERNO}'>
									<td>${member.name}</td>
									<td>${member.id}</td>
									<td>${member.phone_num}</td>
									<td>${member.address} ${member.address2 }</td>
									<td>${member.join_date}</td>
									<td>
										<button class="btn btn-ligth center shadow-none pt-0" ><i class="fas fa-edit"></i></button>
										<button class="btn btn-ligth center shadow-none pt-0" ><i class="fas fa-trash-alt"></i></button>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://kit.fontawesome.com/be0e61632b.js" crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
</body>
</html>