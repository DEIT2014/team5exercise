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
import'package:jsonx/jsonx.dart';
import '../lib/subject.dart';

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
  myRouter.get('/search',handleSearch);
  myRouter.get('/student/{stuid_x}', forstuid);
  myRouter.get('/teacher/{teaid_x}', forteaid);
  myRouter.get('/subject/{subject_x}',forsub);
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


  /*  ///教师输入自己的工号进行登录操作
    forteaid(request)
    {
      return new Response.ok();
    }
    ///学生输入自己的学号进行登录操作
    forsub(request)
    {
    return new Response.ok();
    }
    ///学生查看学科成绩细节
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
  List<student> stuList = [];
  await results.forEach((row) {
    //列出所有用户名
    var stu = new student();

    stu.name = row.stuname;
    stu.id = row.stuid;
    stu.xkcj = row.xkcj;
    stu.xsky = row.xsky;
    stu.shhd = row.shhd;
    stu.jxj = row.jxj;
//从Object到JsonString的转换
    String stuJson = encode(stu);
    print(stuJson);
    stuList.add(stu);
  });
  String stuListJson = encode(stuList);
  print(stuListJson);
  return stuListJson;
}

Future<String> getDataFromDb_sub() async {
      var results = await pool.query(
          'select stuname,stuid,math,deit,english,phy from xkcj_show');
      List<subject> subList=[];
      await results.forEach((row) {
        //列出所有用户名
        var sub=new subject();
        sub.name=row.stuname;
        sub.id=row.stuid;
        sub.math=row.math;
        sub.deit=row.math;
        sub.english=row.english;
        sub.phy=row.phy;

//从Object到JsonString的转换
        String subJson=encode(sub);
        print(subJson);
        subList.add(sub);
      });
  String subListJson=encode(subList);
  print(subListJson);
  return subListJson;
}

Future<String> getDataFromDb_tea() async {
  var results = await pool.query('select teaname,teaid from teainfo');
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

Future<shelf.Response> forsub(shelf.Request request) async {
  //从数据库获取数据
  String userName_sub = await getDataFromDb_sub();
  return new shelf.Response.ok(
      ' ${userName_sub}'
  );
}


Future<shelf.Response> _echoRequest(shelf.Request request) async {
  //接受post过来的数据
  String content = await request.readAsString();
  //把这个post过来的数据有返回给客户端
  return new shelf.Response.ok(
      'server susscefullly get the post data from client is: "${content}');
}
///教师可根据学生的姓名学号，进行选择，从而知道学生的具体成绩信息
/*
Future<shelf.Response> handleSearch(shelf.Request request)async {
  var selectinfo = request.url.queryParameters['q'];//应该是与HTML有关系
    if (selectinfo == 0.toString()) {
      String userName_stu = await getDataFromDb_stu();
      String userName_stux =userName_stu[0];
      return new shelf.Response.ok( ' ${userName_stux}');
      request.context        ..writeln('搜索1004li成功');
  }*/
Future<shelf.Response> handleSearch(shelf.Request request) async {
  var search = request.url.queryParameters['q'];//应该是与HTML有关系
  if (search == 0.toString()) {
    return new shelf.Response.ok('hahaflualulualulualu!');
  }/*
  if (selectinfo ==  1.toString()) {
String userName_stu = await getDataFromDb_stu();
String userName_stux =userName_stu[1];
return new shelf.Response.ok( ' ${userName_stux}');
  }

  if (selectinfo ==  2.toString()) {
String userName_stu = await getDataFromDb_stu();
String userName_stux =userName_stu[2];
return new shelf.Response.ok( ' ${userName_stux}');
  }
  if (selectinfo ==  3.toString()) {
String userName_stu = await getDataFromDb_stu();
String userName_stux =userName_stu[3];
return new shelf.Response.ok( ' ${userName_stux}');
  }*/
}

