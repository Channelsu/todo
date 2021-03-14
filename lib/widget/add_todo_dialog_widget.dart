import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/todos.dart';
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
    content: Form(
      key: _formKey,
      child: Column(
        // Columnはデフォルトで画面の最大の高さまで広がってしまう
        // 軸方向のサイズを最小に指定すればぴったりサイズになる
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('todoの追加',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
          SizedBox(height: 12,),
          TodoFormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) => setState(() => this.description = description),
            onSavedTodo: addTodo,
          ),
        ],
      ),
    ),
  );

  // 追加ボタン押下時の処理
  void addTodo() {
    final isValid = _formKey.currentState.validate();

    if(!isValid) {
      return;
    } else {
      // Todoインスタンス作成
      final todo = Todo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );

      // providerのaddTodoメソッド呼び出し
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      // 戻る画面遷移(ダイアログを閉じる)
      Navigator.of(context).pop();
    }
  }
}