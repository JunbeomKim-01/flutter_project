import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:http/http.dart' as http;

const _Api_PREFIX = 'http://210.123.254.189:8080/lib/api';

class Server {
  Future<void> postReq(id, pw) async {
    http.Response response =
        await http.post(_Api_PREFIX, body: {"user_id": id, "user_pw": pw});
    print(response.body.toString());
  }

  /* Future<void> getReq() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(_Api_PREFIX);
    print(response.data.toString());
  }
}*/
}

Server server = Server();
