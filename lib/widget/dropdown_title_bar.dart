import 'package:flutter/material.dart';

class DropDownTitleBar extends StatefulWidget {

  final void Function(bool unfold)? onClicked;
  final String? title;

  DropDownTitleBar({this.onClicked, this.title});

  @override
  _DropDownTitleBarState createState() => _DropDownTitleBarState(onClicked: onClicked, title:  title);
}

class _DropDownTitleBarState extends State<DropDownTitleBar> {
  void Function(bool unfold)? onClicked;
  bool unfold = false;

  String? title;

  _DropDownTitleBarState({this.onClicked, this.title});

  @override
  void initState() {
    super.initState();
    unfold = false;
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Center(
  //     child: GestureDetector(
  //       child: Row(
  //         children: [
  //           Text("Robot1"),
  //           Icon(unfold
  //               ? Icons.arrow_drop_down_sharp
  //               : Icons.arrow_drop_up_sharp)
  //         ],
  //       ),
  //       onTap: () {
  //         setState(() {
  //           unfold = !unfold;
  //         });
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title == null ? "" : title!,
            style: TextStyle(color: !unfold ? Colors.black87 : Colors.blue),
          ),
          Icon(
            !unfold ? Icons.arrow_drop_down_sharp : Icons.arrow_drop_up_sharp,
            color: !unfold ? Colors.black87 : Colors.blue,
          )
        ],
      ),
      onTap: () {
        setState(() {
          unfold = !unfold;
        });
        onClicked?.call(unfold);
      },
    );
  }
}
