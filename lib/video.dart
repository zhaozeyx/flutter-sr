import 'package:flutter/material.dart';
import 'package:flutter_app/video_play.dart';
import 'package:flutter_app/widget/dropdown.dart';
import 'package:flutter_app/widget/dropdown_title_bar.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final GZXDropdownMenuController _dropdownMenuController =
  GZXDropdownMenuController();

  final GlobalKey _stackKey = GlobalKey();

  final List<Robot> robotList = <Robot>[];

  int currentSelectedIndex = 0;

  String headerTitle = "机器人";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: DropDownTitleBar(),
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
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => VideoPlayPage()));
        },
      ),
      onTap: () {
      },
    );
  }

  @override
  void initState() {
    super.initState();
    robotList..add(Robot("1", "Robot1"))..add(Robot("2", "Robot2"))..add(
        Robot("3", "Robot3"));
  }

  Widget _buildDropDownHeader() {
    return GZXDropDownHeader(
      items: [
        GZXDropDownHeaderItem(headerTitle,
            style: TextStyle(color: Colors.green)),
      ],
      controller: _dropdownMenuController,
      stackKey: _stackKey,
      onItemTap: (index) {
        print("YZZ  index");
      },
    );
  }

  Widget _buildDropDownMenu() {
    return GZXDropDownMenu(
      controller: _dropdownMenuController,
      animationMilliseconds: 300,
      // 下拉后遮罩颜色
      maskColor: Colors.red.withOpacity(0.5),
      menus: [
        GZXDropdownMenuBuilder(
          dropDownWidget: _buildDeviceList(),
          dropDownHeight: 80 * robotList.length.toDouble(),
        )
      ],
    );
  }

  Widget _buildDeviceList() {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(robotList[index].name),
            trailing: (currentSelectedIndex == index)
                ? Icon(Icons.check, color: Colors.blue)
                : null,
            onTap: () {
              // _dropdownMenuController.hide();
              setState(() {
                currentSelectedIndex = index;
                headerTitle = robotList[index].name;
              });
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: robotList.length);
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
