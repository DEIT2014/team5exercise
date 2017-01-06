
# ——奖学金评定系统——
# 产品创意
>要求：描述产品创意的过程，包括产品的灵感来源，针对什么人群来设计这个产品，设计了哪些功能，一开始做的原型的样子，以及在创意阶段所做的贡献。


## 创意
>我们小组的作品是大学生奖学金评定系统。
 
>**灵感来源**：在第九周进行项目策划的时候，正值我们班进行奖学金评定。我们组从实际出发，结合大家对奖学金评定系统的意见和建议，开始了对项目的规划。

>大学的奖学金是按照学生的总评排名来进行评定的，而总评成绩是由学科成绩、学术科研、社会活动三项按照一定的比例组成的，而这三部分又是由更小的子部分按照一定的比例计算出来的。因此，数据的收集相当麻烦，需要临时向同学们收集，而收集的信息的正确率不能得到100%的保障；并且总评的计算，是由人工计算，比较繁琐易出错。除此之外，评定过程透明度不高，材料交上去了，但是整体评分的过程是没有的，只有一个结果。因此，设计一个奖学金评定系统是很有必要的，既减轻评定过程的数据分析，又将奖学金的评定过程公开透明化。

>**针对人群**：奖学金评定是针对学生的，目前主要受众是大学生。在设计时，以教信系的本科生为例。学生在注册及登录系统后，可以查看自己各项成绩及总评，在平时就可以进行活动录入，然后一键计算出该同学某一学期的总评和相应的奖学金等级。并且，在每一大项目（比如学科成绩），可以点击查看其明细，简单高效、方便快捷。

>在学生奖学金评定时，系统将对学生的各项成绩所占比例进行分析，学生可以从中观察出自己的优势和不足，对症下药，分析自己的薄弱项目，在下学期学习时改进加强。



> **个人在创意阶段的贡献**：最初想到要做一个奖学金评定系统，是因为当时班级里正在进行奖学金评定。

>每个人的成绩是不需要同学们提交的，当时学术科研和社会活动却是需要同学们自己提交报告的。一个是临时收集，最后还要整合，这是一个十分繁琐的过程；重要的是，很多活动平时没有记录，信息就容易弄错弄丢。于是，我提出了这个想法，然后和组员一起商量整个系统的功能模块，每一个模块的具体功能等。最后将组员设计好的最初效果图整合。


## 需求
>### 综述：
>我们的奖学金评定系统克服了传统奖学金评定系统耗时耗力、不够透明公开的不足，教师录入全班同学各项成绩信息后系统会计算出总分，进而对全班学生成绩进行排序，再根据奖学金名额进行奖学金等级的分配，帮助教师进行学生奖学金评定工作，节省了时间和经历；学生也可以查看自己的各项成绩信息、成绩分析及奖学金获得情况，方便快捷。

>### **功能：**	

>**1、学生角色：**
1.	设有教师登录和学生登录，登陆后有不同的页面。学生和教师有不同的权限，教师可修改学生数据，学生则不能。
![1](https://cloud.githubusercontent.com/assets/22070765/21709251/92758c30-d41a-11e6-9746-043681db3b19.png)
2.	学生可以查看自己的各项成绩信息，包括学科成绩、学术科研、社会活动，同时查看自己的奖学金获得情况，如图所示。
![2](https://cloud.githubusercontent.com/assets/22070765/21709293/d3fc8686-d41a-11e6-9b46-2ea1f944ecfb.png)
3.	学生通过成绩分析饼状图可以进行自我分析，思考不足。
4.	学生也可以点击学科成绩、学术科研、社会活动进入各项的详细展示页面。![5](https://cloud.githubusercontent.com/assets/22070765/21709586/08e00ee8-d41d-11e6-905f-68ea947cce6a.png)

>**2、教师角色：**
1.	教师可以查看全班学生成绩情况和奖学金情况。
![3](https://cloud.githubusercontent.com/assets/22070765/21709319/0b7e28b2-d41b-11e6-93a6-fc68352ac447.png)
2.	教师可以搜索学生进行学生各项细节成绩信息的录入。


## 设计的功能列表以及其完成情况

 设计的功能|承担该功能的组员|任务完成度
 --|--|--
  学生进入界面信息显示|战晓瑜、涂斌琴、张甜甜|100%
  学科成绩界面信息显示|张甜甜、战晓瑜、涂斌琴|100%
  学生界面、学科成绩界面和教师界面切换|张甜甜|100%
  学生进入界面饼状图设计|张甜甜|100%
  教师进入界面学生信息展示|涂斌琴|100%
  回到主页按钮设计|张甜甜|100%
  教师进入界面搜索功能|战晓瑜|70%
  

# 产品技术方案
> 描述产品创意的技术思路，服务器端如何，客户端如何。

>我们设计的是奖学金评定系统。分为客户端、服务器端和数据库三大板块。

>首先是数据库的建立，建立了学生信息表，包括姓名、学号、学科成绩、学术科研、社会活动等信息；建立了教师信息表，包括教师姓名、工号；建立了学科成绩表，以本专业为例，包括了四门学科的信息。

>接着是客户端、服务器端的设计。server.dart主要是链接数据库，将数据库中的数据取出来，携程JSON格式，传递给客户端。main.dart客户端，接收来自服务器端的数据，解码后，在html界面中显示出来。html界面是最终展示的界面，在这里设计好展示的框架，设计表格元素等等，与CSS相结合，将main.dart界面的数据展示出来。

>还有url、elementID表的设计、学生教师类的建立。

>在设计过程中，我们会应用各种各样的package，比如server和数据库的链接、JSON数据的转换、chart的应用等等，这个可以在pub、dart官网上寻找合适的资源，引用到我们自己的项目设计当中。

  
# 我在小组中的分工

>我们小组的任务分工分为两个阶段。

>第一个阶段:框架搭建阶段。在这个阶段，小组三人的分工比较明确。我主要负责main.dart页面的整体框架搭建，还做了html界面的css设计。另外还有server、数据库的建立和html、css的框架搭建分别由战晓瑜和张甜甜完成。

>第二个阶段：功能设计。第一，负责main.dart中学生界面信息的显示，测试后由组员进行补充修改；第二，负责教师界面的信息展示（包括教师和所有学生的信息显示），包括在main.dart、html和server.dart中所有的代码设计。这一部分之前已经做过，可以直接修改复制代码，但是遇到一个问题，如何将所有学生的信息展示出来，最后用了循环，但是在html中则是把所有的表格项目都写了出来，没有找到循环的方法。第三，负责学科成绩界面中html界面表格、框架搭建；mian.dart中接收和显示数据，后由组员进行补充修改。

>与其他组员相比，我完成的较好，不过难度不大。最开始摸索main.dart界面的框架、函数分类及其功能设计比较困难，后期的工作量不大，并且做过一遍，并不算难。

>小组内，张甜甜的工作完成得最好，她主攻比较难的部分：router（模块的显示和隐藏、转换）、以及饼状图的设计。
工作量的话，张甜甜和战晓瑜的工作量都比较大。

# 我的编程实践活动
## 我的代码

  
```dart

///main.dart界面
import 'dart:html';
import 'dart:convert' show JSON;
import 'dart:core'as core;
import  'dart:convert';
import 'dart:core';

var host = 'http://localhost:8080';

void main() {///登陆界面

  TextInput = querySelector('#login_yhm');//用户名输入
  TextInput = querySelector('#login_mm');//用户密码输入

  querySelector('#stulogin').onClick.listen(sign_in);//点击学生登陆按钮
  querySelector('#tealogin').onClick.listen(sign_in);//点击教师登录按钮

}


/// 用来接受用户点击登录按钮以后的响应工作
void sign_in(MouseEvent e){
  //todo 记录输入的用户名和密码并与数据库进行比较，
  //todo 若对比成功，隐藏登录界面，显示教师或者学生界面（根据相应的标志值判断）
/// 用来接受用户点击登录按钮以后的响应工作
void enter_tea(MouseEvent e){
  //todo 记录输入的用户名和密码并与数据库进行比较，
  //todo 若对比成功，隐藏登录界面，显示教师或者学生界面（根据相应的标志值判断）

//和学生一样
  var url = "$host/teacher/{teaid_x}"; // 链接到教师主页面
  var request = HttpRequest.getString(url).then(onDataLoaded_tea);
  var url1 = "$host/student/{stuid_x}"; // 链接到学生主页面
  var request1= HttpRequest.getString(url1).then(onDataLoaded_tea_stu);
}


///点击学生登陆按钮后的响应事件
///学生页面的数据
void enter_stu(MouseEvent e) {
//todo 访问数据库，获取所有学生数据，并格式化为json
  print("成功登陆");//调试
  var url = "$host/student/{stuid_x}"; // 链接到学生主页面
  var request = HttpRequest.getString(url).then(onDataLoaded_stu);
  
/*
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

///学科成绩界面的信息展示
void stu_xkcj_detail(MouseEvent e) {
//todo 访问数据库，获取所有学生数据，并格式化为json
print("成功登陆");//调试
var url = "$host/student/{stuid_x}"; // 链接到学生主页面
var request = HttpRequest.getString(url).then(onDataLoaded_xkcj_detail);
}


  
///教师进入界面教师信息显示
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

///教师界面所有学生的信息展示
onDataLoaded_tea_stu(responseText) {
  var jsonString = responseText;
  //用类实现有问题  List<student> stu= decode(responseText, type:const TypeHelper<List<student>>().type);
  List stu=JSON.decode(jsonString);
  for (int i = 0; i <= 2; i++) {//i=学生数量-1，循环输出。但是在html界面是写完了全部的id，不知道有什么方法可以循环。
    var stu_allDATA2= stu[i];
    querySelector('#stuname$i').text = stu_allDATA2["name"];
    querySelector('#stuid$i').text = stu_allDATA2["id"].toString();
    querySelector("#xkcjscore$i").text = stu_allDATA2["xkcj"];
    querySelector("#xskyscore$i").text = stu_allDATA2["xsky"];
    querySelector("#shhdscore$i").text = stu_allDATA2["shhd"];
    querySelector("#jxjlevelscore$i").text = stu_allDATA2["jxj"];
  }
}

///学科成绩界面的信息展示
onDataLoaded_xkcj_detail(responseText){
  var jsonString_xkcj = responseText;
  //用类实现有问题  List<student> stu= decode(responseText, type:const TypeHelper<List<student>>().type);
  List xkcj=JSON.decode(jsonString_xkcj);
  //第一位学生成绩信息
  var stu_allDATA1= xkcj[0];
  querySelector('#stu_name').text="姓名："+stu_allDATA1["name"];
  querySelector('#stu_num').text="学号："+ stu_allDATA1["id"].toString();
  querySelector("#deit_score").text =  stu_allDATA1["deit"].toString();
  querySelector("#math_score").text =  stu_allDATA1["math"].toString();
  querySelector("#english_score").text =  stu_allDATA1["english"].toString();
  querySelector("#phy_score").text =  stu_allDATA1["phy"];
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


```

```dart
///sever.dart中教师界面信息展示，数据连接
Future<String> getDataFromDb_tea() async {
  var results = await pool.query('select teaname,teaid from tea_info');
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

```


```dart
///css设计

#output {
    font-family: "华文楷体";
    font-size: 20px;
    margin: 0 auto;
    text-align: center;
    color: darkorange;

}
#return_button{
    width: 100px;
    height: 20px;
    margin-top: 10px;
    margin-bottom: 10px;
    float: right;
    margin-left: auto;

}

```
```dart
///html界面

///学科成绩界面信息展示
  <div id="xkcj_detail" style="display:none">
        <table id="stu_info_xkcj" >
            <tr>
                <td style="font-weight:bold;" >欢迎您！</td>
                <td></td>
                <td id="stu_name_xkcj" style="font-weight:bold;" ></td>
                <td><span>&nbsp;&nbsp;&nbsp;</span></td>
                <td id="stu_num_xkcj" style="font-weight:bold;" ></td>
            </tr>
        </table>

        <table id="xkcj_show" class="t1" border="1">
            <tr></tr>
            <tr align="center">各科成绩信息表</tr>
            <tr >
                <th id="deit">教育技术学</th>
                <th id="math">大学数学</th>
                <th id="english">大学英语</th>
                <th id="phy">大学物理</th>


            </tr>
            <tr>
                <td id="deit_score" align="center"></td>
                <td id="math_score" align="center"></td>
                <td id="english_score" align="center"></td>
                <td id="phy_score" align="center"></td>

            </tr>
        </table>
    </div>
///教师界面信息展示
    <div id="tea_login" style="display:none">
        <table id="tea_info" class="t1" >
            <td>
            <td style="font-weight:bold;" >欢迎您！</td>
                <td id="tea_name"></td>
                <td id="tea_num"></td>
            </tr>
        </table>
        <table id="tea_show" class="t1" border="1">
            <tr align="center">2016-2017上学年教信一班总评排名</tr>
            <tr>
                <th id="stu_name1">学生姓名</th>
                <th id="stu_num1">学号</th>
                <th id="xkcj1">学科成绩</th>
                <th id="xsky1">学术科研</th>
                <th id="shhd1">社会活动</th>
                <th id="jxjlevel1">奖学金等级</th>
            </tr>
            <tr>
                <td id="stuname0" align="center"></td>
                <td id="stuid0" align="center"></td>
                <td id="xkcjscore0" align="center"></td>
                <td id="xskyscore0" align="center"></td>
                <td id="shhdscore0" align="center"></td>
                <td id="jxjlevelscore0" align="center"></td>
            </tr>
            <tr>
                <td id="stuname1" align="center"></td>
                <td id="stuid1" align="center"></td>
                <td id="xkcjscore1" align="center"></td>
                <td id="xskyscore1" align="center"></td>
                <td id="shhdscore1" align="center"></td>
                <td id="jxjlevelscore1" align="center"></td>
            </tr>
            <tr>
                <td id="stuname2" align="center"></td>
                <td id="stuid2" align="center"></td>
                <td id="xkcjscore2" align="center"></td>
                <td id="xskyscore2" align="center"></td>
                <td id="shhdscore2" align="center"></td>
                <td id="jxjlevelscore2" align="center"></td>
            </tr>

```
  
## 我的活动量化
> 活动量化数据截止到2017-1-6,16:00.

>  **涂斌琴/10140340105/22 commits / 895 ++ / 791 --/1 issues/**  

## 我的issue活动

![default](https://cloud.githubusercontent.com/assets/22018492/21711474/38561ce6-d42a-11e6-90e0-3150cf2151d2.png)

>ps.还有关于异步中future问题的issue解答，我关闭了找不到了。





# 我的自评
>### 自评:
>一开始学习web编程，这是一个新语言，只有在网站中进行英语学习，很感兴趣，但是也学的很困难。最难的，是自己建立dart编程的概念。等到自己建立好了概念，就不难了。一开始希望老师给我们讲解一些dart的基本语法结构，但是老师从一开始就教我们这么在dart官网上找到自己想要的东西，一遍遍的教查找方法，也是一遍遍得教我们在webstorm中调试代码，调试代码需要打开客户端、服务器端、网站，循环来回测试。一开始没有记住，也是后来老师教了一次又一次才记住才学会。

>在编程的过程中，很多次都是在晚上熬夜写的，不懂的时候会问老师，问同学。这是一个学习新语言的过程，也是一个学会如何接受和学习新语言、新事物的过程。在这门课的学习中，我最大的收获，也是老师经常告诉我们的：学会学习的方法，培养自己的学习能力。知识很重要，更重要的是学习知识的能力。



> 如果用**一整天8小时**时间计算，我有信心再用三天完成未目前完成的功能。
>目前我们没有完成的工作就是：登录注册功能的实现、搜索功能的实现、页面的风格完善，还需要三天，就可以完成。
