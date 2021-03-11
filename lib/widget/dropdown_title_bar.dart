import 'package:flutter/material.dart';

class DropDownTitleBar extends StatefulWidget {
  @override
  _DropDownTitleBarState createState() => _DropDownTitleBarState();
}

class _DropDownTitleBarState extends State<DropDownTitleBar> {
  bool unfold = false;

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
            "Robot1",
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
      },
    );
  }
}
