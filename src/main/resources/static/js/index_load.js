$(function() {
    $.ajax({
        type: "GET",
        url: "/index_load.do",
        data: "",
        dataType: "JSON",
        success: function (data) {
            for(let item of data) {
                $("#cate_bar").prepend(`
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle cate_li" href="#" data-toggle="dropdown" aria-expanded="false" id="${item.id}">${item.name}</a>
                        <div class="dropdown-menu bg-dark" id="drop_${item.id}">
                        </div>
                    </li>`
                );         
            }
        }
    })

})
$(document).on('click','.cate_li', function(event){
    let target = $(event.target);
    let send_data = {"id" : target.attr("id")}
    $.ajax({
        type: "GET",
        url: "/cate_load.do",
        data: send_data,
        dataType: "JSON",
        success: function (data) {
            for (let cate of data) {
                $(`#drop_${target.attr("id")}`).append(`<a class="dropdown-item cate_move" href="/content/cateno_search.do?cateno=${cate.id}" id=${cate.id}>${cate.name}</a>`);
            }
        }
    });
})

$("#SignUP_btn").click(function (e) { 
    location.href = `http:/member/signup.do`
});

$("#manage_btn").click(function (e) { 
    location.href = "http:/management.do"
});

$("#login_btn").click(function (e) { 
    location.href = "http:/login.do"
});
$("#logout_btn").click(function (e) { 
    $.ajax({
        type: "GET",
        url: "/logout.do",
        dataType: "JSON",
        success: function (response) {
            location.href = response.url
        }
    });
});