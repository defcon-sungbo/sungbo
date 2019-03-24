import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sungbo/bus.dart';
import 'package:sungbo/developer.dart';
import 'package:sungbo/lunch.dart';
import 'package:sungbo/page404.dart';
import 'package:sungbo/posting.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
        ),
      ),
      home:
      MyHomePage(title: 'Flutter Demo Home Page'),


    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  final List<_TileViewModel> tilelist = [
    _TileViewModel().setColor(Color.fromARGB(255,20,136,255)).setIcon(Icons.home).setTitle("홈피").setTileSize(1, 1),
    _TileViewModel().setColor(Color.fromARGB(255,20,136,255)).setIcon(Icons.fastfood).setTitle("급식").setTileSize(2, 2),
    _TileViewModel().setColor(Color.fromARGB(255,20,136,255)).setIcon(Icons.call).setTitle("전화").setTileSize(1, 1),
    _TileViewModel().setColor(Color.fromARGB(255,20,136,255)).setIcon(Icons.notification_important).setTitle("공지사항").setTileSize(3, 1),
    _TileViewModel().setColor(Color.fromARGB(255,20,136,255)).setIcon(Icons.face).setTitle("대나무 숲").setTileSize(2, 2),
    _TileViewModel().setColor(Color.fromARGB(255,20,136,255)).setIcon(Icons.info_outline).setTitle("개발자 정보").setTileSize(1, 1),
    _TileViewModel().setColor(Color.fromARGB(255,20,136,255)).setIcon(Icons.directions_bus).setTitle("버스").setTileSize(1, 1),
  ];


  _TileOnClick(int i){
    switch(i){
      case 0 :
        launch("http://www.sungbo.hs.kr/");
        break;
      case 1 :
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page_lunch()),
        );
        break;
      case 2 :
        showDialog(context: context, builder: (BuildContext context) => errorDialog);
        break;
      case 3 :
        launch("http://www.sungbo.hs.kr/70447/subMenu.do");
        break;
      case 4 :
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostingPage()),
        );
        break;
      case 5 :
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => developer()),
        );
        break;
      case 6 :
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page_bus()),
        );
        break;
      case 7 :

        break;
    }
  }
  Dialog errorDialog;
  @override
  void initState() {
    super.initState();
    errorDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: 150.0,
        width: 200.0,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(30.0),
              child: Text('전화하기', style: TextStyle(color: Colors.red),),
            ),
            Center(
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    FlatButton(onPressed: (){
                      Navigator.pop(context);
                      launch("tel:02-863-3734");
                    }, child: Text('행정실', style: TextStyle(color: Colors.purple, fontSize: 18.0),))
                    ,FlatButton(onPressed: (){
                      Navigator.pop(context);
                      launch("tel:02-862-8409");
                    }, child: Text('대표 전화', style: TextStyle(color: Colors.purple, fontSize: 18.0),)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return
    Scaffold(
      appBar: AppBar(
        title: const Text('Sungbo'),
      ),
      body : Container(
        decoration: new BoxDecoration(color: Colors.white),
        child:
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: new StaggeredGridView.countBuilder(
                crossAxisCount: 3,
                itemCount: tilelist.length,
                staggeredTileBuilder: _getTile,

                itemBuilder: _getChild,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
            )
      )

    );

  }


  StaggeredTile _getTile(int index) {
    return tilelist[index].tile;
  }

  Widget _getChild(BuildContext context, int index) {
    return
    new GestureDetector(
        onTap: () => _TileOnClick(index),
        child: new Container(
        key: new ObjectKey('$index'),
        color: tilelist[index].color,
        child: new Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                    tilelist[index].icon
                ),
                Text(tilelist[index].Title,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white
                    )
                )
              ]
          )
        ),
      )
    );
  }


}


class _TileViewModel {
  Color color;
  IconData icon;
  String Title;
  StaggeredTile tile;
  Function() onClick;

  _TileViewModel setColor(Color color){
    this.color = color;
    return this;
  }
  _TileViewModel setIcon(IconData icon){
    this.icon = icon;
    return this;

  }
  _TileViewModel setTitle(String s){
    this.Title = s;
    return this;

  }
  _TileViewModel setTileSize (int x, int y ){
    tile = new StaggeredTile.count(x,y);

    return this;

  }
  _TileViewModel setOnclick(Function() f){
    onClick = f;
    return this;
  }

}