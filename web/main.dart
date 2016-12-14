// Copyright (c) 2016, icecreamtoo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';

import 'dart:convert' show JSON;
import 'dart:core'as core;
import  'dart:convert';
import 'dart:core';
import 'package:route_hierarchical/client.dart';
import '../lib/stu_class.dart';
import 'package:jsonx/jsonx.dart';


String note;
TextInputElement TextInput;
ParagraphElement displayNote;
TableElement displayTable;
var host = 'http://localhost:8080';

void main() {
///登陆界面
  TextInput = querySelector('#login_yhm');//用户名输入
  TextInput = querySelector('#login_mm');//用户密码输入
  //点击学生登录和教师登录链接
  querySelector('#link_stu').onClick.listen(enter_stu);
  querySelector('#link_tea').onClick.listen(enter_tea);

 var router = new Router(useFragment: true);

 router.root
  ..addRoute(name: 'stu_login', defaultRoute: true, path: '/student/{stuid_x}', enter: enter_stu_login)
  ..addRoute(name: 'tea_login',  path: '/teacher/{teaid_x}', enter: enter_tea_login);

 querySelector('#link_stu').attributes['href'] = router.url('stu_login');
 querySelector('#link_tea').attributes['href'] = router.url('tea_login');

 router.listen();
}

void enter_stu_login(RouteEvent e) {

  querySelector('#stu_login').classes.add('selected');
  querySelector('#tea_login').classes.remove('selected');
}
void enter_tea_login(RouteEvent e) {
  querySelector('#stu_login').classes.remove('selected');
  querySelector('#tea_login').classes.add('selected');
}
/// 用来接受用户点击登录按钮以后的响应工作
void enter_tea(MouseEvent e){
  //todo 记录输入的用户名和密码并与数据库进行比较，
  //todo 若对比成功，隐藏登录界面，显示教师或者学生界面（根据相应的标志值判断）

//和学生一样
  var url = "$host/teacher/{teaid_x}"; // 链接到学生主页面
  var request = HttpRequest.getString(url).then(onDataLoaded_tea);
}


///点击学生登陆按钮后的响应事件
///学生页面的数据
void enter_stu(MouseEvent e) {
//todo 访问数据库，获取所有学生数据，并格式化为json
  print("成功登陆");//调试
  var url = "$host/student/{stuid_x}"; // 链接到学生主页面
  var request = HttpRequest.getString(url).then(onDataLoaded_stu);
/*
example:
  HttpRequest request;
  void main(){
    querySelector("#btn").onClick.listen(click);

  }
  void click(MouseEvent e){
    String url = 'http://localhost:8081/ok/stu';
    request = new HttpRequest();
    request.onReadyStateChange.listen(onData);
    request.open('POST', url);
    request.send(" your jsonndata");
  }
  void onData(_) {
    if (request.readyState == HttpRequest.DONE && request.status == 200) {
      querySelector("#showme").text=request.responseText;
    }
  }
  */
/*

request.setRequestHeader("content-type";"");

///学生奖学金信息界面
  displayTable=querySelector('#stu_show'); //奖学金分配表格
  querySelector('#data_chart').onClick.listen(data_chart_show);;//成绩分配扇形图
  querySelector("#out_put").text='总评';//显示“总评”二字
  displayNote=querySelector('#spscore');//显示总评分数值


///社会活动分析界面
  querySelector("#out_put").text='社会活动分析';
  querySelector('#shhd_chart');//社会活动分配扇形图
  querySelector('#data_chart').onClick.listen(shhd_chart_show);;//成绩分配扇形图

///学术科研信息页面
  querySelector("#out_put").text='社会活动分析';
  displayTable=querySelector('#stu_xhky_show'); //学术科研条目记录表格展示
  querySelector("#out_put").text='总评';//显示“总评”二字
  displayNote=querySelector('#xsky_spscore');//显示总评分数值
*/
}

onDataLoaded_stu(responseText) {

  var jsonString = responseText;
  var stuList =decode(jsonString);
  querySelector('#stu_name').text=jsonString;
/*
  List<student> stu = decode('[stuList[0],stuList[1],stuList[2]]', type: const TypeHelper<List<student>>().type);
  querySelector('#stu_name').text=""+ stu[0].name;
  querySelector('#stu_num').text="学号："+ stu[0].id.toString();
  querySelector("#xkcjscore").text =  stu[0].xkcj.toString();
  querySelector("#xskyscore").text =  stu[0].xsky.toString();
  querySelector("#shhdscore").text =  stu[0].shhd.toString();
  querySelector("#jxjlevelscore").text =  stu[0].jxj;
  double zp;
  zp=stu[0].xsky*0.7+ stu[0].xsky*0.2+ stu[0].shhd*0.1;
  querySelector("#zpscore").text=  zp.toString();
*/
 /* var jsonString = responseText;
  Map stu_allDATA1= JSON.decode(jsonString);//应该是两次解码
  Map stu_allDATA2= JSON.decode( stu_allDATA1["stuname0"].toString());
  querySelector('#stu_name').text=""+ stu_allDATA2["stuname"];
  querySelector('#stu_num').text="学号："+ stu_allDATA2["stuid"].toString();
  querySelector("#xkcjscore").text =  stu_allDATA2["xkcj"];
  querySelector("#xskyscore").text =  stu_allDATA2["xsky"];
  querySelector("#shhdscore").text =  stu_allDATA2["shhd"];
  querySelector("#jxjlevelscore").text =  stu_allDATA2["jxj"];
  int zp;
  zp=stu_allDATA2["xkcj"]*0.7+ stu_allDATA2["xsky"]*0.2+ stu_allDATA2["shhd"]*0.1;
  querySelector("#zpscore").text =  zp.toString();
*/
}
onDataLoaded_tea(responseText) {

  var jsonString = responseText;
  Map tea_allDATA1= JSON.decode(jsonString);
  Map tea_allDATA2= JSON.decode( tea_allDATA1["teaname0"].toString());
  querySelector('#tea_name').text=tea_allDATA2["teaname"];
  querySelector('#tea_id').text=tea_allDATA2["teaid"];

  /*querySelector('#stu_name').text="学生姓名："+ stu_allDATA2["name"];
  querySelector('#stu_num').text="学生学号："+ stu_allDATA2["id"].toString();
  querySelector("#xkcjscore").text =  stu_allDATA2["xkcj"];
  querySelector("#xskyscore").text =  stu_allDATA2["xsky"];
  querySelector("#shhdscore").text =  stu_allDATA2["shhd"];
  querySelector("#jxjlevelscore").text =  stu_allDATA2["jxj"];*/


}
/*
/// 显示成绩分析扇形图
void data_chart_show(MouseEvent e) {
  //todo 取出数据库的数据
  // todo 根据数据库数据与Json文件数据计算所含元素比例并返回扇形图
}

///显示社会活动分析扇形图
void shhd_chart_show(MouseEvent e) {
  //todo 取出数据库的数据
  // todo 根据数据库数据与Json文件数据计算所含元素比例并返回扇形图
}
