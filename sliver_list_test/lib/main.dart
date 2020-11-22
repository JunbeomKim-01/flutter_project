import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sliver_list_test/dio_server.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sliver_list_test/login.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class recommand {
  final String images;
  final String title;
  final String name;
  recommand({this.images, this.title, this.name});

  static List<recommand> rebooks() {
    var remanbook = new List<recommand>();
    remanbook.add(new recommand(
        images: "recommand/book1.jpg",
        title:
            "말과 글에는 나름의 온도가 있다. 따뜻함과 차가움의 정도가 저마다 다르다. 적당히 온기 있는 언어는 슬픔을 감싸 안아준다. 세상살이에 지칠 때 어떤 이는 친구와 이야기를 주고받으며 고민을 털어내고, 어떤 이는 책을 읽으며 작가가 건네는 문장에서 위안을 얻는다. 그렇다면 이 책을 집어 든 우리의 언어 온도는 몇 도쯤 될까?무심결에 내뱉은 말 한마디 때문에 소중한 사람이 곁을 떠났다면 '말 온도'가 너무 뜨거웠던 게 아닐까. 한두 줄 문장 때문에 누군가 마음의 문을 닫았다면 '글 온도'가 너무 차갑기 때문인지도 모를 노릇이다.",
        name: "언어의 온도"));
    remanbook.add(new recommand(
      images: "recommand/book1 copy.jpg",
      title:
          "말과 글에는 나름의 온도가 있다. 따뜻함과 차가움의 정도가 저마다 다르다. 적당히 온기 있는 언어는 슬픔을 감싸 안아준다. 세상살이에 지칠 때 어떤 이는 친구와 이야기를 주고받으며 고민을 털어내고, 어떤 이는 책을 읽으며 작가가 건네는 문장에서 위안을 얻는다. 그렇다면 이 책을 집어 든 우리의 언어 온도는 몇 도쯤 될까?무심결에 내뱉은 말 한마디 때문에 소중한 사람이 곁을 떠났다면 '말 온도'가 너무 뜨거웠던 게 아닐까. 한두 줄 문장 때문에 누군가 마음의 문을 닫았다면 '글 온도'가 너무 차갑기 때문인지도 모를 노릇이다.",
      name: "언어의 온도",
    ));
    remanbook.add(new recommand(
        images: "recommand/book1 copy 2.jpg",
        title:
            "말과 글에는 나름의 온도가 있다. 따뜻함과 차가움의 정도가 저마다 다르다. 적당히 온기 있는 언어는 슬픔을 감싸 안아준다. 세상살이에 지칠 때 어떤 이는 친구와 이야기를 주고받으며 고민을 털어내고, 어떤 이는 책을 읽으며 작가가 건네는 문장에서 위안을 얻는다. 그렇다면 이 책을 집어 든 우리의 언어 온도는 몇 도쯤 될까?무심결에 내뱉은 말 한마디 때문에 소중한 사람이 곁을 떠났다면 '말 온도'가 너무 뜨거웠던 게 아닐까. 한두 줄 문장 때문에 누군가 마음의 문을 닫았다면 '글 온도'가 너무 차갑기 때문인지도 모를 노릇이다.",
        name: "언어의 온도"));
    remanbook.add(new recommand(
        images: "recommand/book1 copy 3.jpg",
        title:
            "말과 글에는 나름의 온도가 있다. 따뜻함과 차가움의 정도가 저마다 다르다. 적당히 온기 있는 언어는 슬픔을 감싸 안아준다. 세상살이에 지칠 때 어떤 이는 친구와 이야기를 주고받으며 고민을 털어내고, 어떤 이는 책을 읽으며 작가가 건네는 문장에서 위안을 얻는다. 그렇다면 이 책을 집어 든 우리의 언어 온도는 몇 도쯤 될까?무심결에 내뱉은 말 한마디 때문에 소중한 사람이 곁을 떠났다면 '말 온도'가 너무 뜨거웠던 게 아닐까. 한두 줄 문장 때문에 누군가 마음의 문을 닫았다면 '글 온도'가 너무 차갑기 때문인지도 모를 노릇이다.",
        name: "dd"));
    remanbook.add(new recommand(
        images: "recommand/book1 copy 4.jpg",
        title:
            "말과 글에는 나름의 온도가 있다. 따뜻함과 차가움의 정도가 저마다 다르다. 적당히 온기 있는 언어는 슬픔을 감싸 안아준다. 세상살이에 지칠 때 어떤 이는 친구와 이야기를 주고받으며 고민을 털어내고, 어떤 이는 책을 읽으며 작가가 건네는 문장에서 위안을 얻는다. 그렇다면 이 책을 집어 든 우리의 언어 온도는 몇 도쯤 될까?무심결에 내뱉은 말 한마디 때문에 소중한 사람이 곁을 떠났다면 '말 온도'가 너무 뜨거웠던 게 아닐까. 한두 줄 문장 때문에 누군가 마음의 문을 닫았다면 '글 온도'가 너무 차갑기 때문인지도 모를 노릇이다.",
        name: "언어의 온도"));
    return remanbook;
  }
}

class Post {
  final String head;
  final String body;
  Post({
    this.head,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      head: json['head'].toString(),
      body: json['body'].toString(),
    );
  }
}

class Get {
  final int headers;
  final int id;
  final String title;
  final String body;

  Get({this.headers, this.id, this.title, this.body});

  factory Get.fromJson(Map<String, dynamic> json) {
    return Get(
      headers: json['authorization'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

// ignore: camel_case_types
class book {
  final String name;
  final String image;
  final String retrunday;
  final String borrowday;
  final String title;

  book({
    this.name,
    this.image,
    this.borrowday,
    this.retrunday,
    this.title,
  });

  static List<book> allbooks() {
    var lstOfbooks = new List<book>();
    lstOfbooks.add(new book(
      name: "언어의 온도",
      retrunday: "10/30",
      borrowday: "10/20",
      image: "assets/book1.jpg",
      title:
          "말과 글에는 나름의 온도가 있다. 따뜻함과 차가움의 정도가 저마다 다르다. 적당히 온기 있는 언어는 슬픔을 감싸 안아준다. 세상살이에 지칠 때 어떤 이는 친구와 이야기를 주고받으며 고민을 털어내고, 어떤 이는 책을 읽으며 작가가 건네는 문장에서 위안을 얻는다. 그렇다면 이 책을 집어 든 우리의 언어 온도는 몇 도쯤 될까?무심결에 내뱉은 말 한마디 때문에 소중한 사람이 곁을 떠났다면 '말 온도'가 너무 뜨거웠던 게 아닐까. 한두 줄 문장 때문에 누군가 마음의 문을 닫았다면 '글 온도'가 너무 차갑기 때문인지도 모를 노릇이다.",
    ));
    lstOfbooks.add(new book(
        name: "행복해지는 연습을 해요",
        borrowday: "10/26",
        retrunday: "10/29",
        image: "assets/book2.jpg"));
    lstOfbooks.add(new book(
        name: "우리의 계절",
        borrowday: "10/24",
        retrunday: "10/30",
        image: "assets/book3.jpg"));
    lstOfbooks.add(new book(
        name: "행복해지는 연습을 해요",
        borrowday: "10/25",
        retrunday: "10/30",
        image: "assets/book4.jpg"));

    return lstOfbooks;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.lightBlue[100],
      ),
      home: LoginPage(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '성서봇 메인',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        shadowColor: Colors.black,
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                elevation: 0,
                focusElevation: 0,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.menu_book,
                      color: Colors.green[500],
                    ),
                    Text('books')
                  ],
                ),
                onPressed: () {
                  //server.postReq();
                  // var serverPost = Future.value(server.postReq());
                  Navigator.push(
                      context, CustomRoute(builder: (context) => MyHomePage()));
                },
                color: Colors.white,
              ),
            ]),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.books}) : super(key: key);
  final String title;
  final List<Get> books;
  @override
  _MyHomePageState createState() => _MyHomePageState(this.books);
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Get> books;
  final List<book> _allbooks = book.allbooks();
  final List<recommand> _reBooks = recommand.rebooks();

  _MyHomePageState(this.books);

  @override
  Widget build(
    BuildContext context,
  ) {
    print(books);
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                '도서관 ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ]),
        shadowColor: Colors.black,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '추천도서',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Flexible(
            flex: 3,
            child: Swiper(
              containerHeight: 10.0,
              autoplay: true,
              itemWidth: MediaQuery.of(context).size.width * 0.32,
              itemHeight: MediaQuery.of(context).size.height * 0.4,
              viewportFraction: 0.8,
              layout: SwiperLayout.STACK,
              pagination: SwiperPagination(alignment: Alignment.bottomRight),
              itemCount: _reBooks.length,
              itemBuilder: (BuildContext context, int index) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: GestureDetector(
                  onTap: () {
                    //server.getReq(headerkey.toString());
                    _showSnackBar(context, _reBooks[index], index, books);
                    // _PostRequest();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 140.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(_reBooks[index].images),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          /* Text(
            '도서 대출 현황',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),*/
          Flexible(
            flex: 7,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        height: 135.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(_allbooks[index].image,
                              fit: BoxFit.fill, height: 130.0, width: 100.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              _allbooks[index].name,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              child: Column(children: <Widget>[
                                Text(
                                  '대출일 : ${_allbooks[index].borrowday}',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  child: Text(
                                    '반납일: ${_allbooks[index].retrunday}',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*_PostRequest() async {
  String url = 'http://192.210.110.7:8080/lib/api';

  http.Response response = await http.Post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: <String, String>{'user_id': '201504009', 'user_pwd': '13714009'},
  );
}
*/
_showSnackBar(BuildContext context, recommand item, index, books) {
  final SnackBar objSnackbar = new SnackBar(
    content: Center(
      child: Material(
        elevation: 0,
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width * 0.7,
          height: 500.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: new Image.asset(
                  item.images,
                  height: 200.0,
                  width: 150.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              //Text('${item.name}'),
              SizedBox(
                height: 10.0,
              ),
              Text(
                ' ${item.name}',
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '소개글 : ${item.title}',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
  );
  Scaffold.of(context).showSnackBar(objSnackbar);
}

ScrollController _controller;
@override
void initState() {
  // super.initState();
  _controller = ScrollController();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _controller
        .animateTo(_controller.position.maxScrollExtent,
            duration: Duration(seconds: 1), curve: Curves.ease)
        .then((value) async {
      await Future.delayed(Duration(seconds: 2));
      _controller.animateTo(_controller.position.minScrollExtent,
          duration: Duration(seconds: 1), curve: Curves.ease);
    });
  });
}

callMeWidget() {
  return Container(
    height: 100,
    width: 100,
    color: Colors.red,
    margin: EdgeInsets.all(10),
  );
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
