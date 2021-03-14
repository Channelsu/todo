import 'package:flutter/cupertino.dart';
import 'package:todo/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      title: '買い物',
      description: '買い物詳細',
      createdTime: DateTime.now(),
    ),
    Todo(
      title: 'スケジュール',
      description: 'スケジュール詳細',
      createdTime: DateTime.now(),
    ),
    Todo(
      title: '勉強する',
      createdTime: DateTime.now(),
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  // 引数に指定されたtodoを_todosリストに追加
  void addTodo(Todo todo) {
    // リストに新規追加のtodo追加
    _todos.add(todo);
    notifyListeners();
  }
}