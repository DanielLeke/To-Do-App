import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoItems = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoItems = [
      ["Code a new app", false],
      ["Do Exercise", false],
    ];
  }

  //load the data from database
  void loadData() {
    toDoItems = _myBox.get("TODOITEMS");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOITEMS", toDoItems);
  }
}
