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
<body class="pt-5">
	<jsp:include page="../menu/top.jsp" flush='false' />
	<div class="container p-2 mt-3">
		<div class="row mb-4">
			<div class="col-md-8 p-3 rounded text-secondary border-bottom form_center">
				<h3>SING UP</h3>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row mb-4">
			<div class="col-md-8 rounded form_center">
				<form class="validation-form" id="singupForm">
					<div class="col-md-12 mb-4">
						<div class="row">
							<div class="col-md-9">
								<label for="id" class="m-0">*ID</label>
								<input type="text" class="input_css2 border-bottom" placeholder="ID" name="id" id="id">
								<div class="invalid-feedback">ID를 입력해주세요. 
								</div>
							</div>
							<div class="col-md-3 text-center pt-5">
								<button type="button" class="btn btn-ligth border text-secondary" id="check_id">CHECK ID</button>
							</div>
						</div>
					</div>
					<div class="col-md-12 mb-4">
						<label for="passwd">*PASSWORD</label>
						<input type="password" class="input_css border-bottom" placeholder="password" name="passwd" id="passwd">
						<div class="invalid-feedback">Password를 입력해주세요. 
						</div>
					</div>
					<div class="col-md-12 mb-4">
						<label for="check_pwd">*CHECK PASSWORD</label>
						<input type="password" class="input_css border-bottom" placeholder="password" id="check_passwd">
						<div class="invalid-feedback">Password를 확인해주세요. 
						</div>
					</div>
					<div class="col-md-12 mb-4">
						<div class="row"> 
							<div class="col-md-6">
								<label for="name">*NAME</label>
								<input type="text" class="input_css2 border-bottom" placeholder="NAME" name="name" id="name">
								<div class="invalid-feedback">이름을 입력해주세요. 
								</div>
							</div>
							<div class="col-md-6">
								<label for="phone_num">*PHONE NUMBER</label>
								<input type="text" class="input_css2 border-bottom" placeholder="010-0000-0000" name="phone_num" id="phone_num">
							</div>
						</div>
					</div>
					<div class="col-md-12 mt-5 mb-4">
						<div class="row">
							<div class="col-md-9">
									<label for="address" class="m-0">ADDRESS</label>
									<input type="text" class="input_css2 border-bottom" placeholder="address" name="address" id="address" style="font-size: 13px">
							</div>
							<div class="col-md-3 text-center pt-5">
								<button type="button" class="btn btn-ligth border text-secondary" id="find_address">주소 찾기</button>
							</div>
							<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
 								 <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>
						</div>
						<div class="row mt-5">
							<div class="col-md-9">
								<input type="text" class="input_css2 border-bottom" placeholder="detail address" name="address2" id="address2">
							</div>
						</div>
					</div>
					<div class="col-md-12 mb-4">
						<div class="row"> 
							<div class="col-md-12 text-center">
								<button type="button" class="btn btn-ligth border text-secondary" id="submit_btn">SING UP</button>	
							</div> 
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal_title">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="modal_body">      
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close_modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/member_ajax.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>