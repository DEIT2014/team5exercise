import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:sqljocky/sqljocky.dart';
import 'dart:async';


main(List<String> args) async {
  var pool = new ConnectionPool(host: "localhost",
      port: 3306,
      user: 'suzyfish',
      db: 'teamfive',
      max: 5); //与数据库相连
  var x=pool;

  var results1 = await pool.query( 'select stuname,stuid,xkcj,xsky,shhd,jxj from stugrade');
  results1.forEach((row) {
    //列出所有用户名

    print('stuname: ${row.stuname}, stuid: ${row.stuid}');



  });
}













