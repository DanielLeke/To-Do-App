import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.deleteAction,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String title;
  final VoidCallback? deleteAction;

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
              decoration: value ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
        ),
        trailing: IconButton(
          onPressed: deleteAction,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
