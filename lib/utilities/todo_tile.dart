import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.title});

  final value;
  final Function(bool?)? onChanged;
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.green[200],
        ),
        title: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            title,
            style: TextStyle(
                decoration: value == true
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
