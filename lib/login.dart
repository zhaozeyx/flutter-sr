import 'package:flutter/material.dart';
import 'package:flutter_app/maintab.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            child: _createHeader(context),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
          ),
          Container(
            child: _createInputArea(),
            margin: EdgeInsets.only(top: 100),
          ),
          Container(
            child: SizedBox(
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MainTabWidget();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("登录"),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45))),
                ),
                margin: EdgeInsets.only(left: 22.5, right: 22.5, top: 40),
              ),
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createHeader(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image(image: AssetImage("images/icon_logo_login.png")),
          Container(
            child: Text(
              "安保机器人管理系统",
              style: TextStyle(color: Colors.black38, fontSize: 20),
            ),
            margin: EdgeInsets.only(top: 16),
          )
        ],
      ),
    );
  }

  Widget _createInputArea() {
    return Center(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: ClearInputWidget(),
              margin: EdgeInsets.only(left: 22.5, right: 22.5),
            ),
            Container(
              child: ClearInputWidget(),
              margin: EdgeInsets.only(left: 22.5, right: 22.5),
            ),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class ClearInputWidget extends StatefulWidget {
  final String? hint;
  final EdgeInsets padding;
  final ValueChanged? onChanged;

  ClearInputWidget({
    Key? key,
    this.hint,
    this.padding = const EdgeInsets.all(0),
    this.onChanged,
  }) : super(key: key);

  @override
  _ClearInputWidgetState createState() => _ClearInputWidgetState();
}

class _ClearInputWidgetState extends State<ClearInputWidget> {
  bool isInputPassword = false;
  bool isInputEmpty = true;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: widget.padding,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: widget.hint,
                      hintStyle: TextStyle(color: Colors.black38),
                      border: InputBorder.none),
                  onChanged: (value) {
                    widget.onChanged?.call(value);
                    setState(() {
                      isInputEmpty = value.isEmpty;
                    });
                  },
                  controller: _textEditingController,
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ),
            ),
            !isInputEmpty
                ? GestureDetector(
                    child: Container(
                      child: Image(
                          image: AssetImage("images/icon_input_clear.png")),
                      margin: EdgeInsets.only(left: 8),
                    ),
                    onTap: () {
                      _textEditingController.clear();
                      setState(() {
                        isInputEmpty = true;
                      });
                    },
                  )
                : Container(),
            isInputPassword
                ? Container(
                    child: Image(
                        image:
                            AssetImage("images/icon_input_hide_password.png")),
                    margin: EdgeInsets.only(left: 8))
                : Container(),
          ],
        ),
        Divider(
          thickness: 1,
          color: Color(0xFFEEEEEE),
        ),
      ],
    );
  }
}
