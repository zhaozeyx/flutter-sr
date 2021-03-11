import 'package:flutter/material.dart';

// class DropDownContent extends StatelessWidget {
//   int currentSelectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
//
//   Widget _buildDropDownList() {
//     return ListView.separated(
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text(robotList[index].name),
//             trailing: (currentSelectedIndex == index)
//                 ? Icon(Icons.check, color: Colors.blue)
//                 : null,
//             onTap: () {
//               // _dropdownMenuController.hide();
//               setState(() {
//                 currentSelectedIndex = index;
//                 headerTitle = robotList[index].name;
//               });
//             },
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) => Divider(),
//         itemCount: robotList.length);
//   }
// }
