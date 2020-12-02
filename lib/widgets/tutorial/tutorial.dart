import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class TutorialPage extends StatefulWidget {
  TutorialPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          _globalKey.currentState.showSnackBar(SnackBar(
            content: Text("スキップ"),
          ));
          Navigator.pop(context);
        },
        finishCallback: () {
          _globalKey.currentState.showSnackBar(SnackBar(
            content: Text("終わる"),
          ));
          Navigator.pop(context);
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: const Color(0xFF0097A7),
        imageAssetPath: 'images/tutorial01.png',
        title: 'Screen 1',
        body: 'なんかの文章01',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF536DFE),
        imageAssetPath: 'images/tutorial02.png',
        title: 'Screen 2',
        body: 'なんかの文章02',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'images/tutorial03.png',
        title: 'Screen 3',
        body: 'なんかの文章03',
        doAnimateImage: true),
    PageModel.withChild(
        child: Padding(
          padding: EdgeInsets.only(bottom: 25.0),
          child: Image.asset('assets/02.png', width: 300.0, height: 300.0),
        ),
        color: const Color(0xFF5886d6),
        doAnimateChild: true)
  ];
}
