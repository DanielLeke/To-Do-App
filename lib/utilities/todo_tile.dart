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
    return ListTile(
      leading: Checkbox(value: value, onChanged: onChanged),
      title: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Text(title),
      ),
    );
  }
}
