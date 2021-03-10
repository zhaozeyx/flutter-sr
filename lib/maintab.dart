import 'package:flutter/material.dart';
import 'package:flutter_app/cruise.dart';
import 'package:flutter_app/profile.dart';
import 'package:flutter_app/video.dart';
import 'package:flutter_app/warning.dart';

class MainTabWidget extends StatefulWidget {
  @override
  _MainTabWidgetState createState() => _MainTabWidgetState();
}

class _MainTabWidgetState extends State<MainTabWidget> {
  int selectedIndex = 0;
  List<Widget> pages = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [_cruiseItem(), _videoItem(), _warningItem(), _profileItem()],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black87,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: pages[selectedIndex],
    );
  }

  @override
  void initState() {
    super.initState();
    pages
      ..add(CruisePage())
      ..add(VideoPage())
      ..add(WarningPage())
      ..add(ProfilePage());
  }

  BottomNavigationBarItem _cruiseItem() {
    return BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("images/main_tab_icon_cruise.png")),
        label: "巡航管理");
  }

  BottomNavigationBarItem _videoItem() {
    return BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("images/main_tab_icon_video.png")),
        label: "视频监控");
  }

  BottomNavigationBarItem _warningItem() {
    return BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("images/main_tab_icon_warning.png")),
        label: "告警管理");
  }

  BottomNavigationBarItem _profileItem() {
    return BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("images/main_tab_icon_profile.png")),
        label: "我的");
  }
}
