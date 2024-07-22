var count = 0;

$("#btnGetData").click(function () {
    loadDataAndDisplay();
});

function loadDataAndDisplay() {
    $(".loading").show(); 
    $(".display-data").hide(); 

    $.ajax({
        url: "https://jsonplaceholder.typicode.com/posts",
        method: "GET"
    }).done(function (data) {
        var start = count * 4;
        var end = start + 4;
        var str = "";
        for (var i = start; i < end && i < data.length; i++) {
            str += '<div class="item-details">' +
                '<strong>User Id:</strong> ' + data[i].userId + '<br />' +
                '<strong>Id:</strong> ' + data[i].id + '<br />' +
                '<strong>Title:</strong> ' + data[i].title + '<br />' +
                '</div>';
        }
        str += '<div class="page-number">Page: ' + (count + 1) + '</div>';

        $(".display-data").empty().append(str);
        $(".loading").hide(); 
        $(".display-data").show(); 

        if (end >= data.length) {
            count = 0;
            $(".display-data").append("All records displayed. Starting over!");
        } else {
            count++;
        }
    }).fail(function () {
        $(".loading").hide(); 
        $(".display-data").show(); 
        $(".display-data").empty().append("Failed to load data.");
    });
}