import 'package:api_test/main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Ser extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Flutter Tutorial',
          style: TextStyle(color: Colors.black),
        ),
      ),
      /* body: ListView.builder(
        itemCount: user.length,
        itemBuilder: (context, index) {
          return Container(
            height: 150.0,
            child: Column(
              children: <Widget>[
                Text("${user[index]["userId"]}"),
                Text("${user[index]["id"]}"),
                Text("${user[index]["title"]}"),
                Text("${user[index]["body"]}"),
              ],
            ),
          );
        },
      ),*/
    );
  }
}
