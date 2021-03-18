import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';

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
        children: [WarningListWidget()],
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
  List<AlarmBean> alarmList = [];

  @override
  void initState() {
    super.initState();
    loadList();
  }

  Future<void> loadList() async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.postUrl(
        Uri.parse("http://221.229.218.22:10812/api/v1/web/alarm/list"));
    String payload =
        "userCode=2020101410414263582&startTime=2019-04-17 00:00:00&endTime=2021-03-17 23:59:59&pageNum=1&pageSize=50";
    request.add(utf8.encode(payload));
    HttpClientResponse response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      var responseJson = await response.transform(utf8.decoder).join();
      var responseObj = jsonDecode(responseJson);
      var data = responseObj["data"];
      data.forEach((item) {
        alarmList.add(AlarmBean.fromJson(item));
      });
      // var list = data.map((e) => AlarmBean.fromJson(e)).toList();
      // // print(list);
      // alarmList.addAll(list);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: alarmList.length,
        itemBuilder: (BuildContext context, int index) {
          print(alarmList.length);
          return ListTile(
            leading: Image(image: AssetImage("images/icon_alarm_leading.png")),
            title: Text(alarmList[index].alarmType == null
                ? ""
                : alarmList[index].alarmType!),
            subtitle: Text(alarmList[index].robotName == null
                ? ""
                : alarmList[index].robotName!),
            trailing: Text(alarmList[index].alarmTime == null
                ? ""
                : alarmList[index].alarmTime!.toString()),
          );
        });
  }
}

class AlarmBean {
  String? alarmId;
  String? robotId;
  String? alarmType;
  String? alarmTypeEn;
  int? alarmTime;
  String? robotName;
  String? url;

  AlarmBean(
      {this.alarmId,
      this.robotId,
      this.alarmType,
      this.alarmTypeEn,
      this.alarmTime,
      this.robotName,
      this.url});

  AlarmBean.fromJson(Map<String, dynamic> json) {
    alarmId = json['alarmId'];
    robotId = json['robotId'];
    alarmType = json['alarmType'];
    alarmTypeEn = json['alarmTypeEn'];
    alarmTime = json['alarmTime'];
    robotName = json['robotName'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alarmId'] = this.alarmId;
    data['robotId'] = this.robotId;
    data['alarmType'] = this.alarmType;
    data['alarmTypeEn'] = this.alarmTypeEn;
    data['alarmTime'] = this.alarmTime;
    data['robotName'] = this.robotName;
    data['url'] = this.url;
    return data;
  }
}
