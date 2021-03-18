import 'package:flutter/material.dart';
import 'package:flutter_app/maintab.dart';

import 'login.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future? future;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createPage(context),
    );
  }

  @override
  initState() {
    super.initState();
    future = Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext nextContext) {
        return LoginPage();
      }));
    });
  }

  Widget _createPage(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double topPadding = screenHeight * 0.3;
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: 32.0),
      child: Stack(
        children: [
          Align(
            child: Image.asset(
              'images/icon_logo_loading.png',
              fit: BoxFit.cover,
            ),
            alignment: Alignment.topCenter,
          ),
          Align(
            child: Text("安保机器人"),
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
    );
  }
}
