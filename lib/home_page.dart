import 'package:flutter/material.dart';
import 'package:to_do_app/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List Todo_List = [];

  void checkChange(int index) {
    setState(() {
      Todo_List[index][1] = !Todo_List[index][1];
    });
  }

  void addNewTask() {
    setState(() {
      Todo_List.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      Todo_List.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 220, 250),
      appBar: AppBar(
        title: Center(
          child: Text("To Do List"),
        ),
        backgroundColor: const Color.fromARGB(255, 55, 99, 175),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: Todo_List.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            title: Todo_List[index][0],
            isCompleted: Todo_List[index][1],
            onChanged: (value) => checkChange(index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 12),
            child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: 'Add a new Task',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white)))),
          )),
          FloatingActionButton(
            onPressed: addNewTask,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
