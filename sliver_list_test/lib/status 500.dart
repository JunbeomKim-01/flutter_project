import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sliver_list_test/dio_server.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sliver_list_test/login.dart';
import 'dart:ui';

class ERRORPAGE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('구문 오류'),
      ),
    );
  }
}
