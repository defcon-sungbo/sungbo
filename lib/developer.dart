import 'package:flutter/material.dart';

class developer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: new Center(
        child: new Column(
          children: <Widget>[
            Image.asset("assets/logo.jpeg"),
            Text("주 개발자 : 윤태일(01년생)",
                style: Theme.of(context).textTheme.body1),
            Text("이전 버전 : 유용민(00), 김영현(00)",
                style: Theme.of(context).textTheme.body1),
            Text("\n개발자 계좌",
                style: Theme.of(context).textTheme.body1),
            Text("하나은행 57791024440507",
                style: Theme.of(context).textTheme.title)
          ],
        ),
      ),
    );
  }

}