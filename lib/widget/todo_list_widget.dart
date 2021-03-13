import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/todos.dart';
import 'package:todo/widget/todo_widget.dart';


class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoWidget(todo: todo,);
      },
    );
  }
}