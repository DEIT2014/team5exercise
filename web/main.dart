// Copyright (c) 2016, icecreamtoo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

String note;

String login_yhm;//登录界面的用户名变量
String login_mm;//登录界面的密码变量
TextInputElement TextInput;
ParagraphElement displayNote;
TableElement displayTable;

void main() {
///登陆界面
  login_yhm= querySelector('#login_yhm'); //输入用户名
  login_mm = querySelector('#login_mm');//输入密码

  querySelector('#stulogin').onClick.listen(xsym);
  querySelector('#tealogin').onClick.listen(jsym);
}
///用户点击登陆页面的学生登陆按钮的响应
///学生主页面
void xsym(MouseEvent e) {
//todo 访问数据库，获取所有学生数据，并格式化为json
  displayTable = querySelector('#stu_namenum');
  displayTable = querySelector('#stushow');

}
///用户点击登陆页面的教师登陆按钮的响应
///教师主页面
void jsym(MouseEvent e) {
//todo 访问数据库，获取所有学生数据，并格式化为json
  displayTable = querySelector('#tea_namenum');
  displayTable = querySelector('#teashow');
}
