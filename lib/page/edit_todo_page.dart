import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/widget/todo_form_widget.dart';

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
  void initState() { 
    super.initState();
    
    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('編集'),
    ),
    body: TodoFormWidget(
      title: title,
      description: description,
      onChangedTitle: (title) => setState(() => this.title = title),
      onChangedDescription: (description) => setState(() => this.description = description),
      onSavedTodo: () {},
    ),
  );
}