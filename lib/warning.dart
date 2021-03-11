import 'package:flutter/material.dart';

class WarningPage extends StatefulWidget {
  @override
  _WarningPageState createState() => _WarningPageState();
}

class _WarningPageState extends State<WarningPage> {

  bool startUnfold = false;
  bool endUnfold = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            _createStartTime("2020-12-21", startUnfold),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "至",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ),
            _createEndTime("2020-12-21", endUnfold),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }

  Widget _createStartTime(String time , bool unfold) {
    return _createTimePickerWidget(time, unfold);
  }

  Widget _createEndTime(String time, bool unfold) {
    return _createTimePickerWidget(time, unfold);
  }

  Widget _createTimePickerWidget(String time, bool unfold) {
    TextStyle textStyle =
        TextStyle(color: unfold ? Colors.blue : Colors.black54, fontSize: 14);
    return GestureDetector(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(time, style: textStyle),
              Icon(
                unfold ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: unfold ? Colors.blue : Colors.black54,
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: unfold ? Colors.blue : Colors.black54)),
      ),
      onTap: () {
        setState(() {
          unfold = !unfold;
        });
      },
    );
  }
}
