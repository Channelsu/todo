import 'package:flutter/material.dart';
import 'package:todo/page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Todoアプリ';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primarySwatch: Colors.teal,
      scaffoldBackgroundColor: Color(0xFF6f5ee),
    ),
    home: HomePage(),
  );
}