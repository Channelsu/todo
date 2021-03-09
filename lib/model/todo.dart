import 'package:flutter/cupertino.dart';

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
}