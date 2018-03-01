const http=require("http");
const express=require("express");
const mysql=require("mysql");
const bodyParser=require("body-parser");
//2.创建连接池
var pool=mysql.createPool({
    host:"127.0.0.1",
    user:"root",
    password:"root",
    database:"rh",
    port:3306,
    connectionLimit:25
});
//3.创建服务器
var app=express();
var server=http.createServer(app);
server.listen(8081);
//4.加载静态目录
app.use(express.static("public"));
//配置body_parse
app.use(bodyParser.urlencoded({extended:false}));
//跨域
app.all('*',function (req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Content-Type,Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild');
    res.header('Access-Control-Allow-Methods', 'PUT, POST, GET, DELETE,OPTIONS');
    if (req.method == 'OPTIONS') {
        res.send(200);
    } else {
        next();
    }
});
var isShow="1";
//主页
//头部轮播图片加载和获得
//node js防止sql注入
app.get("/carousel",(reg,res)=>{
    var sql="SELECT *FROM  `carousel` where is_show = ? ";
    pool.getConnection((err,conn)=>{
        if(err){
            throw new Error;
        }else {
            conn.query(sql,[isShow],(err, result)=> {
                if (err) {
                    throw new Error;
                }else {
                    res.json(result);
                }
                conn.release();
            })
        }
    })
})
//最受欢迎图片信息的获得
app.get("/mostPopular",(req,res)=>{
    //sql表不能加引号
    var sql="SELECT pid,url,price,location,sdetail FROM project_detail where is_mp = ? ";
    pool.getConnection((err,conn)=>{
        if(err){
            throw new Error;
        }else{
            conn.query(sql,[isShow],(err,result)=>{
                if(err){
                    throw new Error;
                }else{
                    res.json(result);
                }
                conn.release();
            })
        }
    })
})
//工程艺术馆
app.get("/project",(req,res)=>{
    var sql="select pid,url,point,name,review,bdetail,price from project_detail where is_pg = ? ";
    pool.getConnection((err,conn)=>{
        if(err){
            throw new Error;
        }else{
            conn.query(sql,[isShow],(err,result)=>{
                if(err){
                    throw new err;
                }else{
                    res.json(result);
                }
                conn.release();
            })
        }
    })
})
//客户评价
app.get("/custom",(req,res)=>{
    var sql="select * from coustom_suggestion where is_show = ?";
    pool.getConnection((err,conn)=>{
        if(err){
            throw new Error;
        }else{
            conn.query(sql,[isShow],(err,result)=>{
                if(err){
                    throw new err;
                }else{
                    res.json(result);
                }
                conn.release();
            })
        }
    })
})
//合作伙伴
app.get("/parter",(req,res)=>{
    var sql="select * from parter where is_show = ?";
    pool.getConnection((err,conn)=>{
        if(err){
            throw new Error;
        }else{
            conn.query(sql,[isShow],(err,result)=>{
                if(err){
                    throw new err;
                }else{
                    res.json(result);
                }
                conn.release();
            })
        }
    })
})
//详情页
//查询轮播图片和详细信息
app.get('/detail',(req,res)=>{
    var pid=req.query.pid;
    if(!pid){
        pid=1;
    }
    var outPut={
        pid:pid,
        picture:[],
        single:[],
    }
    var sql1="select lg,sm from project_picture where pid= ? ";
    var sql2="select * from project_single where pid= ? ";
    pool.getConnection((err,conn)=>{
        if(err){
            throw new Error;
        }else{
            conn.query(sql1,[pid],(err,result)=>{
                if(err){
                    throw new Error;
                }else{
                    outPut.picture=result;
                }
                conn.release();
            })
        }
    })
    pool.getConnection((err,conn)=>{
        if(err){
            throw new Error;
        }else{
            conn.query(sql2,[pid],(err,result)=>{
                if(err){
                    throw  new Error;
                }else{
                    outPut.single=result;
                    res.json(outPut);
                }
                conn.release();
            })
        }
    })
})
//特色社区
app.get("/special",(req,res)=>{
    var sql="select * from special_project where is_show=?";
    pool.getConnection((err,conn)=>{
        if(err){
            throw new Error;
        }else{
            conn.query(sql,[isShow],(err,result)=>{
                if(err){
                    throw new err;
                }else{
                    res.json(result);
                }
                conn.release();
            })
        }
    })
})
//相关社区
app.get("/related",(req,res)=>{
    //接收来自于网页的pid
    var pid=req.query.pid;
    //var sql="select rpid from related_project where pid=?";
    var sql=`SELECT project_detail.pid,url, price, sdetail, location FROM project_detail INNER JOIN related_project ON project_detail.pid = related_project.rpid WHERE related_project.pid = ?`;
    pool.getConnection((err,conn)=>{
        if(err){
            throw new Error;
        }else{
            conn.query(sql,[pid],(err,result)=>{
                if(err){
                    throw new err;
                }else{
                    res.json(result);
                }
                conn.release();
            })
        }
    })
})
app.get("/hot",(req,res)=>{
    var sql="select * from hot_city where is_show=?";
    pool.getConnection((err,conn)=>{
        if(err){
            throw new Error;
        }else{
            conn.query(sql,[isShow],(err,result)=>{
                if(err){
                    throw new err;
                }else{
                    res.json(result);
                }
                conn.release();
            })
        }
    })
})
