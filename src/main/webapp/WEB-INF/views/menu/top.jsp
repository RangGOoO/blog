<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3 fixed-top">
	<a class="navbar-brand" href="/">BLOG</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbar_list" aria-controls="navbar_list"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbar_list">
		<ul class="navbar-nav mr-auto" id="cate_bar">
			<li class="nav-item">
				<button class="btn btn-dark pt-2" id="manage_btn">Management</button>
			</li>
		</ul>
		<ul class="navbar-nav">
		<c:choose>
			<c:when test="${sessionScope.id == null }">
				<li class="nav-item" >
					<button class="btn btn-dark pt-2" id="login_btn">LOGIN</button>
				</li>
				<li class="nav-item" >
					<button class="btn btn-dark pt-2" id="SignUP_btn">Sign UP</button>
				</li>
			</c:when>
			<c:otherwise>
				<li class="nav-item text-white pt-2" >
					<i class="far fa-user"></i>
				</li>
				<li class="nav-item text-white pt-2 ml-2" >
					<span>${sessionScope.id}</span>
				</li>
				<li class="nav-item" >
					<button class="btn btn-dark pt-2" id="logout_btn">LOGOUT</button>
				</li>
			</c:otherwise>
		</c:choose>
		</ul>
		<form class="form-inline my-2 my-md-0" action="/content/cateno_search.do" method="GET" >
			<input class="form-control" type="text" placeholder="Search">
		</form>
	</div>
</nav>
<script src="https://kit.fontawesome.com/be0e61632b.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="/js/index_load.js"></script>

