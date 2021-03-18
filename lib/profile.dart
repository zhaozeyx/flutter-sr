import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final _menuTextStyle = TextStyle(color: Colors.black87, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _createInfoWidget(),
          SizedBox(
            height: 24,
          ),
          _createMenu(context, "联系客服", Icons.contact_support_outlined),
          _createPaddingDivider(),
          _createMenu(context, "设置", Icons.settings),
          SizedBox(
            height: 24,
          ),
          TextButton(
              onPressed: () {
                _showQuitDialog(context);
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

  Future<bool?> _showQuitDialog(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("确认退出"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("取消")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("确认")),
            ],
          );
        });
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

  Widget _createMenu(BuildContext context, String label, IconData iconData) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        child: Padding(
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
        ),
      ),
      onTap: () async {
        showModalBottomSheet<bool>(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      child: Text("联系客服12345677"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.white),
                    margin: EdgeInsets.only(left: 16,right: 16),
                  ),
                  SizedBox.fromSize(
                    size: Size.fromHeight(8),
                  ),
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      child: Text("取消"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: Colors.white),
                    margin: EdgeInsets.only(left: 16,right: 16,bottom: 8),
                  ),
                ],
              );
            });
      },
    );
  }

  Widget _createPaddingDivider() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Divider(),
    );
  }
}
