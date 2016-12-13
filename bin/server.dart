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
import '../lib/stu_class.dart';
import 'package:json_object/json_object.dart';
import'package:jsonx/jsonx.dart';

Map<String, String> data = new Map();
Map<String, String> value = new Map();
Map<String, String> data1 = new Map();
Map<String, String> value1 = new Map();

final pool = new ConnectionPool(host: "localhost",
    port: 3306,
    user: 'suzyfish',
    db: 'teamfive',
    max: 5); //与数据库相连
Future main(List<String> args)async {
    var myRouter = router();
   // myRouter.get('/', responseRoot);
   // myRouter.get('/login', forlogin);
    //myRouter.get('/no_login', forno_login);
    myRouter.get('/student/{stuid_x}', forstuid);
    myRouter.get('/teacher/{teaid_x}', forteaid);
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

Future<String> getDataFromDb_stu() async {
  var results = await pool.query(
      'select stuname,stuid,xkcj,xsky,shhd,jxj from stugrade');


  var stuList=[];
  results.forEach((row) {
    //列出所有用户名
    var stu=new student();
    stu.name=row.stuname;
    stu.id= row.stuid;
    stu.xkcj= row.skcj;
    stu.shhd = row.shhd;
    stu.xsky = row.xsky;
    stu.jxj = row.jxj;
//从Object到JsonString的转换
    String stuJson=encode(stu);
    print(stuJson);

    stuList.add(stu);

////*/从JsonString到Object的转换
//    String value='{"name":"lily","id"="1"}';
//    student stu2=decode(value,type: student);
//    String stuJson2=encode(stu2);
//    print(stuJson2);
//    //从object数组到JsonString的转换
//    var stuList=[];
//    stuList.add(stu);
//    stuList.add(stu2);
//    String stuListJson=encode(stuList);
//    print(stuListJson);
//    List<student> stu=decode(stuListJson,type: const TypeHelper<List<student>>().type);*/

    /*
    String jsonValue = JSON.encode(value);
    data[index] = stuJson;
    i++;*/
  });
  String stuListJson=encode(stuList);
  print(stuListJson);
  return stuListJson;
 // return sr;

}

  Future<String> getDataFromDb_tea() async {
      var results = await pool.query('select teaname,teaid from tea_infor');
      int i = 0;
      results.forEach((row) {
        //列出所有用户名
        String index1 = "teaname" + i.toString();
        value1["teaname"]=row.teaname;
        value1["teaid"]=row.teaid;
        data1[index1] = JSON.encode(value1);
        i++;
      });
      String jsonData = JSON.encode(data1);
      return jsonData;
    }



Future<shelf.Response> forstuid(shelf.Request request) async {
  //从数据库获取数据
  String userName_stu = await getDataFromDb_stu();

  //把这个post过来的数据有返回给客户端
  return new shelf.Response.ok('${userName_stu}'    );
}

Future<shelf.Response> forteaid(shelf.Request request) async {
      //从数据库获取数据
      String userName_tea = await getDataFromDb_tea();

      //把这个post过来的数据有返回给客户端
      return new shelf.Response.ok(
          ' ${userName_tea}'
      );
    }

/*Future<shelf.Response> _echoRequest(shelf.Request request) async {
  //接受post过来的数据
  String content = await request.readAsString();
  //把这个post过来的数据有返回给客户端
  return new shelf.Response.ok(
      'server susscefullly get the post data from client is: "${content}');
}
///教师可根据学生的姓名学号，进行选择，从而知道学生的具体成绩信息*/


