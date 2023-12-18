import 'package:flutter/material.dart';
import 'package:my_flutter_project/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List toDoItems = [
    ["Make a tutorial", false],
    ["Do Exercise", false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("To Do"),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDoItems.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              value: toDoItems[index][1],
              onChanged: (context) {
                setState(() {
                  toDoItems[index][1] = !toDoItems[index][1];
                });
              },
              title: toDoItems[index][0]);
        },
      ),
    );
  }
}
