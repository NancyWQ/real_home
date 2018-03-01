
function header(){
    $.ajax({
        type:"get",
        url:"header.html"
    }).then((data)=>{
        $(".headers").html(data);
    });
}

function footer(){
    $.ajax({
        type:"get",
        url:"footer.html"
    }).then((data)=>{
        $(".footers").html(data);
    });
}
