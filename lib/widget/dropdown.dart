import 'package:flutter/material.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';

class DropDownWidget extends StatefulWidget {
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  final GZXDropdownMenuController _dropdownMenuController =
      GZXDropdownMenuController();

  final GlobalKey _stackKey = GlobalKey();

  final List<Robot> robotList = <Robot>[];

  int currentSelectedIndex = 0;

  String headerTitle = "机器人";

  @override
  void initState() {
    super.initState();
    robotList
      ..add(Robot("1", "Robot1"))
      ..add(Robot("2", "Robot2"))
      ..add(Robot("3", "Robot3"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        key: _stackKey,
        children: [
          Column(
            children: [_buildDropDownHeader()],
            mainAxisSize: MainAxisSize.max,
          ),
          _buildDropDownMenu()
        ],
      ),
      decoration: BoxDecoration(color: Colors.blue),
    );
  }

  Widget _buildDropDownHeader() {
    return GZXDropDownHeader(
      items: [
        GZXDropDownHeaderItem(headerTitle,
            style: TextStyle(color: Colors.green)),
      ],
      controller: _dropdownMenuController,
      stackKey: _stackKey,
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
          dropDownHeight: 40 * robotList.length.toDouble(),
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

class Robot {
  String id = "";
  String name = "";

  Robot(String id, String name) {
    this.id = id;
    this.name = name;
  }
}
