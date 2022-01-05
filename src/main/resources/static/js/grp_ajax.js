$("#grp_add").click(function (e) { 
    $.ajax({
        type: "GET",
        url: "/categrp/grpcreate.do",
        data: "",
        dataType: "html",
        success: function (response) {
            $('body').html(response)
        }
    });
});

$("#show_list").click(function (e) { 
    $.ajax({
        type: "GET",
        url: "/categrp/grplist.do",
        data: "",
        dataType: "html",
        success: function (response) {
            $('body').html(response)
        }
    });
});
