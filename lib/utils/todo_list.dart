import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
      super.key,
      required this.title,
      required this.isCompleted,
      this.onChanged,
      required this.deleteTask});

  final String title;
  final bool isCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: StretchMotion(), 
          children: [
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(15),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 55, 99, 175),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: onChanged,
                checkColor: Colors.black,
                activeColor: Colors.white,
                side: BorderSide(color: Colors.white),
              ),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
