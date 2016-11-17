import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_route/shelf_route.dart';

void main() {

  var myRouter = router()
    ..get('/', responseRoot)
    ..get('/login', forlogin)
    ..get('/no_login', forno_login)
    ..get('/student/{stuid_x}', forstuid)
    ..get('/teacher/{teaid_x}', forteaid)
    ..get('/teacher/{teaid_x}/student/{stuid_m}', forteasearch);


  io.serve(myRouter.handler, '127.0.0.1', 8080);
}
///教师可根据学生的姓名学号，进行选择，从而知道学生的具体成绩信息
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
///登陆成功页面
forlogin(request)
{
  return new Response.ok();
}

///欢迎进入奖学金评定系统
responseRoot(request)
{
  return new Response.ok("Hello World");
}

