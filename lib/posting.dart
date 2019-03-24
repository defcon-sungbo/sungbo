import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel{

}
class PostingListPage extends StatefulWidget{
  @override
  State<PostingListPage> createState() => PostingListPageState();
}

class PostingListPageState extends State<PostingListPage>{

  List<PostModel> _data;

  @override
  Widget build(BuildContext context) {

  }
}

class PostingPage extends StatefulWidget {
  @override
  _PostingPageState createState() => _PostingPageState();
}

class _PostingPageState extends State<PostingPage> {
  ZefyrController _controller;
  TextEditingController _titlecontroller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    final document = new NotusDocument();
    _controller = new ZefyrController(document);
    _focusNode = new FocusNode();

    _titlecontroller = new TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TextField(
        decoration: new InputDecoration.collapsed(
            hintText: 'Title'
        ),
        controller: _titlecontroller,
      ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.send), onPressed: () {
            Firestore.instance.collection("posts")
                .add(
                {
                  "title":_titlecontroller.text,
                  "content":_controller.document.toString(),
                  "uploadtime" : FieldValue.serverTimestamp(),

                }
            );
          })
        ],
      ),
      body: SafeArea(
          child : ZefyrScaffold(
                    child :
                        ZefyrEditor(
                          controller: _controller,
                          focusNode: _focusNode,
                        ),
              ),
      ),
    );
  }
}