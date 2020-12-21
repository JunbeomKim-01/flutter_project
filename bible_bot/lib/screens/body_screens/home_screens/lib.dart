import 'dart:convert';
import 'dart:io';
import 'package:bible_bot/api/api.dart';
import 'package:bible_bot/models/event.dart';
import 'package:bible_bot/models/style_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:bible_bot/screens/body_screens/home_screens/see_more_screen.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:bible_bot/models/style_model.dart';
import 'package:provider/provider.dart';
import 'package:bible_bot/models/lib.dart';
import 'package:bible_bot/api/api.dart';

class Lib extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StyleModel styleModel = Provider.of<StyleModel>(context);
    return Scaffold(
      backgroundColor: styleModel.getBackgroundColor()['backgroundColorLevel1'],
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(
            color: styleModel.getBackgroundColor()['reversalColorLevel1']),
        backgroundColor:
            styleModel.getBackgroundColor()['backgroundColorLevel1'],
        title: Text(
          '도서관 ',
          style: styleModel.getTextStyle()['appBarTextStyle'],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '추천도서',
            style: styleModel.getTextStyle()['appBarTextStyle'],
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
              //itemCount: _reBooks.length,
              itemBuilder: (BuildContext context, int index) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: GestureDetector(
                  onTap: () {
                    //server.getReq(headerkey.toString());
                    // _showSnackBar(context, _reBooks[index], index, books);
                    // _PostRequest();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 140.0,
                      width: 200.0,
                      /*decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(_reBooks[index].images),
                                    fit: BoxFit.fill)),*/
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 7,
            child: ListView.builder(
              shrinkWrap: true,
              //itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.blueGrey[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        height: 135.0,
                        /*child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(_allbooks[index].image,
                                    fit: BoxFit.fill,
                                    height: 130.0,
                                    width: 100.0),
                              ),*/
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              '',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              child: Column(children: <Widget>[
                                Text(
                                  '대출일 : ',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  child: Text(
                                    '반납일: ',
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
//추천 도서 받아야해
/*_showSnackBar(BuildContext context, recommand item,index, books) {
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
}*/
