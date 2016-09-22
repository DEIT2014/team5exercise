1. dart语言特性中的循环语句定义和操作方法
```
if and else:
1.if (isRaining()) {  
2.  you.bringRainCoat();  
3.} else if (isSnowing()) {  
4.  you.wearJacket();  
5.} else {  
6.  car.putTopDown();  
7.}  
  for loops:
1.for (int i = 0; i < candidates.length; i++) {  
2.  candidates[i].interview();  
3.}  
 在for循环中还可以定义函数来对当前索引值进行操作，如：
1.main() {  
2.  var callbacks = [];  
3.  for (var i = 0; i < 2; i++) {  
4.    callbacks.add(() => print(i));  
5.  }  
6.  callbacks.forEach((c) => c());  
7.}  
while和do while循环与javascript中一样，break,continue中也一样。
switch使用==来判断对象是否相等。
```
2. dart字符串的定义和操作方法
```
在字符串中可以使用表达式，${expression}，该表达式的值将会作为字符串的一部分。如果表达式只是一个变量，可以不加大括号，即：$var
1.var s ='string interpolation';  
2.print('Dart has $s, which is very handy.');  
3.print('That deserves all caps. ${s.toUpperCase()} is very handy!');  
 比较字符串相等可以使用==号
字符串有一些常用方法，如：startWith,endWith,contains. 字符串是不可变对象，也就是说它的值一旦创建就不会再变。要使用可变字符串，可以使用StringBuffer对象，类似于java中的 StringBuffer类，它的值是可变的，使用该对象的toString方法可以生成字符串。
1.var sb = new StringBuffer();  
2.  
3.sb.add("Use a StringBuffer");  
4.sb.addAll(["for ", "efficient ", "string ", "creation "]);  
5.sb.add("if you are ").add("building lots of strings.");  
6.  
7.var fullString = sb.toString();  
8.  
9.print(fullString); // Use a StringBuffer for efficient string creation  
10.                   // if you are building lots of strings.  
11.  
12.sb.clear(); 
```
```
Writing a string to a file
Use the File object’s writeAsString() method to write a string to a file. After writing the string, the method closes the file.
import 'dart:io';
void main() {
  final filename = 'file.txt';
  new File(filename).writeAsString('some content')
    .then((File file) {
      // Do something with the file.
    });
c
 Reading a file as a string#
Use the File readAsString() method to read a file as a string.
import 'dart:async';import 'dart:io';
void main() {
  new File('file.txt').readAsString().then((String contents) {
    // Do something with the file contents.
  });
```
3. dart函数定义和使用方法

```
定义一个函数：
1.String say(String from, String msg) => "$from says $msg";  
 也可以使用简洁的写法：
1.say(from, msg) => "$from says $msg";  
  调用它：
1.print(say("Bob", "Hello")); // "Bob says Hello"  
  => e;是{return e;}的简写，因此上面的函数定义相当于：
1.say(from, msg) {  
2.  return "$from says $msg";  
3.}  
  函数还支持可选参数：
1.String say(String from, String msg, [String device]) {  
2.  var result = "$from says $msg";  
3.  if (device != null) {  
4.    result = "$result with a $device";  
5.  }  
6.  return result;  
7.}  
 可选参数在调用时可以传入也可不传入，比较下面两种调用方式：
1.print(say("Bob", "Howdy")); // Bob says Howdy  
2.print(say("Bob", "Howdy", "smoke signal"));  
3.// Bob says Howdy with a smoke signal  
 可以为可选参数设置默认值，这样在调用时如果没有传入则使用默认值：
1.String say(String from, String msg, [String device='carrier pigeon']) {  
2.  var result = "$from says $msg";  
3.  if (device != null) {  
4.    result = "$result with a $device";  
5.  }  
6.  return result;  
7.}  
  也可以使用名称参数来使用可选参数：
1.print(say("Bob", "Howdy", device: "tin can and string"));  
2.// Bob says Howdy with a tin can and string  
  函数也可以像对象一样作为函数返回值或作为参数传递给其它函数：
1.bool isOdd(num i) => i % 2 == 1;  
2.List ages = [1,4,5,7,10,14,21];  
3.List oddAges = ages.filter(isOdd);
```
4. dart中数组定义和使用方法
```
在Dart中数组也叫列表list.
定义一个数组：
1.var list = [1,2,3];  
  操作数组：
1.var list = [1,2,3];  
2.print(list.length); // the # of elements: 3  
3.print(list[1]);     // the second item: 2  
  给数组添加元素：
1.var list = [1,2,3];  
2.list.add(4);  
  从数组中删除一定范围内的元素：
1.var list = [1,2,3,4];  
2.list.removeRange(2, 1); // remove the third element  
  创建固定长度的数组：
1.var list = new List(3); //fixed-size list (full of null values)  
 注意：固定长度的数组不能调用add,removeRange等方法改变其大小。

可以使用for, for...in, 或forEach()几种方式遍历数组，
使用for:
1.var list = [1,2,3];  
2.for (var x = 0; x < list.length; x++) {  
3.  print('$x: ${list[x]}');  
4.}  
  for...in:
1.var list = [1,2,3];  
2.for (final x in list) {  
3.  print(x);  
4.}  
  forEach():
1.var list = [1,2,3]  
2.void printElement(element) => print(element);  
3.list.forEach(printElement);  
  可更简洁的方式：
1.var list = [1,2,3];  
2.list.forEach((element) => print(element));  
  list的父类是Collection,它提供了一系列操作集合的方法。
```
5. dart中列表定义和使用方法
6. dart中 Map定义和使用方法
7. querySelector（）函数的详细API解释
8. 详细解释dart如何操作html的文档
9. dart web app 应用程序组织结构的解释部分
http://www.dartlang.cc/codelabs/darrrt/
```
编写web APP的步骤
Step 0: 设置环境
Step 1: 运行框架应用
Step 2: 添加一个输入框
Step 3: 添加一个按钮
Step 4: 创建一个类
Step 5: 保存到本地存储中
Step 6: 使用 HttpRequest 从 JSON 文件中读取姓名
Step 7: 继续前行，了解 Dart 语言的更多特性
Step 7: Build 该应用并作为 JavaScript 运行
```
10. dart可用的各种工具的解释部分
(https://www.dartlang.org/tools)
```
Dartium 被用于开发web apps；
WebStorm 集成开发环境，dart支持的；
dart2js、pub build、pub serve为web 编程提供专门的支持；
DartPad 是一个好的方法来学习dart语法，并用dart语言进行实践；
SDKs（软件开发工具包）；
Command-line tools（命令行工具），包括Pub package manager、Static analyzer、Code    formatter，用于管理dart包，评估反馈编码中的错误，大多数sdks包含这些工具。
```
11. 指引你到其他社区社区寻求dart相关问题帮助的解释部分
(http://stackoverflow.com/tags/dart)
```
在dart官网中的Community and Support中的Community and Support--How-to questions可以寻求相关问题帮助，也可以问一些问题。
```
12. 从web storm软件菜单找出webstrom 中dart开发的帮助文档
（https://www.jetbrains.com/help/webstorm/2016.2/dart-support.html）
```
打开web storm软件，在help--help topics，找到How to--Dart Support即可，里面有详细的帮助文档，链接如上。
```
