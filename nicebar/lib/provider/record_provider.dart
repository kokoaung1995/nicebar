import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nicebar/main.dart';
import 'package:nicebar/model/record.dart';

class RecordProvider extends ChangeNotifier {
  List<Record> records = [];

  void addRecord(Record record) {
    records.add(record);
    save();
    notifyListeners();
  }

  void removeRecord(Record record) {
    records.remove(record);
    save();
    notifyListeners();
  }

  void save() {
    List<dynamic> json = records.map((e) => e.toJson()).toList();
    String jsonString = jsonEncode(json);
    pref.setString("records", jsonString);
  }

  void load() {
    String jsonString = pref.getString("records") ?? "[]";
    List<dynamic> json = jsonDecode(jsonString);
    records = json.map((e) => Record.fromJson(e as Map<String, dynamic>)).toList();
  }
}
