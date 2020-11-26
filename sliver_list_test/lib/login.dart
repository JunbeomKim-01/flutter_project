import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sliver_list_test/main.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

final nameController = TextEditingController();
final passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '도서관 로그인',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  child: Text(''),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Login'),
                        onPressed: () {
                          //server.postReq(nameController, passwordController);
                          post(nameController.text, passwordController.text);
                          Navigator.push(context,
                              CustomRoute(builder: (context) => MyHomePage()));

                          //로그인 버튼 클릭시 이벤트
                          /*if (server.postReq(
                                nameController, passwordController) ==
                            200) {
                          Navigator.push(context,
                              CustomRoute(builder: (context) => Home()));*/
                        }
                        /*print(nameController.text);
                        print(passwordController.text);*/

                        )),
              ],
            )));
  }
}

Future<dynamic> post(id, pw) async {
  await Future.delayed(Duration(seconds: 3));
  final response = await http.post('http://192.168.25.1:8080/auth/login',
      body: jsonEncode({"id": id, "pw": pw}));
  //print(jsonDecode(response.headers['authorization']));

  //await Future.delayed(Duration(seconds: 3));
  final response1 = await http.get('http://192.168.25.1:8080/users/library',
      headers: {'Authorization': response.headers['authorization']});
  print(response1.body);
  var result = response1.body;
  Post.fromJson(jsonDecode(result));
  //String jsondata = jsonDecode(response1.headers.toString());
  //print(jsondata);
}
