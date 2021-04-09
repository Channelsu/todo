import 'package:flutter/cupertino.dart';
import 'package:todo/api/firebase_api.dart';
import 'package:todo/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    // Todo(
    //   title: '買い物',
    //   description: '買い物詳細',
    //   createdTime: DateTime.now(),
    // ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted => _todos.where((todo) => todo.isDone == true).toList();

  // 引数に指定されたtodoを_todosリストに追加
  // void addTodo(Todo todo) {
  //   // リストに新規追加のtodo追加
  //   _todos.add(todo);
  //   notifyListeners();
  // }
  void addTodo(Todo todo) => FirebaseApi.createTodo(todo);

  // 引数に指定されたtodoを_todosリストから削除
  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  } 

  // Todoの完了/未完了を切り替える処理（チェックボックス）
  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  } 

  // 引数で受けたtodoを引数で受けたtitleとdescriotionに更新する
  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}