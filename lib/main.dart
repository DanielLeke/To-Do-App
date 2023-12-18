import 'package:flutter/material.dart';
import 'package:my_flutter_project/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.yellow,
        primarySwatch: Colors.yellow,
      ),
      home: const HomePage(),
    );
  }
}
