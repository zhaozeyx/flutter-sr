import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class WarningViewModel extends ChangeNotifier {
  final List<AlarmBean> _data = [];

  List<AlarmBean> get data => _data;

  void addItem(AlarmBean bean) {
    _data.add(bean);
    notifyListeners();
  }

  void addItems(List<AlarmBean> beanList) {
    _data.addAll(beanList);
    notifyListeners();
  }

  Future<void> loadList() async {
    List<AlarmBean> list = [];
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
        list.add(AlarmBean.fromJson(item));
      });
      // var list = data.map((e) => AlarmBean.fromJson(e)).toList();
      // // print(list);
      // alarmList.addAll(list);
    }
    addItems(list);
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