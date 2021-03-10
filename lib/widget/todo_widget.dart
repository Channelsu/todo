
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  // コンストラクタ
  const TodoWidget({
    @required this.todo,
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Checkbox(
        activeColor: Theme.of(context).primaryColor,
        checkColor: Colors.white,
        value: todo.isDone,
        onChanged: (_) {},
      ),
      SizedBox(height: 20,),
    ],
  );
}