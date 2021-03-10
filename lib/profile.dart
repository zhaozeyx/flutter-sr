import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final _menuTextStyle =
      TextStyle(color: Colors.black87, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _createInfoWidget(),
          SizedBox(
            height: 24,
          ),
          _createMenu("联系客服", Icons.contact_support_outlined),
          _createPaddingDivider(),
          _createMenu("设置", Icons.settings),
          SizedBox(
            height: 24,
          ),
          TextButton(
              onPressed: () {
              },
              child: Text(
                "退出",
                style: TextStyle(color: Colors.black87, fontSize: 18.0),
              )),
          SizedBox(
            height: 16,
          ),
          _createPaddingDivider()
        ],
      ),
    );
  }

  Widget _createInfoWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 48, left: 16.0, right: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "12345678901",
              style: TextStyle(color: Colors.black87, fontSize: 25),
            ),
            flex: 1,
          ),
          Image(image: AssetImage("images/src_avatar_default.png"))
        ],
      ),
    );
  }

  Widget _createMenu(String label, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(iconData),
          Container(
            child: Text(
              label,
              style: _menuTextStyle,
            ),
            margin: EdgeInsets.only(left: 8),
          )
        ],
      ),
    );
  }

  Widget _createPaddingDivider() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Divider(),
    );
  }
}
