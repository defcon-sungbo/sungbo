import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class page_bus extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => bus_info();
}

class bus_info extends State<page_bus>{

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: "https://www.google.com",
      appBar: new AppBar(
        title: new Text("bus"),
      ),
    );
  }

}