import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class page_bus extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => bus_info();
  bool isSinlim = true;
}

class bus_info extends State<page_bus>{

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: "https://www.google.com",
      appBar: new AppBar(
        title: new Text("bus"),
        actions: <Widget>[
          ButtonBar(
            children: <Widget>[
              GestureDetector(
                child: Text(widget.isSinlim ? "난곡으로": "신림으로" ),
                onTap: ()=>setState(() {widget.isSinlim= !widget.isSinlim;}),
              )
            ],
          )
        ],
      ),
    );
  }

}