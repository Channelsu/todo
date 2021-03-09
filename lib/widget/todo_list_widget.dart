import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/todos.dart';
import 'package:todo/widget/todo_widget.dart';


class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TodoWidget(
      todo: Todo(
        title: '買い物',
        createdTime: DateTime.now(),
      ),
    );
  }
}