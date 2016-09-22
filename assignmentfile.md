1. dart语言特性中的循环语句定义和操作方法
2. dart字符串的定义和操作方法
3. dart函数定义和使用方法
4. dart中数组定义和使用方法
5. dart中列表定义和使用方法

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
6. dart中 Map定义和使用方法
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
7. querySelector（）函数的详细API解释
```
①querySelector() querySelector用于获得dom节点， 可以接受三种类型的参数：id(#)、class(.)、标签。该函数从 DOM 中获取一个 Element 对象。

②querySelector() 的参数为一个字符串， 该字符串为一个 CSS 选择器来指定要查询的对象。 常用的 CSS 选择器有 类选择器、ID 选择器和属性选择器。 后面当我们使用 CSS 文件的时候 再来详细看看这些选择器。 下面第八题中 RipVanWinkle 是 HTML 文件中 段落的唯一 ID， #RipVanWinkle 指定了该 ID。
```
8. 详细解释dart如何操作html的文档
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
