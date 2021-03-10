import 'package:flutter/material.dart';
import 'package:flutter_app/widget/dropdown.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("视频"),),
      body: Center(
        child: Column(
          children: [
            DropDownWidget(),
            Expanded(
              child: _createContent(context),
              flex: 1,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
        ),
      ),
    );
  }

  Widget _createContent(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage("images/btn_video_fragment_play.png"),
        ),
        Text(
          "点击播放",
          style: TextStyle(fontSize: 36.0, color: Colors.black26),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}

class TitleBar extends StatelessWidget {
  final TextStyle dropDownTextStyle =
      TextStyle(color: Colors.black87, fontSize: 22.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
          child: Text(
            "视频",
            style: TextStyle(color: Colors.black87, fontSize: 24.0),
          ),
        ),
        height: 56.0,
        width: double.infinity,
        decoration: BoxDecoration(shape: BoxShape.rectangle),
      ),
      top: true,
    );
  }
}
