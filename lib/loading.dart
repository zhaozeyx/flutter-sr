import 'package:flutter/material.dart';
import 'package:flutter_app/maintab.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createPage(context),
    );
  }

  Widget _createPage(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return MainTabWidget();
      }));
    });
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
