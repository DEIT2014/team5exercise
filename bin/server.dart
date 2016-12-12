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
  int i = 0;
  List<student> stu=new List(2);
  String jsonStr;
  results.forEach((row) {
    //列出所有用户名
    String index = "stuname" + i.toString();
 value["stuname"]=row.stuname;
    value["stuid"]=row.stuid;
    value["xkcj"]=row.xkcj;
    value["xsky"]=row.xsky;
    value["shhd"]=row.shhd;
    value["jxj"]=row.jxj;

/*
    stu[i].name=row.stuname.toString();
    stu[i].id= row.stuid.toString();
    stu[i].xkcj= row.skcj.toString();
    stu[i].shhd = row.shhd.toString();
    stu[i].xsky = row.xsky.toString();
    stu[i].jxj = row.jxj.toString();
    value["stuname"]=stu[i].name;
    value["stuid"]=stu[i].id;
    value["xkcj"]=stu[i].xkcj;
    value["xsky"]=stu[i].xsky;
    value["shhd"]=stu[i].shhd;
    value["jxj"]=stu[i].jxj;
    var animal = new JsonObject();
    var jsonValue = JSON.encode(stu[0]);
*/

    objectToJson(stu[0]).then((jsonStr) => print(jsonStr));
    String jsonValue = JSON.encode(value);
    data[index] = jsonValue;
    i++;
  });
  String jsonData = JSON.encode(data);
  return jsonData;
 // return jsonStr;

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


