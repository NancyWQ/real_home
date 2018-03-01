header();
//手风琴效果
$(function() {
    var menu_ul = $('.banner-buying>.container>.menu-right>.menu > li > ul'),
        menu_a  = $('.banner-buying>.container>.menu-right>.menu > li > a');
    menu_ul.hide();
    menu_a.click(function(e) {
        e.preventDefault();
        if(!$(this).hasClass('active')) {
            menu_a.removeClass('active');
            menu_ul.filter(':visible').slideUp('normal');
            $(this).addClass('active').next().stop(true,true).slideDown('normal');
        } else {
            $(this).removeClass('active');
            $(this).next().stop(true,true).slideUp('normal');
        }
    });

});
var pid=location.search.split("=")[1];
//alert(pid);
$(".id").html(`这是第${pid}个产品`);
$.ajax({
    type:"get",
    url:"http://localhost:8081/detail",
    data:{pid:pid}
}).then((data)=>{
    //console.log(data);
    var html=' <ul class="slides">';
    for(var picture of data.picture){
        html+=` <li data-thumb='${picture.sm}'>
                            <img src='${picture.lg}'/>
                        </li>`
    }
    html+=`</ul>`;
    $(".flexslider").html(html);
    //轮播
    $(window).load(function() {
        $('.flexslider').flexslider({
            animation: "slide",
            controlNav: "thumbnails"
        });
    });
    html=" ";
    html+=`<h4>详细信息</h4>
                    <p><span class="bath">床位</span>: <span class="two">${data.single[0].bed}</span>个</p>
                    <p><span class="bath">浴室 </span>: <span class="two">${data.single[0].bath}</span>间</p>
                    <p><span class="bath"> 最多住几人</span>: <span class="two">${data.single[0].maxperson}</span>人</p>
                    <p><span class="bath">几间卧室 </span>:<span class="two">${data.single[0].bedroom}</span>间</p>
                    <p><span class="bath">住几天</span> : <span class="two">${data.single[0].least_night}</span>天</p>
                    <p><span class="bath">价格</span>:<span class="two">${data.single[0].price}</span>元每晚</p>
                    <div class="right-side">
                        <a href="contact.html" class="hvr-sweep-to-right more" >联系房东</a>
                    </div>`;
    $(".immediate").html(html);
    //详细信息的加载
    $(".description").html(`${data.single[0].description}`);
})
//特色社区
$.ajax({
    type:"get",
    url:"http://localhost:8081/special",
}).then((data)=>{
var html="<h4>特色社区</h4>";
    for(var special of data){
        html+=` <div class="single-box-img">
                    <div class="box-img">
                        <a href="single.html?kw=${special.pid}"><img class="img-responsive" src="${special.url}" alt=""></a>
                    </div>
                    <div class="box-text">
                        <p><a href="single.html?kw=${special.pid}">${special.title}</a></p>
                        <a href="single.html?kw=${special.pid}" class="in-box">More Info</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>`
    }
    $(".right-immediate").html(html);
})
//相关工程
$.ajax({
    type:"get",
    url:"http://localhost:8081/related",
    data:{pid:pid}
}).then((data)=>{
    console.log(data);
    var html="";
    for(var related of data){
        if(related.sdetail.length>=10){
            var sdetail=related.sdetail.slice(0,10)+"...";
        }else{
            sdetail=related.sdetail;
        }
            html+=`<li><div class="project-fur">
                    <a href="single.html?kw=${related.pid}" ><img class="img-responsive" src="${related.url}" alt="" />	</a>
                    <div class="fur">
                        <div class="fur1">
                            <span class="fur-money">¥${related.price}元每晚</span>
                            <h6 class="fur-name"><a href="single.html?kw=${related.pid}">${sdetail}</a></h6>
                            <span>${related.location}</span>
                        </div>
                        <div class="fur2">
                            <span>2 BHK</span>
                        </div>
                    </div>
                </div></li>`
    }
    $("#flexiselDemo1").html(html);
    //滚动
    $(window).load(function() {
        $("#flexiselDemo1").flexisel({
            visibleItems: 4,
            animationSpeed: 1000,
            autoPlay: true,
            autoPlaySpeed: 3000,
            pauseOnHover: true,
            enableResponsiveBreakpoints: true,
            responsiveBreakpoints: {
                portrait: {
                    changePoint:480,
                    visibleItems: 1
                },
                landscape: {
                    changePoint:640,
                    visibleItems: 2
                },
                tablet: {
                    changePoint:768,
                    visibleItems: 3
                }
            }
        });

    });
})
//footer();
