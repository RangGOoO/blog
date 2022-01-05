$(function() {
    $("#check_id").on("click", checkID);
    $("#close_modal").on("click", close_modal)
    $("#find_address").on("click", DaumPostcode)
    $("#submit_btn").on("click", Signupsubmit)
    $("#login").on("click", login)
})

function checkID() {
    let id = $("#id").val()
    let data = {"id" : id}
   
    if (id.length == 0) {
        modal("ID ERROR","ID를 입력해주세요")
    } else {
        $.ajax({
            type: "GET",
            url: "/checkID.do",
            data: data,
            dataType: "json",
            success: function (data) {
                if(data.cnt == 0){
                    modal("ID CHECK", "사용 가능한 ID 입니다.")
                } else {
                    modal("ID CHECK","이미 사용중인 ID 입니다.")
                }
            }
        });
    }
}

function close_modal() {
    $("#modal").modal("hide")
}


let element_wrap = document.getElementById('wrap');

function foldDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_wrap.style.display = 'none';
}

function DaumPostcode() {
    // 현재 scroll 위치를 저장해놓는다.
    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = data.address; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 기본 주소가 도로명 타입일때 조합한다.
            if(data.addressType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            // $('#zipcode').val(data.zonecode); // 5자리 새우편번호 사용 ★
            $('#address').val(fullAddr);  // 주소 ★

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_wrap.style.display = 'none';

            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
            document.body.scrollTop = currentScroll;
            
            $('#address2').focus(); //  ★
        },
        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
        onresize : function(size) {
            element_wrap.style.height = size.height+'px';
        },
        width : '100%',
        height : '100%'
    }).embed(element_wrap);

    // iframe을 넣은 element를 보이게 한다.
    element_wrap.style.display = 'block';
}


function modal(title, body) {
    $("#modal").modal("show")
    $("#modal_title").text(title)
    $("#modal_body").text(body)
}

function Signupsubmit() {

    let passwd = $("#passwd").val()
    let id = $("#id").val()
    let name = $("#name").val()
    let phone_num = $("#phone_num").val()

    if(passwd == $("#check_passwd").val() && id.length > 0 && name.length > 0 && phone_num.length > 0) {
        let data = $("#singupForm").serialize()
        $.ajax({
            type: "POST",
            url: "/signup.do",
            data: data,
            dataType: "html",
            success: function (response) {
                $('body').html(response)
            }
        });
    } else if(id.length == 0) {
        modal("ID ERROR","ID를 입력해주세요")
    } else if (passwd.length == 0) {
        modal("Password Error", "패스워드를 입력해주세요")
    } else if(name.length == 0) {
        modal("NAME ERROR", "이름을 입력해주세요")
    } else if(phone_num.length == 0) {
        modal("PHONE NUMBER ERROR", "핸드폰 번호 입력해주세요")
    } else {
        modal("Password Error", "패스워드가 일치하지 않습니다.")
    }
}

function login() {
    const id = $("#id").val()
    const passwd = $("#passwd").val()
    let data = {"id" : id, "passwd": passwd}
    $.ajax({
        type: "POST",
        url: "/login.do",
        data: data,
        dataType: "JSON",
        success: function (response) {
            if (response.cnt == 1){
                location.href = "/"
            }else{
                alert("아이디 또는 패스워드를 확인해주세요")
            }
        }
    });
}