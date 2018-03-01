//引入头
header();
//  轮播图片的获得
$.ajax({
    type:"get",
    url:'http://localhost:8081/carousel'
}).then((data)=>{
//  轮播图片的加载
    var html="";
    for(var i=0;i<data.length;i++){
        if(i==0){
            html+=`<div class="item active">
                <img src='${data[i].img_src}' alt=${data[i].uid}>
                <div class="carousel-caption">
                    <h3><span>${data[i].img_title1}&nbsp;</span>${data[i].img_title2}</h3>
                    <p>${data[i].img_detail}</p>
                </div>
            </div>`
        }else{
            html+=`<div class="item">
                <img src='${data[i].img_src}' alt=${data[i].uid}>
                <div class="carousel-caption">
                    <h3><span>${data[i].img_title1}&nbsp;</span>${data[i].img_title2}</h3>
                    <p>${data[i].img_detail}</p>
                </div>
            </div>`
        }
    }
    $(".carousel-inner").html(html);
})
//轮播的控制
$(function () {
    $("#myCarousel").carousel('cycle');
});
//最受欢迎部分
$.ajax({
    type:"get",
    url:'http://localhost:8081/mostPopular',
}).then((data)=>{
    var html="<h3>最受欢迎的</h3>";
    for(var mpInfo of data){
        html+=`<div class="col-md-4 box_2">
                <a href="single.html" class="mask">
                    <img class="img-responsive zoom-img" src='${mpInfo.url}' alt=${mpInfo.pid}>
                    <span class="four">¥${mpInfo.price}/晚</span>
                </a>
                <div class="most-1">
                    <h5><a href="single.html?kw=${mpInfo.pid}">${mpInfo.location}</a></h5>
                    <p>${mpInfo.sdetail}</p>
                </div>
            </div>`
    }
    html+=`<div class="clearfix"> </div>`;
    $(".content-grid>.container").html(html);
})
//工程艺术馆
$.ajax({
    type:"get",
    url:"http://localhost:8081/project",
}).then((data)=>{
    var html="";
for(var pg of data){
html+=`<div class="col-md-3 project-grid">
                    <div class="project-grid-top">
                        <a href="single.html" class="mask"><img src='${pg.url}' class="img-responsive zoom-img" alt=${pg.pid}></a>
                        <div class="col-md1">
                            <div class="col-md2">
                                <div class="col-md3">
                                    <span class="star">${pg.point}</span>
                                </div>
                                <div class="col-md4">
                                    <strong>${pg.name}</strong>
                                    <small>${pg.review}评论</small>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <p>${pg.bdetail}</p>
                            <p class="cost">¥${pg.price}/晚</p>
                            <a href="single.html?kw=${pg.pid}" class="hvr-sweep-to-right more">查看详情</a>
                        </div>
                    </div>
                </div>`
}
    html+=`<div class="clearfix"> </div>`;
    $(".project-top").html(html);
})
//带参数跳转到详情页
$(".content").on("click",".mask>img",function(e){
    e.preventDefault();
    console.log($(e.target).attr('alt'));
    var pid=$(e.target).attr('alt');
    location=
        "single.html?kw="+pid;
})
//客户评价
$.ajax({
    type:"get",
    url:"http://localhost:8081/custom"
}).then((data)=>{
var html1="",html2="";
    for(var i=0;i<data.length;i++){
        if(i==0||i==1){
            html1+=`<div class=" bottom-in">
                    <p class="para-in">${data[i].messages}</p>
                    <i class="dolor"> </i>
                    <div class="men-grid">
                        <a href="#" class="men-top"><img class="img-responsive men-top" src='${data[i].avatar}' alt=${data[i].cid}></a>
                        <div class="men">
                            <span>${data[i].cname}</span>
                            <p>${data[i].sign}</p>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>`
        }else{
            html2+=`<div class=" bottom-in">
                    <p class="para-in">${data[i].messages}</p>
                    <i class="dolor"> </i>
                    <div class="men-grid">
                        <a href="#" class="men-top"><img class="img-responsive men-top" src='${data[i].avatar}' alt=${data[i].cid}></a>
                        <div class="men">
                            <span>${data[i].cname}</span>
                            <p>${data[i].sign}</p>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>`
        }
    }
    $(".name-in").html(html1);
    $(".name-on").html(html2);
})
//合作伙伴
$.ajax({
    type:"get",
    url:"http://localhost:8081/parter"
}).then((data)=>{
    var html1="",html2="";
    for(var i=0;i<data.length;i++) {
        if (i<data.length / 2) {
            html1 += `<li><a href="#"><img class="img-responsive" src='${data[i].trade_mark}' alt=${data[i].pid}></a></li>`;
        }else{
            html2 += `<li><a href="#"><img class="img-responsive" src='${data[i].trade_mark}' alt=${data[i].pid}></a></li>`;
        }
    }
    $(".parter1").html(html1);
    $(".parter2").html(html2);
})
footer();