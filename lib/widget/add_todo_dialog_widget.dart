import 'package:flutter/material.dart';
import 'package:todo/widget/todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Column(
      // Columnはデフォルトで画面の最大の高さまで広がってしまう
      // 軸方向のサイズを最小に指定すればぴったりサイズになる
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('todoの追加',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
        SizedBox(height: 8,),
        TodoFormWidget(
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) => setState(() => this.description = description),
          onSavedTodo: () {},
        ),
      ],
    ),
  );
}