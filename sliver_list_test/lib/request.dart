import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'pakages:shared_preferences/shared_preferences.dart';

  Api api = Api();
  var response;
  var storageData;
  Map<String, String> header = {};
  String requestType;
  Map<String, dynamic> studentTotalInfo;
  var studentInfo;
  var studentImg;

class Storage {
  // Authorization 가져오기
  static getAuthorization() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('auth');
  }

  static getLocalData(String kind) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getStringList(kind);
  }
}

class Profile {
  final String sid;
  final String name;
  final String major;

  Profile({this.sid, this.name, this.major});

  factory Profile.fromJson(Map<String, dynamic> json) {
    json = jsonDecode(json['data'])['data'];
    return new Profile(
        sid: json['sid'], name: json['name'], major: json['major']);
  }
}

class UserInformation {
  Profile profile;
  Img studentImage;

  UserInformation({this.profile, this.studentImage});

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    return new UserInformation(
        profile: json['info'], studentImage: json['img']);
  }
}

class Api {
  
  Future<Map<String, dynamic>> getPhoto() async {
    requestType = 'studentImg';
    header = {'Authorization': await Storage.getAuthorization()};
    storageData = await Storage.getLocalData(requestType);
    if (storageData != null) {
      // 내부 데이터가 있을 경우 헤더에 ETag를 담아 요청
      header['If-None-Match'] = storageData[1]; // 1은 etag
    }

    response = await http.get('$_url/users/photo', headers: header);
    return HttpDataPorcess.auth(response, kind: requestType);
  }

  Future<UserInformation> getStudentInfo() async {
    studentImg = await Api().getPhoto();
    studentImg = Img.fromJson(studentImg);

    studentTotalInfo = {
      'img': studentImg,
    };

    return UserInformation.fromJson(studentTotalInfo);
  }
}

class Requset {
  
  
}
