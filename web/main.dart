// Copyright (c) 2016, icecreamtoo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

String note;

TextInputElement TextInput;
ParagraphElement displayNote;
TableElement displayTable;

void main() {

  TextInput = querySelector('#login_yhm');
  TextInput = querySelector('#login_mm');

  querySelector('#stulogin').onClick.listen(xsym);
  querySelector('#tealogin').onClick.listen(jsym);
}
///学生页面的数据
void xsym(MouseEvent e) {
//todo 访问数据库，获取所有学生数据，并格式化为json
  displayTable = querySelector('#stu_namenum');
  displayTable = querySelector('#stushow');

}
///教师页面的数据
void jsym(MouseEvent e) {
//todo 访问数据库，获取所有学生数据，并格式化为json
  displayTable = querySelector('#tea_namenum');
  displayTable = querySelector('#teashow');
}
