import 'package:flutter/material.dart';
import 'package:my_flutter_project/utilities/dialog_box.dart';
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
  final TextEditingController mycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("To Do"),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return DialogBox(
                    textcontroller: mycontroller,
                  );
                });
          },
          child: const Icon(Icons.add)),
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
            title: toDoItems[index][0],
            deleteAction: () {
              setState(() {
                toDoItems.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
