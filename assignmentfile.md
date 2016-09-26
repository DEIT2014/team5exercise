###dart语言特性中的循环语句定义和操作方法
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
###dart字符串的定义和操作方法
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
###dart函数定义和使用方法

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
###dart中数组定义和使用方法
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
###dart中列表定义和使用方法

```
//Dart核心库提供了List（列表）、Map（映射）、Set（集）三种集合类型

创建一个有长度的列表
List([ int length])

创建固定长度的列表：固定长度的列表，一旦定义就无法改变长度
List fixedLengthList = new List(3);
fixedLengthList.length;     // 列表长度为3
fixedLengthList.length = 1; // Error
fixedLengthList[0] = 87;
print(fixedLengthList);  
print(fixedLengthList[0]);

如果长度被忽略不写，默认该列表长度为0
List growableList = new List();
growableList.length; // 0;
growableList.length = 3;

创建一个可扩充的列表，只需在创建列表后添加长度值，这个值不能是负数或者空。
List growableList = new List()..length = 500;
可改变长度的列表，可以根据需要改变长度

    List<int> growableList = [1, 2];
    print(growableList);

    growableList.length = 0;
    print(growableList);

    growableList.add(499);
    print(growableList);

    growableList[0] = 87;
    print(growableList);

Source
external factory List([int length]);//疑问处，不知何解。


几种构造函数

List([int length])

    // 创建固定长度的列表
    List fixedLengthList = new List(3);
    print(fixedLengthList.length);

    // 创建可改变长度的列表
    List growableListA = new List();
    print(growableListA.length);
    growableListA.length = 3;
    print(growableListA.length);

    // 创建可在固定范围内改变长度的列表
    List growableListB = new List()..length = 500;




List.unmodifiable(Iterable elements)// 创建包含所有元素的固定长度列表
    List fixedLengthListB = new List.unmodifiable([1, 2, 3]);
    print(fixedLengthListB.length);

List.from(Iterable elements, {bool growable: true})// 创建包含所有元素的可改变长度列表
    List growableListC = new List.from([1, 2, 3]);
    print(growableListC.length);
    growableListC.add(4);
    print(growableListC.length);

List.filled(int length, E fill, {bool growable: false})// 为所有元素统一赋值
    List fixedLengthList = new List<int>.filled(3, 0);
    print(fixedLengthList);

List.generate(int length, E generator(int index), {bool growable: true}) // 用生成器给所有元素赋初始值
    List fixedLengthList = new List<int>.generate(4, (int index) {
        return index * index;
    });
    print(fixedLengthList);

所有属性

    List fixedLengthList = new List<int>.generate(4, (int index) {
        return index * index;
    });// 返回第一个元素
    print(fixedLengthList.first);// 返回最后一个元素
    print(fixedLengthList.last);// 返回列表的哈希码
    print(fixedLengthList.hashCode);// 列表是否为空
    print(fixedLengthList.isEmpty);// 列表是否不为空
    print(fixedLengthList.isNotEmpty);// 返回一个新的迭代器
    print(fixedLengthList.iterator);// 列表中多少个元素
    print(fixedLengthList.length);// 返回相反顺序的列表
    print(fixedLengthList.reversed);// 返回对象运行时的类型
    print(fixedLengthList.runtimeType);// 列表是否只有一个元素，则否报错
    print(fixedLengthList.single);

常用方法

返回多种类型的输出

    List growableList = new List.from([1, 2, 3]);
    // 返回列表的字符串表示
    print(growableList.toString());
    // 返回列表的集表示
    print(growableList.toSet());
    // 返回列表的列表表示
    print(growableList.toList());
    // 用指定字符连接列表元素
    print(growableList.join(","));

给列表增加元素

    List growableList = new List();
    // 增加一个元素到列表末尾
    growableList.add(10);
    print(growableList);
    // 增加一个元素到指定下标
    growableList.insert(1, 20);
    print(growableList);
    // 增加一个列表到列表末尾
    growableList.addAll([30, 60]);
    print(growableList);
    // 增加一个列表到指定下标
    growableList.insertAll(3, [40, 50]);
    print(growableList);

各种删除操作的方法

    List growableList = new List.from([1, 2, 3, 3, 3, 4]);
    // 移除列表中匹配的第一个元素
    growableList.remove(3);
    print(growableList);
    // 移除列表中第几个元素
    growableList.removeAt(0);
    print(growableList);
    // 移除列表中最后一个元素
    growableList.removeLast();
    print(growableList);
    // 移除列表的所有元素
    growableList.clear();
    print(growableList);

    List<int> listB = [1, 2, 3, 4, 5];
    // 移除开始下标（不包括）至结束下标（包括）内的元素
    listB.removeRange(1, 4);
    print(listB);

    List<int> listA = [1, 2, 3, 4, 5];
    // 移除并替换开始下标（不包括）至结束下标（包括）内的元素
    listA.replaceRange(1, 4, [6, 7]);
    print(listA);

    List<String> numbersA = ['one', 'two', 'three', 'four'];
    /*  移除所有满足条件的元素，此为Dart的一种速写语法
        numbersA.removeWhere((item) => item.length == 3);   */
    numbersA.removeWhere((item){
        return item.length == 3;
    });
    print(numbersA);

    List<String> numbersB = ['one', 'two', 'three', 'four'];
    /*  移除所有不满足条件的元素，此为Dart的一种速写语法
        numbersB.retainWhere((item) => item.length == 3);   */
    numbersB.retainWhere((item){
        return item.length == 3;
    });
    print(numbersB);

按顺序迭代列表

    List<String> names = ["Alice", "Daphne", "Elizabeth", "Joanna"];
    names.forEach((name){
        print(name);
    });

各种查询输出方法

    List<String> names = ['Abbey', 'Fallon', 'Xenia', 'Callie', 'Callie'];
    // 列表中是否包含指定元素
    print(names.contains('Fallon'));
    // 返回列表中的第几个元素
    print(names.elementAt(2));
    // 返回列表中第一个匹配元素的下标
    print(names.indexOf('Callie'));
    // 返回列表中最后一个匹配元素的下标
    print(names.lastIndexOf('Callie'));

    List<String> colors = ['red', 'green', 'blue', 'orange', 'pink'];
    // 返回从开始下标（包括）到结束下标（不包括）元素的列表
    print(colors.sublist(1, 3));
    // 返回从开始下标（包括）到最后一个元素的列表
    print(colors.sublist(1));

对列表元素做一些改动

    List<String> listA = ['a', 'b', 'c'];
    // 从第几个元素开始覆盖原列表
    listA.setAll(1, ['bee', 'sea']);
    print(listA);

    List<int> listB = [1, 2, 3, 4, 5];
    // 对列表进行随机排序
    listB.shuffle();
    print(listB);

    List<int> listC = [1, 2, 3, 4, 5];
    // 对列表进行顺序排序
    listC.sort();
    print(listC);
```
###dart中 Map定义和使用方法
```
一、①映射：即Map对象，定义一个map对象可以使用如下方式：
var gifts = {                         // a map literal  
// keys       values  
  "first"  : "partridge",  
  "second" : "turtledoves",  
  "fifth"  : "golden rings"};  


      ②使用这种方式，key只能使用字符串，如果使用Map构造函数，则key可以使用其他类型，如：
var map = new Map();                  // use a Map constructor  
map[1] = "partridge";                 // key is 1; value is "partridge"  
map[2] = "turtledoves";               // key is 2; value is "turtledoves" 
map[5] = "golden rings";              // key is 5; value is "golden rings"  
或者：
    Map<String, int> map = {"a":1, "b":2, "c":3};
    print(map["a"]);
二、在map中值可以是任何对象或null,也可以像javascript中那样直接给map添加一个映射项：
var gifts = { "first": "partridge" };  
gifts["fourth"] = "calling birds";    // add a key-value pair  

三、取得一个映射项的值：
var gifts = { "first": "partridge" };  
print(gifts['first']);                // partridge  
      PS.如果map不存在某个key，则获取该key对应的值会返回null

map中也提供length方法返回映射的项数，remove方法可以删除一个项

四、Map.from()方法可以复制一个映射：
var gifts = { "first": "partridge" };  
var regifts = new Map.from(gifts);  
print(regifts['first']);   

五、使用forEach()方法可以遍历一个Map:
var gifts = {  
  "first" : "partridge",  
  "second": "turtledoves",  
  "fifth" : "golden rings"};  
gifts.forEach((k,v) => print('$k : $v'));  
如果只想获取所有key或所有values，可以使用getKeys或getValues方法。//疑问

六、常用方法
    Map<String, int> map = {"a":1, "b":2, "c":3};
    // 返回映射的字符串表示
    print(map.toString());
    // 按顺序迭代映射
    map.forEach((key, value){
        print(key + " : " + value.toString());
    });
    // 添加其他键值对到映射中
    map.addAll({"d":4, "e":5});
    // 映射是否包含指定键
    print(map.containsKey("d"));
    // 映射是否包含指定值
    print(map.containsValue(5));
    // 删除指定键值对
    map.remove("a");
    // 删除所有键值对
    map.clear();

    Map<String, int> scores = {'Bob': 36};
    for (var key in ['Bob', 'Rohan', 'Sophena']) {
        // 查找指定键，如果不存在就添加
        scores.putIfAbsent(key, () => key.length);
    }
    print(scores['Bob']);
    print(scores['Rohan']);
    print(scores['Sophena']);
```
###querySelector（）函数的详细API解释
```
①querySelector() querySelector用于获得dom节点， 可以接受三种类型的参数：id(#)、class(.)、标签。该函数从 DOM 中获取一个 Element 对象。

②querySelector() 的参数为一个字符串， 该字符串为一个 CSS 选择器来指定要查询的对象。 常用的 CSS 选择器有 类选择器、ID 选择器和属性选择器。 后面当我们使用 CSS 文件的时候 再来详细看看这些选择器。 下面第八题中 RipVanWinkle 是 HTML 文件中 段落的唯一 ID， #RipVanWinkle 指定了该 ID。
```
###详细解释dart如何操作html的文档
```

     一、首先，我们要了解DOM。
①Document Object Model (DOM) 代表 web 文档的树和节点结构。 当一个HTML 文件载入到浏览器中时， 浏览器解析该 HTML 文件并 在窗口中显示该文档。
②HTML 用标签来描述文档。简单 HTML 代码用 <title> 标签来显示页面标题， <h1> 来显示一级标题， <p> 代表一个段落。 在 HTML 中还有一些标签 在浏览器中是不显示的，例如 <head> 和 <body> 标签， 这些标签定义了文档的结构。
③在 DOM 中， document 对象位于根节点中， 根节点没有父节点。 不同的节点代表文档中 不同的对象。 例如，树中的 page 元素、 text 节点、和 属性节点。 
④DOM tree中的树节点对应HTML文档中的各级标签
⑤HTML 文件定义了文档的初始结构。 Dart 或者 JavaScript 可以通过 添加、删除、和修改节点来动态的修改文档结构。用queryselector（）函数，代码可以添加或者删除节点， 甚至可以插入整个子树节点。当 DOM 改变后， 浏览器会立即重新渲染文档。
    二、创建一个新的 Dart 应用
①在 Dart 编辑器中，创建一个新的 web 应用， 命名为 mini。
②Dart 编辑器创建一个应用的时候， 也会创建一些模板 HTML 代码。 双击 mini.html 打开该文件。 

使用如下的代码替代该文件内容。
<!DOCTYPE html>

<html>
  <head>
    <title>A Minimalist App</title>
  </head>

  <body>
    <p id="RipVanWinkle">
      RipVanWinkle paragraph.
    </p>
    <script type="application/dart" src="mini.dart"></script>
    <script src="packages/browser/dart.js"></script>
  </body>
</html>
    ⒈通过菜单 File > Save 来保存文件。
    上面的段落标签有个名字为 “RipVanWinkle” 的 ID 属性。 下一步创建的 Dart 代码将通过该 ID 来 查找该段落元素。
    ⒉第一个脚本文件：    <script type="application/dart" src="mini.dart"></script>。包含了 mini 应用
的代码。 type 属性指定了该脚本的类型 为 Dart 团队为 Dart 语言创建的 新类型 application/dart。 当前，只有 Dartium 浏览器支持 application/dart 类型。 src 属性告诉浏览器脚本文件的位置。 这里的 Dart 代码为 mini.dart， 下一步我们将创建这个文件。 Dart 代码文件应该和应用它的 HTML 文件放到同一个目录下。
    ⒊第二个 script 标签：    <script src="packages/browser/dart.js"></script>。引用了 一个负责启动 Dart VM 的引导程序， 并且处理不支持 Dart 的浏览器。
    三、编辑 Dart 源代码
打开 mini.dart 文件并修改 为如下代码：
import 'dart:html';
void main() {
  querySelector('#RipVanWinkle').text = 'Wake up, sleepy head!';
}
①import 命令导入了一个特别的库， 这样你的程序就可以使用这个库中的所有类和函数了。这里导入了 Dart 的 HTML 库， 该库包含了对 DOM 编程的关键类和函数。
总结：以上两段代码，就是通过标签'RipVanWinkle',使用querySelector()函数联系起来。querySelector()
获取HTML文档中的DOM节点'RipVanWinkle'的段落元素。
```
###dart web app 应用程序组织结构的解释部分 http://www.dartlang.cc/codelabs/darrrt/
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
![](https://webdev.dartlang.org/codelabs/ng2/images/project-files.jpg)
```dart
比如一个项目名叫 pirate_badge，在 pirate_badge文件夹中，
文件包括图片显示的文件；
忽略一些自动产生的文件，则有如下文件：
pirate_badge/
  lib/
    app_component.dart  展示数据通过定义类--components
    app_component.html
  web/
    index.html
    main.dart    main() 函数是app的唯一进入点
  pubspec.yaml   这个文件包含包的元数据（描述数据的数据），比如名字；也列举了app依赖的包； 
运行app：
在 WebStorm中，双击 web/index.html 打开文件，在右上角的浏览器按钮上点击 Dartium 按钮。
```
###dart可用的各种工具的解释部分  https://www.dartlang.org/tools

```
Dartium 被用于开发web apps；
WebStorm 集成开发环境，dart支持的；
dart2js、pub build、pub serve为web 编程提供专门的支持；
DartPad 是一个好的方法来学习dart语法，并用dart语言进行实践；
SDKs（软件开发工具包）；
Command-line tools（命令行工具），包括Pub package manager、Static analyzer、Code    formatter，用于管理dart包，评估反馈编码中的错误，大多数sdks包含这些工具。
```
###指引你到其他社区社区寻求dart相关问题帮助的解释部分  http://stackoverflow.com/tags/dart

```
在dart官网中的Community and Support中的Community and Support--How-to questions可以寻求相关问题帮助，也可以问一些问题。
```
###从web storm软件菜单找出webstrom 中dart开发的帮助文档   https://www.jetbrains.com/help/webstorm/2016.2/dart-support.html
```
打开web storm软件，在help--help topics，找到How to--Dart Support即可，里面有详细的帮助文档，链接如上。
```
