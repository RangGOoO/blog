$("#show_list").click(function (e) { 
    const categrpno = $("#grpno").attr("value")
    $.ajax({
        type: "GET",
        url: `/cate/list_by_categrpno.do?categrpno=${categrpno}`,
        data: "",
        dataType: "html",
        success: function (response) {
            $('body').html(response)
        }
    });    
});
$("#cate_add").click(function (e) { 
    const categrpno = $("#grpno").attr("value")
    $.ajax({
        type: "GET",
        url: `/cate/catecreate.do?categrpno=${categrpno}`,
        data: "data",
        dataType: "html",
        success: function (response) {
            $('body').html(response)
        }
    });
});

$(".cate_edit").click(function (e) { 
    $("#edit_box").css("display", "block")
    let click_info = $(e.target);
    const cateno = click_info.attr("id")
    $.ajax({
        type: "GET",
        url: `/cate/update.do?cateno=${cateno}`,
        data: "",
        dataType: "html",
        success: function (response) {
            $("#edit_main").children().remove();
            $("#edit_main").append(response);
        },
        error: function (resp) {
            alert("수정 실패")
        }
    });
});

// $("#cate_delete").click(function (e) { 
//     let cate_info = $("#cateno");
//     const cateno = cate_info.attr("id")
//     console.log(cateno)
// });
$(document).on('click','#cate_delete', function(event){
    let cate_info = $("#cateno");
    let cateno = cate_info.attr("value")
    $.ajax({
        type: "GET",
        url: `/cate/delete.do?cateno=${cateno}`,
        data: "",
        dataType: "html",
        success: function (response) {
            console.log(response)
            $('body').html(response)
        },
        error: function (resp) {
            alert("삭제 실패")
        }
    });
})