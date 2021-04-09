import 'package:flutter/cupertino.dart';
import 'package:todo/utils.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  String id;
  String title;
  String description;
  bool isDone;
  DateTime createdTime;

  // コンストラクタ
  Todo({
    this.id,
    @required this.title,
    this.description = '',
    this.isDone = false,
    @required this.createdTime,
  });

  //
  static Todo fromJson(Map<String, dynamic> json) => Todo(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    isDone: json['isDone'],
    createdTime: Utils.toDateTime(json['createdTime']),
  );

  // json形式へと変換する関数
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'isDone': isDone,
    'createdTime': Utils.fromDateTimeToJson(createdTime),
  };
}