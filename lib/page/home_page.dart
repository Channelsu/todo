import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/api/firebase_api.dart';
import 'package:todo/main.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/todos.dart';
import 'package:todo/widget/add_todo_dialog_widget.dart';
import 'package:todo/widget/completed_list_widget.dart';
import 'package:todo/widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list, size: 28),
            title: Text('Todo')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check, size: 28),
            title: Text('完了')
          ),
        ],
      ),
      body: StreamBuilder<List<Todo>>(
        stream: FirebaseApi.readTodos(),
        builder: (context, snapshot) {



          final todos = snapshot.data;
          final provider = Provider.of<TodosProvider>(context);
          provider.setTodos(todos);
          return tabs[selectedIndex];


          
        }
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          child: AddTodoDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}