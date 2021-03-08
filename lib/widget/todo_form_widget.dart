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
        buildTitle(),
        buildButton(),
      ],
    ),
  );


  // タイトル入力欄UIを作成するメソッド
  Widget buildTitle() => TextFormField(
    maxLines: 1,
    initialValue: title,
    onChanged: onChangedTitle,
    validator: (title) {
      if(title.isEmpty) {
        return '必須入力です';
      }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'タイトル',

    ),
  );

  // ボタンUIを作成するメソッド
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