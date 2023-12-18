import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  DialogBox({super.key, required this.textcontroller});

  final textcontroller;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      alignment: Alignment.center,
      child: Dialog(
        child: TextField(
          controller: textcontroller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5)
            )
          ),
        ),
      ),
    );
  }
}
