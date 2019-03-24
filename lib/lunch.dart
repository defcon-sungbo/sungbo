import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class _lunchInfo extends State<page_lunch>{

  Future<MealModel> m ;

  _lunchInfo({Key key, this.m}) : super();

  @override
  Widget build(BuildContext context) {

   return Container(
     decoration: new BoxDecoration(color: Colors.white),
       child:
     Column(
       children: <Widget>[
         Padding(
             padding: const EdgeInsets.only(left: 16.0, top: 72.0),
             child: Text("오늘의 급식", style : Theme.of(context).textTheme.title)
         ),
         FutureBuilder<MealModel>(
                   future: m,
                   builder: (context, snapshot) {
                     if (snapshot.hasData) {
                       return  Padding(
                         padding: const EdgeInsets.only(left: 16.0, top: 72.0),
                         child: Text((snapshot.data.Content == " ") ? "오늘은 급식이 없습니다." : snapshot.data.Content,
                         style : Theme.of(context).textTheme.title)
                       );

                     } else if (snapshot.hasError) {
                       return Text("${snapshot.error}");
                     }
                     // By default, show a loading spinner
                     return Center(
                         child : CircularProgressIndicator()
                     );
                   },
                 ),
       ],
     ),
   );
  }

  //Comit
}


Future<MealModel> FenchMeal(DateTime d) async {
  String Scode = 'B100000470';
  var formatter = new DateFormat('yyyy.MM.dd');
  String formatted = formatter.format(d);


  final response =
  await http.get('http://juneyoung.kr/api/school-meal/meal_api_custom.php?countryCode=stu.sen.go.kr&schulCode=$Scode&insttNm=성보고등학교&schulCrseScCode=4&schMmealScCode=2&schYmd=$formatted');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    MealModel a = MealModel.fromJson(json.decode(response.body));
    return a;
  } else {
    throw Exception('Failed to load post');
  }
}


class page_lunch extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() => _lunchInfo(m: FenchMeal(DateTime.now()));
}
class MealModel {
  String Schoolcode = "";
  String Schoolname = "";
  String SchoolType = "";
  String MealType = "";
  String Date = "";
  String Content = "";

  MealModel({this.Schoolcode,this.Schoolname,this.SchoolType,this.MealType,this.Date,this.Content});

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      Schoolcode: json['학교 코드'],
      Schoolname: json['학교 명'],
      SchoolType: json['학교 종류'],
      MealType: json['급식 종류'],
      Date : json["날짜"],
        Content : json["메뉴"]
    );
  }
}
