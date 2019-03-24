import 'package:flutter/material.dart';

class community extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new Container(
      child: new Center(
        child:Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 72.0),
            child: Text("준비중인 기능",
                style : Theme.of(context).textTheme.title)
        ),
      ),
    );
  }

}