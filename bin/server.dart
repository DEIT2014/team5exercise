import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:sqljocky/sqljocky.dart';
import 'package:args/args.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_cors/shelf_cors.dart' as shelf_cors;
import 'package:shelf_route/shelf_route.dart';
import 'dart:convert' show JSON;

Map<String, String> data = new Map();
Map<String, String> value = new Map();
final pool = new ConnectionPool(host: "localhost",
    port: 3306,
    user: 'suzyfish',
    db: 'teamfive',
    max: 5); //与数据库相连
Future main(List<String> args)async {

  //var results = await pool.query('select stuname,stuid,xkcj,xsky,shhd,jxj from stugrade');
  /*final filename = 'stugrade.json';
  results.forEach((row) {
    print('stuname: ${row.stuname}, stuid: ${row.stuid},xkcj: ${row.xkcj},xsky: ${row.xsky},shhd: ${row.shhd},jxj: ${row.jxj}');
    new File(filename).writeAsString('{"${row.stuname}":"${row.stuid}","${row.xkcj}","${row.xsky}","${row.shhd}","${row.jxj}"}')
        .then((File file){

    });
  });*/


  var myRouter = router();
   // myRouter.get('/', responseRoot);
   // myRouter.get('/login', forlogin);
    //myRouter.get('/no_login', forno_login);
    myRouter.get('/student/{stuid_x}', forstuid);
   // myRouter.get('/teacher/{teaid_x}', forteaid);
    //myRouter.get('/teacher/{teaid_x}/student/{stuid_m}', forteasearch);


Map <String, String> corsHeader = new Map();
corsHeader["Access-Control-Allow-Origin"] = "*";
corsHeader["Access-Control-Allow-Methods"] = 'POST,GET,OPTIONS';
corsHeader['Access-Control-Allow-Headers'] =
'Origin, X-Requested-With, Content-Type, Accept';
var routerHandler = myRouter.handler;
var handler = const shelf.Pipeline()
    .addMiddleware(shelf.logRequests())
    .addMiddleware(
    shelf_cors.createCorsHeadersMiddleware(corsHeaders: corsHeader))
    .addHandler(routerHandler);
io.serve(handler, '127.0.0.1', 8080).then((server) {
print('Serving at http://${server.address.host}:${server.port}');
});
/*
    forteasearch(request)
    {
      return new Response.ok();
    }
    ///教师输入自己的工号进行登录操作
    forteaid(request)
    {
      return new Response.ok();
    }
    ///学生输入自己的学号进行登录操作
    forstuid(request)
    {
      return new Response.ok();
    }
    ///登录失败页面
    forno_login(request)
    {
      return new Response.ok();
    }
    ///登陆页面
    forlogin(request)
    {
      return new Response.ok(sign_in());//要和dart连起来
    }

    ///欢迎进入奖学金评定系统
  responseRoot(request)
  {
    return new Response.ok("Hello World");
  }*/
}
Future<String> getDataFromDb() async {
  var results = await pool.query('select stuname,stuid,xkcj,xsky,shhd,jxj from stugrade');
  int i = 0;

  results.forEach((row) {
    //列出所有用户名
    String index = "stuname" + i.toString();
    value["stuname"]=row.stuname;
    value["stuid"]=row.stuid;
    value["xkcj"]=row.xkcj;
    value["xsky"]=row.xsky;
    value["shhd"]=row.shhd;
    value["jxj"]=row.jxj;
    String jsonValue = JSON.encode(value);
    data[index] = jsonValue;
    i++;
  });

  String jsonData = JSON.encode(data);

  return jsonData;
}



Future<shelf.Response> forstuid(shelf.Request request) async {
  //从数据库获取数据
  String userName = await getDataFromDb();

  //把这个post过来的数据有返回给客户端
  return new shelf.Response.ok('${userName}'    );
}

/*Future<shelf.Response> _echoRequest(shelf.Request request) async {
  //接受post过来的数据
  String content = await request.readAsString();
  //把这个post过来的数据有返回给客户端
  return new shelf.Response.ok(
      'server susscefullly get the post data from client is: "${content}');
}
///教师可根据学生的姓名学号，进行选择，从而知道学生的具体成绩信息*/


