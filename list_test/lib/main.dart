import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.limeAccent[50],
      ),
      home: new Home(),
    );
  }
}

class Book {
  final String name;
  final String image;
  final String retrunday;
  final String borrowday;
  final String title;
  Book({this.name, this.image, this.borrowday, this.retrunday, this.title});

  static List<Book> allbooks() {
    var lstOfbooks = new List<Book>();
    lstOfbooks.add(new Book(
      name: "언어의 온도",
      retrunday: "10/30",
      borrowday: "10/20",
      image: "assets/book1.jpg",
      title:
          "말과 글에는 나름의 온도가 있다. 따뜻함과 차가움의 정도가 저마다 다르다. 적당히 온기 있는 언어는 슬픔을 감싸 안아준다. 세상살이에 지칠 때 어떤 이는 친구와 이야기를 주고받으며 고민을 털어내고, 어떤 이는 책을 읽으며 작가가 건네는 문장에서 위안을 얻는다. 그렇다면 이 책을 집어 든 우리의 언어 온도는 몇 도쯤 될까?무심결에 내뱉은 말 한마디 때문에 소중한 사람이 곁을 떠났다면 '말 온도'가 너무 뜨거웠던 게 아닐까. 한두 줄 문장 때문에 누군가 마음의 문을 닫았다면 '글 온도'가 너무 차갑기 때문인지도 모를 노릇이다.",
    ));
    lstOfbooks.add(new Book(
        name: "행복해지는 연습을 해요",
        borrowday: "10/26",
        retrunday: "10/29",
        image: "assets/book2.jpg"));
    lstOfbooks.add(new Book(
        name: "우리의 계절",
        borrowday: "10/24",
        retrunday: "10/30",
        image: "assets/book3.jpg"));
    lstOfbooks.add(new Book(
        name: "행복해지는 연습을 해요",
        borrowday: "10/25",
        retrunday: "10/30",
        image: "assets/book4.jpg"));
    return lstOfbooks;
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
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
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[Icon(Icons.menu_book), Text('books')],
                ),
                onPressed: () {
                  Navigator.push(
                      context, CustomRoute(builder: (context) => Homepage()));
                },
                color: Colors.white,
              ),
            ]),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  final List<Book> _allbooks = Book.allbooks();
  Homepage();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: new Text(
            '도서관 대출현황',
            style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: getHomePageBody(context),
      ),
      backgroundColor: Colors.lightBlue[50],
    );
  }

  getHomePageBody(BuildContext context) {
    return ListView.builder(
      itemCount: _allbooks.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(0.0),
    );
  }

  Widget _getItemUI(
    BuildContext context,
    int index,
  ) {
    return new GestureDetector(
      onTap: () {
        _showSnackBar(context, _allbooks[index], index);
      },
      child: Card(
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
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Column(children: <Widget>[
                      Text(
                        '대출일 : ${_allbooks[index].borrowday}',
                        style: TextStyle(
                            fontSize: 15.0, fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Text(
                          '반납일: ${_allbooks[index].retrunday}',
                          style: TextStyle(
                              fontSize: 15.0, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_showSnackBar(BuildContext context, Book item, int index) {
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
                  item.image,
                  height: 200.0,
                  width: 150.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('${item.name}'),
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

//화면전환 에니메이션
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
