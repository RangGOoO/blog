$(document).on('click','.contnet_title', function(event){
    let target = $(event.target);
    let contentno = $(target).parents(".contnet_title").attr("id")
    $.ajax({
        type: "GET",
        url: "/content/update_clicknt.do",
        data: {"contentno" : contentno},
        dataType: "",
        success: function (response) {
        }
    });
    location.href = `http:/content/read_content.do?contentno=${contentno}`
})

$("#move_list").click(function (e) { 
    const cateno = $("#cateno").attr("value")
    location.href = `http:/content/cateno_search.do?cateno=${cateno}`

});
$(document).on('click','#move_list', function(event){
    const cateno = $("#cateno").attr("value")
    location.href = `http:/content/cateno_search.do?cateno=${cateno}`
})


$(document).on('click','#edit', function(event){
    let target = $(event.target);
    const contentno = $(target).parents(".edit_box").attr("id")
    $.ajax({
        type: "GET",
        url: `/content/update.do?contentno=${contentno}`,
        data: "",
        dataType: "html",
        success: function (response) {
            $('body').html(response)
        }
    });
})

$("#delete").click(function (event) { 
    let target = $(event.target);
    const contentno = $(target).parents(".edit_box").attr("id")
    $.ajax({
        type: "GET",
        url: `/content/delete.do?contentno=${contentno}`,
        data: "",
        dataType: "html",
        success: function (response) {
            $("body").html(response)
        }
    });
});

$("#recom").click(function (event) { 
    let target = $(event.target);
    const contentno = $(target).parents(".edit_box").attr("id")
    $.ajax({
        type: "GET",
        url: "/content/update_recom.do",
        data: {"contentno" : contentno},
        dataType: "json",
        success: function (response) {
            $("#show_recom").text(response.recom);
        }
    });
});