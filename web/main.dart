// Copyright (c) 2016, icecreamtoo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';

import 'dart:convert' show JSON;
import 'dart:core'as core;
import  'dart:convert';
import 'dart:core';
import 'package:route_hierarchical/client.dart';
import 'package:modern_charts/modern_charts.dart';


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
  ..addRoute(name: 'stu_login',  path: '/student', enter: enter_stu_login)
  ..addRoute(name: 'tea_login',  path: '/teacher', enter: enter_tea_login);

 querySelector('#link_stu').attributes['href'] = router.url('stu_login');
 querySelector('#link_tea').attributes['href'] = router.url('tea_login');

 router.listen();
}

void enter_stu_login(RouteEvent e) {
  //登录部分消失，显示学生登录后页面
  document
      .querySelector('#login')
      .style
      .display="none";
  document
     .querySelector('#stu_login')
     .style
     .display="block";
  document
      .querySelector('#tea_login')
      .style
      .display="none";
  //querySelector('#stu_login').classes.add('selected');
  //querySelector('#tea_login').classes.remove('selected');

  var container = querySelector('#piechart');
  var table = new DataTable(
      [
        ['评分项目', 'Share'],
        ['学科成绩', 35],
        ['学术科研', 20],
        ['社会活动', 30]
      ]);
  var chart = new PieChart(container);
  chart.draw(table, {
    'animation': {
      'onEnd': () {

      }
    },
    'series': {
      'labels': {
        'enabled': true
      }
    }
  });
}
void enter_tea_login(RouteEvent e) {
  //登录部分消失，显示教师登录后页面
  document
      .querySelector('#login')
      .style
      .display="none";
  document
      .querySelector('#tea_login')
      .style
      .display="block";
  document
      .querySelector('#stu_login')
      .style
      .display="none";
 // querySelector('#stu_login').classes.remove('selected');
  //querySelector('#tea_login').classes.add('selected');
}
/// 用来接受用户点击登录按钮以后的响应工作
void enter_tea(MouseEvent e){
  //todo 记录输入的用户名和密码并与数据库进行比较，
  //todo 若对比成功，隐藏登录界面，显示教师或者学生界面（根据相应的标志值判断）

//和学生一样
  var url = "$host/teacher"; // 链接到学生主页面
  var request = HttpRequest.getString(url).then(onDataLoaded_tea);
  var url1 = "$host/student"; // 链接到学生主页面
  var request1= HttpRequest.getString(url).then(onDataLoaded_tea_stu);
}


///点击学生登陆按钮后的响应事件
///学生页面的数据
void enter_stu(MouseEvent e) {
//todo 访问数据库，获取所有学生数据，并格式化为json
  print("成功登陆");//调试
  var url = "$host/student"; // 链接到学生主页面
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
  //用类实现有问题  List<student> stu= decode(responseText, type:const TypeHelper<List<student>>().type);
  List stu=JSON.decode(jsonString);
  var stu_allDATA1= stu[0];
  querySelector('#stu_name').text="姓名："+stu_allDATA1["name"];
  querySelector('#stu_num').text="学号："+ stu_allDATA1["id"].toString();
  querySelector("#xkcjscore").text =  stu_allDATA1["xkcj"].toString();
  querySelector("#xskyscore").text =  stu_allDATA1["xsky"].toString();
  querySelector("#shhdscore").text =  stu_allDATA1["shhd"].toString();
  querySelector("#jxjlevelscore").text =  stu_allDATA1["jxj"];
  double zp;
  zp=stu_allDATA1["xkcj"]*0.7+ stu_allDATA1["xsky"]*0.2+stu_allDATA1["shhd"] *0.1;
  querySelector("#zpscore").text=  zp.toString();
  //各项的饼状图，有点问题

  var container = querySelector('#piechart');
  var table = new DataTable(
      [
        ['评分项目', 'Share'],
        ['学科成绩', stu_allDATA1["xkcj"]],
        ['学术科研', stu_allDATA1["xsky"]],
        ['社会活动', stu_allDATA1["shhd"]]
      ]);
  var chart = new PieChart(container);
  chart.draw(table, {
    'animation': {
      'onEnd': () {

      }
    },
    'series': {
      'labels': {
        'enabled': true
      }
    }
  });
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
  var tea_allDATA1= JSON.decode(jsonString);
  var tea_allDATA2= JSON.decode( tea_allDATA1["teaname0"].toString());
  querySelector('#tea_name').text=tea_allDATA2["teaname"];
  querySelector('#tea_id').text=tea_allDATA2["teaid"];
/*var i;
   for(i=1;i<=30;i++) {
    querySelector('#stuname1').text = "学生姓名：" + stu_allDATA2["name"];
    querySelector('#stuid1').text = "学生学号：" + stu_allDATA2["id"].toString();
    querySelector("#xkcjscore1").text = stu_allDATA2["xkcj"];
    querySelector("#xskyscore1").text = stu_allDATA2["xsky"];
    querySelector("#shhdscore1").text = stu_allDATA2["shhd"];
    querySelector("#jxjlevelscore1").text = stu_allDATA2["jxj"];
  }

*/
}

onDataLoaded_tea_stu(responseText) {
  var jsonString = responseText;
  //用类实现有问题  List<student> stu= decode(responseText, type:const TypeHelper<List<student>>().type);
  List stu=JSON.decode(jsonString);
  var stu_allDATA2= stu[0];
  var i;
  for (i = 1; i <= 30; i++) {
    querySelector('#stuname1').text = "学生姓名：" + stu_allDATA2["name"];
    querySelector('#stuid1').text = "学生学号：" + stu_allDATA2["id"].toString();
    querySelector("#xkcjscore1").text = stu_allDATA2["xkcj"];
    querySelector("#xskyscore1").text = stu_allDATA2["xsky"];
    querySelector("#shhdscore1").text = stu_allDATA2["shhd"];
    querySelector("#jxjlevelscore1").text = stu_allDATA2["jxj"];
  }
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
*/


Element createContainer() {
  var e = new DivElement()
    ..style.height = '200px'
    ..style.width = '400px'
    ..style.maxWidth = '100%'
    ..style.marginBottom = '50px';
  document.body.append(e);
  return e;
}