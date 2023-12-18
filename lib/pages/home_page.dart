import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List toDoItems = [];

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
        itemBuilder: ToDoTile,
      ),
    );
  }
}
