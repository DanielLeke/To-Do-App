import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  DialogBox(
      {super.key,
      required this.textcontroller,
      required this.saveAction,
      required this.cancelAction});

  final textcontroller;
  final Function()? saveAction;
  final Function()? cancelAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[400],
      content: Container(
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: saveAction, child: const Text("Save")),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(onPressed: cancelAction, child: const Text("Cancel")),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
