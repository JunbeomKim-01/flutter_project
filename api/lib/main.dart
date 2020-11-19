import 'package:api/model/testjons.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:async';
import 'dart:convert';

void main() {
  var materialApp = MaterialApp(
    //if(==){theme: ThemeData.dark()}
    debugShowCheckedModeBanner: false,
    //theme: ThemeData.dark(),
    title: 'Navigation Basics',
    home: FirstRoute(),
  );
  runApp(materialApp);
}

// Icon(Icons.dangerous);
class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[100],
        title: Text(
          '성서봇 메인',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        shadowColor: Colors.black,
      ),
      body: Center(
        child: RaisedButton(
            child: Text('도서관 앱'),
            onPressed: () {
              Navigator.push(
                  context, CustomRoute(builder: (context) => SecondRoute()));
            }),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "도서관 대출현황",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.indigo[100],
      ),
      body: BodyLayOut(),
    );
  }
}

// 화면전환 에니메이션
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

//데이터 송신 클레스
Future<Info> fetchInfo() async {
  final url = '127.0.0.1:8080/lib/api/my_lib';
  final response = await http.get('127.0.0.1:8080/lib/api/my_lib');
  if (response.statusCode == 200) {
    final jsonBody = json.decode(response.body);
    print('통과');
    return Info.fromJson(jsonBody);
  } else {
    throw Exception('Failed to load post');
  }
}

//데이터를 품을 클레스
class Info {
  List<serverData> data;
  String code;
  bool success;

  Info({this.data, this.code, this.success});

  Info.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<serverData>();
      json['data'].forEach((v) {
        data.add(new serverData.fromJson(v));
      });
    }
    code = json['code'];
    success = json['success'];
  }
}

//데이터를 받을 클레스
// ignore: camel_case_types
class serverData {
  String retrunDay;
  String bookname;
  String borrowDay;
  serverData({this.bookname, this.borrowDay, this.retrunDay});

  serverData.fromJson(Map<String, dynamic> json) {
    retrunDay = json['retrunDay'];
    bookname = json['bookname'];
    borrowDay = json['borrowDay'];
  }
}

//아래는 리스트 위젯
class BodyLayOut extends StatefulWidget {
  @override
  _BodyLayOutState createState() => _BodyLayOutState();
}

class _BodyLayOutState extends State<BodyLayOut> {
  var snapshot;

  int index;

  @override
  Widget build(BuildContext context) =>
      _myCardTypeList(context, snapshot, index);
}

//api 잘 받았는지 확인
/*Widget _buildlist(AsyncSnapshot snapshot, int index) {
  var bookname = snapshot.data.data[index].bookname;
  var borrowDay = snapshot.data.data[index].borrowDay;
  var retrunDay = snapshot.data.data[index].retrunDay;
  return Text('bookname : ' +
      bookname +
      '\n' +
      'borrowDay : ' +
      borrowDay +
      '\n' +
      'retrunDay : ' +
      retrunDay +
      '\n');
}*/
Widget _myCardTypeList(
    BuildContext context, AsyncSnapshot snapshot, int index) {
  final List<Map<String, dynamic>> meta = [
    {
      'head': [
        'No',
        '대출일자',
        '반납예정일',
        '대출상태',
        '연기횟수',
      ],
      'body': [
        [
          '1',
          '혼자서 본 영화',
          '2020-10-19',
          '2020-11-09',
          '대출중',
          '연기불가',
          '해당없음',
        ],
        [
          '2',
          '죽고싶지만 떡볶이는 먹고 싶어',
          '2020-10-19',
          '2020-10-28',
          '대출중',
          '연장',
          '1번 가능',
        ]
      ],
    }
  ];
  final List<Map<String, dynamic>> data = [
    {
      'booknum1': {
        'name': '혼자서 본 영화',
        'retrunday': '2020-10-29',
        'borrowday': '2020-10-18',
        //'Cover':''
      },
    },
    {
      'booknum2': {
        'name': '죽고싶지만 떡볶이는 먹고 싶어',
        'retrunday': '2020-10-30',
        'borrowday': '2020-10-20',
        //'Cover':''
      },
    },
    {
      'booknum3': {
        'name': '난중일기',
        'retrunday': '2020-10-28',
        'borrowday': '2020-10-19',
        //'Cover':''
      },
    }
  ];
  double size = 230.0;
  return new ListView(
    children: ListTile.divideTiles(
      context: context,
      tiles: [
        Container(
          color: Colors.blueGrey[50],
          height: size,
          child: Card(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/download.jpg',
                        fit: BoxFit.cover, width: 100.0),
                    // Text("${data[0]['booknum1']['name']}".toString()),
                  ],
                ),
                Center(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${data[0]['booknum1']['name']}".toString(),
                        )
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "대출일: ${data[0]['booknum1']['borrowday']}  "
                                  "  "
                                  "반납일: ${data[0]['booknum1']['retrunday']} "
                              .toString(),
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    onTap: () {
                     // _showSnackBar(context, data[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.blueGrey[50],
          height: size,
          child: Card(
            //color: Colors.blueGrey[100],
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/book2.jpg',
                        fit: BoxFit.cover, width: 100.0),
                    // Text("${data[1]['booknum2']['name']}".toString()),
                  ],
                ),
                Center(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${data[1]['booknum2']['name']}".toString(),
                        )
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "대출일: ${data[1]['booknum2']['borrowday']}  "
                                  "  "
                                  "반납일: ${data[1]['booknum2']['retrunday']} "
                              .toString(),
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    onTap: () {
                    //  _showSnackBar(context, data[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.blueGrey[50],
          height: size,
          child: Card(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images.jpg',
                        fit: BoxFit.cover, width: 100.0, height: 150.0),
                    //Text("${data[2]['booknum3']['name']}".toString()),
                  ],
                ),
                Center(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${data[2]['booknum3']['name']}".toString(),
                        )
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "대출일: ${data[2]['booknum3']['borrowday']}  "
                                  "  "
                                  "반납일: ${data[2]['booknum3']['retrunday']} "
                              .toString(),
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    onTap: () {
                    //  _showSnackBar(context, data[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ).toList(),
  );
}

/*_showSnackBar(BuildContext context, item) {
  final SnackBar objSnackbar = new SnackBar(
    content: new Text("${data[0]['book1']['name']}  ${data.['book1']['borrowday']}"),
    backgroundColor: Colors.amber[50],
  );
  Scaffold.of(context).showSnackBar(objSnackbar);
}*/

/*
//그리드 뷰 소스
retun new GridView.count(
  crossAxisCount: 2,

  children :  List.generate(4,(index){
    retrun Center(
      child:Text(
        '${data[0]['booknum1']['name']}',
        style: Theme.of(context).textTheme.headline5,
      ),
      child: image.asset('asset/download.jpg'),
    ),
  }),
);

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          leading: Icon(Icons.wb_sunny),
          title: Text(titles[index]),
          subtitle: Text(sub[index]),
        ),
      );
    },
  );
}*/

//Widget _myListView(BuildContext context) {
/* return ListView(
    children: ListTile.divideTiles(
      context: context,
      tiles: [
        ListTile(
          title: Text('도서대출.1'),
          subtitle: Text('11/29일 대출 D-1일 남음'),
        ),
        ListTile(
          title: Text('도서대출.2'),
          subtitle: Text('11/14일 대출 D-4일 남음'),
        ),
        ListTile(
          title: Text('도서대출.3'),
          subtitle: Text('11/30일 대출 D-6일 남음'),
        ),
      ],
    ).toList(),
  );
*/
