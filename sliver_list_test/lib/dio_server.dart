//import 'dart:io';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:dio/src/response.dart';
import 'package:http/http.dart' as http;
import 'package:sliver_list_test/main.dart';

const _Api_PREFIX = 'http://192.210.118.142:8080/lib/api';
const _Api_list = 'http://192.210.118.142:8080/lib/api/my_lib';
Server server = Server();
String headerkey;

class Server {
  Future<dynamic> postReq(id, pw) async {
    //print(jsonEncode({"user_id": "202004011", "user_pw": "85034011"}));

    //Post
    http.Response response = await http
        .post(_Api_PREFIX, body: jsonEncode({"user_id": id, "user_pw": pw}))
        .timeout(const Duration(seconds: 3));
    print('세션 가져옴:' +
        response.headers['authorization'] +
        "   go to -> get async func");
    print(response.statusCode);
    var code = response.statusCode;
    headerkey = response.headers['authorization'];

    //List 형식으로 header, statusCode 리턴

    List<dynamic> valu = new List<dynamic>();
    valu.add(headerkey);
    valu.add(code); // valu=[header,code]
    print(valu[0]);
    print(valu[1]);
    return valu.toList();
    //return (response.headers['authorization']);
    /* var result = jsonDecode(response2.body);
    print(result["data"]);
    print(result["data"]["body"]);
    Post.fromJson(jsonDecode(result["data"]["body"]));*/
    //post.fromjson으로
  }

  Future<dynamic> getReq(headers) async {
    //Get
    print('<getReq>: ' + headers);
    http.Response response2 = await http
        .get(Uri.encodeFull(_Api_list), headers: {"authorization": headers});

    var datas = jsonDecode(response2.body);
    var body_datas = datas["data"]["body"];
    //test
    print('<show_dict_data>: ' + body_datas[0]);
    return response2.body;
  }
}
