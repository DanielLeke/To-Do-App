import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_flutter_project/data/database.dart';
import 'package:my_flutter_project/utilities/dialog_box.dart';
import 'package:my_flutter_project/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');

  ToDoDataBase db = ToDoDataBase();
  final _controller = TextEditingController();
  final List<dynamic> objectBuilder = List.filled(2, "");

  @override
  void initState() {
    // if this is the 1st time ever opening the app, then create default data
    if (_myBox.get("TODOITEMS") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Center(
            child: Text(
          "TO DO",
        )),
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
                    textcontroller: _controller,
                    saveAction: () {
                      setState(() {
                        db.toDoItems.add([_controller.text, false]);
                        _controller.clear();
                      });
                      Navigator.of(context).pop();
                      db.updateDataBase();
                    },
                    cancelAction: () {
                      Navigator.of(context).pop();
                    },
                  );
                });
          },
          child: const Icon(Icons.add)),
      body: ListView.builder(
        itemCount: db.toDoItems.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            value: db.toDoItems[index][1],
            onChanged: (context) {
              setState(() {
                db.toDoItems[index][1] = !db.toDoItems[index][1];
                db.updateDataBase();
              });
            },
            title: db.toDoItems[index][0],
            deleteAction: () {
              setState(() {
                db.toDoItems.removeAt(index);
              });
              db.updateDataBase();
            },
          );
        },
      ),
    );
  }
}
