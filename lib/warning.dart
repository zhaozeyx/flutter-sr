import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_app/viewmodel/warning_view_model.dart';
import 'package:provider/provider.dart';

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
      body: Stack(
        children: [
          ChangeNotifierProvider(
            create: (context) => WarningViewModel(),
            child: WarningListWidget(),
          )
        ],
      ),
    );
  }

  Widget _createStartTime(String time, bool unfold) {
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

class WarningListWidget extends StatefulWidget {
  @override
  _WarningListWidgetState createState() => _WarningListWidgetState();
}

class _WarningListWidgetState extends State<WarningListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WarningViewModel viewModel = Provider.of<WarningViewModel>(context);
    viewModel.loadList();
    print('build $viewModel');
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Image(image: AssetImage("images/icon_alarm_leading.png")),
          title: Text(viewModel.data[index].alarmType == null
              ? ""
              : viewModel.data[index].alarmType!),
          subtitle: Text(viewModel.data[index].robotName == null
              ? ""
              : viewModel.data[index].robotName!),
          trailing: Text(viewModel.data[index].alarmTime == null
              ? ""
              : viewModel.data[index].alarmTime!.toString()),
        );
      },
      itemCount: viewModel.data.length,
    );
  }
}
