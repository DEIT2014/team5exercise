import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_route/shelf_route.dart';
import 'package:sqljocky/sqljocky.dart';
import 'dart:async';
import 'dart:io';
import 'package:route_hierarchical/client.dart';
import 'package:shelf_cors/shelf_cors.dart' as shelf_cors;

Future main() async {//怎么把登录的数据转换成json文件？

  var pool = new ConnectionPool(host: 'localhost', port: 3306, user: 'suzyfish',  db: 'teamfive', max: 5);//从数据库取出用户名和密码
  var results = await pool.query('select yhm,mm from users');
  final filename = 'yhm_mm.json';
  results.forEach((row) {
    print('login_name: ${row.yhm}, login_key: ${row.mm}');
    new File(filename).writeAsString('{"${row.yhm}":"${row.mm}"}')
        .then((File file){

    });
  });
//shelf_cors
/*  shelf.Response handleAll(shelf.Request request) {
    return new shelf.Response.ok("OK");
  }

  var handler = const shelf.Pipeline()
      .addMiddleware(shelf_cors.createCorsHeadersMiddleware())
      .addHandler(handleAll);

  shelf_io.serve(handler, InternetAddress.ANY_IP_V4, port).then((server) {
    print("Serving at http://${server.address.host}:${server.port}");
  });
void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");//解除限制
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}*/
  var myRouter = router()
    ..get('/', responseRoot);
  /*  ..get('/login', forlogin)
    ..get('/no_login', forno_login)
    ..get('/student/{stuid_x}', forstuid)
    ..get('/teacher/{teaid_x}', forteaid)
    ..get('/teacher/{teaid_x}/student/{stuid_m}', forteasearch);
*/

  io.serve(myRouter.handler, '127.0.0.1', 8080);
}
///教师可根据学生的姓名学号，进行选择，从而知道学生的具体成绩信息
/*forteasearch(request)
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
*/
///欢迎进入奖学金评定系统
responseRoot(request)
{
  return new Response.ok("Hello World");
}

