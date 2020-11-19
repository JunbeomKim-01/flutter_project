import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_test/ser.dart';

Future<dynamic> fetchPost() async {
  await Future.delayed(Duration(seconds: 2));
  final response = await http.get('https://jsonplaceholder.typicode.com/posts');
  return jsonDecode(response.body);
}

void main() => runApp(MaterialApp(home: Page()));

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  int index;
  var user;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: PageView(
          children: <Widget>[
            for (index = 1; index < 4; index++)
              (SizedBox.expand(
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Introduction Screen",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          "$index 번째 스크린",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            SizedBox.expand(
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Introduction Screen",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        " 4 번째 스크린",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      const SizedBox(height: 40.0),
                      RaisedButton(
                        onPressed: () {
                          print('on');
                          //user = fetchPost();
                          //print(;
                          FutureBuilder(
                              future: fetchPost(),
                              builder: (context, snapshot) {
                                Navigator.push(context,
                                    CustomRoute(builder: (context) => Ser()));
                                /* if (snapshot.hasData) {
                                Navigator.push(context,
                                    CustomRoute(builder: (context) => Ser()));
                              } else {
                                return CircularProgressIndicator();
                              }
                            },*/
                              });
                        },
                        textColor: Colors.white,
                        child: (Text(
                          "DONE",
                        )),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);
  var isInitialRoute;
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == '/') return child;

    return SlideTransition(
        position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
            .animate(animation),
        child: child);
  }
}
