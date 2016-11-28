// Copyright (c) 2016, icecreamtoo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:sqljocky/sqljocky.dart';
import 'dart:async';
import 'dart:convert' show JSON;
import 'dart:core'as core;
import  'dart:convert';
import 'dart:core';


String note;
TextInputElement TextInput;
ParagraphElement displayNote;
TableElement displayTable;
var host = 'http://localhost:8080';

void main() {
///登陆界面
  TextInput = querySelector('#login_yhm');//用户名输入
  TextInput = querySelector('#login_mm');//用户密码输入

  querySelector('#stulogin').onClick.listen(sign_in);//点击学生登陆按钮
  querySelector('#tealogin').onClick.listen(sign_in);//点击教师登录按钮

}


/// 用来接受用户点击登录按钮以后的响应工作
void sign_in(MouseEvent e){
  //todo 记录输入的用户名和密码并与数据库进行比较，
  //todo 若对比成功，隐藏登录界面，显示教师或者学生界面（根据相应的标志值判断）
  querySelector('#stu_namenum').text= 'haha';

}


///点击学生登陆按钮后的响应事件
///学生页面的数据
void xsym(MouseEvent e) {
//todo 访问数据库，获取所有学生数据，并格式化为json
  print ("Loading data");//调试
  var url = "http://$host/student/{stuid_x}"; // 链接到学生主页面
  var request = HttpRequest.getString(url).then(onDataLoaded);

querySelector('#stuname').text="学生姓名：如花";
querySelector('#stusnum').text="学生学号：1001";

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

}

onDataLoaded(responseText) {

  var jsonString = responseText;
  Map stu_allDATA=JSON.decode(jsonString);
  querySelector("#xkcjscore").text =  stu_allDATA["如花"]["xkcj"].toString();
  querySelector("#xskyscore").text =  stu_allDATA["如花"]["xsky"].toString();
  querySelector("#shhdscore").text =  stu_allDATA["如花"]["shhd"].toString();
  querySelector("#jxjlevelscore").text =  stu_allDATA["如花"]["jxj"].toString();
}

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

///点击教师登陆按钮后的响应事件
///教师主页面的数据
void jsym(MouseEvent e) {
//todo 访问数据库，获取所有学生数据，并格式化为json
  displayTable = querySelector('#tea_namenum');

  displayTable = querySelector('#teashow');

}
