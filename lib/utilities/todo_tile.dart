import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.title,
      required this.deleteAction,
      });

  final value;
  final Function(bool?)? onChanged;
  final title;
  final Function()? deleteAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.deepPurple[400],
        ),
        title: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style: TextStyle(
                decoration: value == true
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
        ),
        trailing:
            IconButton(onPressed: deleteAction, icon: const Icon(Icons.delete)),
      ),
    );
  }
}
