import 'package:flutter/material.dart';

class page404 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: new Center(
          child: Text("아직 구현되지 않는 기능입니다.", style: Theme.of(context).textTheme.body1)
      ),
    );
  }

}