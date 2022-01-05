<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form class="text-center p-5 form_center" action="./update.do" method="post" style="width: 70%;">
		<input type="hidden" name='categrpno' class='form-control' value="${categrpvo.categrpno }">
		<input type="hidden" name="cateno" class="form-control" value="${catevo.cateno }" id="cateno">
		
			<div class="row form-group">
				<div class="col p-2"> 
					카테고리 이름<input type='text' name='name' class='form-control' value="${catevo.name }">
			</div>
			<div class="col-md-2 pt-4 pl-0 pr-0 m-auto"><button type="submit" class="btn btn-outline-light">수정</button></div>
			<div class="col-md-2 pt-4 pl-0 pr-0 m-auto"><button type="button" class="btn btn-outline-light" id="cate_delete">삭제</button></div>
		</div>
</form>