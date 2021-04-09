import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/utils.dart';

class FirebaseApi {
  static Future<String> createTodo(Todo todo) async {
    final docTodo = FirebaseFirestore.instance.collection('todo').doc();
    todo.id = docTodo.id;
    await docTodo.set(todo.toJson());
    return docTodo.id;
  }
}