import 'package:flutter/material.dart';
import 'package:flutter_app/widget/dropdown_title_bar.dart';

class CruisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: DropDownTitleBar(),
      ),
      body: Stack(
        children: [
          Center(
            child: Image.network(
                "http://180.108.46.7:10812/web/mapFiles/20201106/202011063a72f6bf6f8842f9.jpg",
                fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Align(
              child: Stack(
                children: [
                  Align(
                    child: Container(
                      child: Image.asset(
                          "images/icon_btn_fragment_cruise_navigation.png"),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5)),
                      width: 75,
                      height: 75,
                    ),
                    alignment: Alignment.bottomCenter,
                  ),
                  Align(
                    child: Image.asset("images/src_cruise_stop_normal.png"),
                    alignment: Alignment.bottomRight,
                  )
                ],
              ),
              alignment: Alignment.bottomCenter,
            ),
          ),
        ],
      ),
    );
  }
}
