import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key key, @required this.todo}) : super(key: key);
  
  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  String title;
  String description;

  @override
  Widget build(BuildContext context) => Scaffold(

  );
}