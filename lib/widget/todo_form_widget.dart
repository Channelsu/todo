import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  // コンストラクタ
  const TodoFormWidget({
    Key key,
    this.title = '',
    this.description = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onSavedTodo,
  });


  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildButton(),
      ],
    ),
  );

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: RaisedButton(
      color: Colors.black,
      textColor: Colors.white,
      onPressed: onSavedTodo,
      child: Text('追加'),
    ),
  );

}