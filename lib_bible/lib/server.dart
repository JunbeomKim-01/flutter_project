import 'package:lib_bible/main.dart';
import 'package:lib_bible/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

const _Api_PREFIX = '127.0.0.1:8080/auth/login';
const _Api_list = '127.0.0.1:8080/users/library';
Server server = Server();
String headerkey;

class Server {
  Future<dynamic> postReq(id, pw) async {
    //print(jsonEncode({"user_id": "202004011", "user_pw": "85034011"}));

    //Post
    http.Response response = await http
        .post(_Api_PREFIX, body: jsonEncode({"id": id, "pw": pw}))
        .timeout(const Duration(seconds: 3));
    print('세션 가져옴:' +
        response.headers['authorization'] +
        "   go to -> get async func");
    print(response.headers);
    var code = response.statusCode;
    headerkey = response.headers['authorization'];

    http.Response response3 = await http.get(_Api_list,
        headers: {"authorization": response.headers['authorization']});
    return jsonDecode(response3.body);
    if (response.statusCode == 200) {}

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
