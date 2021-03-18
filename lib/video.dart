import 'package:flutter/material.dart';
import 'package:flutter_app/video_play.dart';
import 'package:flutter_app/widget/dropdown.dart';
import 'package:flutter_app/widget/dropdown_title_bar.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final GlobalKey _stackKey = GlobalKey();

  int currentSelectedIndex = 0;

  String headerTitle = "ROBOT-845";

  bool unfold = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: DropDownTitleBar(
            onClicked: (bool unfold) {
              setState(() {
                this.unfold = unfold;
              });
            },
            title: headerTitle,
          ),
        ),
        body: Stack(
          key: _stackKey,
          children: [
            Flex(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Center(
                        child: _createContent(context),
                      ),
                      unfold
                          ? Expanded(
                              child: Container(
                                child: DropDownList(
                                  onItemSelected: (String value) {
                                    setState(() {
                                      headerTitle = value;
                                      this.unfold = false;
                                    });
                                  },
                                ),
                                decoration:
                                    BoxDecoration(color: Colors.black38),
                              ),
                            )
                          : SizedBox(
                              width: 0,
                              height: 0,
                            )
                    ],
                  ),
                  flex: 1,
                ),
              ],
              direction: Axis.vertical,
            ),
          ],
        ));
  }

  Widget _createContent(BuildContext context) {
    return GestureDetector(
      child: GestureDetector(
        child: Column(
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
        ),
        onTap: () async {
          _showPlayDialog();

        },
      ),
      onTap: () {},
    );
  }

  Future<void> _showPlayDialog() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return Material(
            child: VideoPlayPage(),
            type: MaterialType.transparency,
          );
        });
  }


  void performToPlay() {
    Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (context, _, __) {
          return Material(
            child: VideoPlayPage(),
            type: MaterialType.transparency,
          );
        },
        barrierColor: Colors.transparent,
        opaque: false,
        fullscreenDialog: true));
  }

  @override
  void initState() {
    super.initState();
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

class DropDownList extends StatefulWidget {
  void Function(String value)? onItemSelected;

  DropDownList({this.onItemSelected});

  @override
  _DropDownListState createState() =>
      _DropDownListState(onItemTap: onItemSelected);
}

class _DropDownListState extends State<DropDownList> {
  void Function(String value)? onItemTap;

  _DropDownListState({this.onItemTap});

  List<String> robotList = [];
  int currentSelected = 0;

  @override
  void initState() {
    super.initState();
    robotList..add("ROBOT-845")..add("ROBOT-856");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: robotList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            child: ListTile(
              title: Text(
                robotList[index],
                style: TextStyle(
                    color: index == currentSelected
                        ? Colors.blue
                        : Colors.black87),
              ),
              trailing: index == currentSelected
                  ? Icon(
                      Icons.check,
                      color: Colors.blue,
                    )
                  : null,
              selected: currentSelected == index,
              onTap: () {
                setState(() {
                  currentSelected = index;
                });
                onItemTap?.call(robotList[index]);
              },
            ),
            color: Colors.white,
          ),
          onTap: () {},
        );
      },
    );
  }
}
