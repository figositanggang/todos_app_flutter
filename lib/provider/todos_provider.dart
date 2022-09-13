import 'package:flutter/cupertino.dart';
// import 'package:todo_app/models/todos_model.dart';

class TodosProvider extends ChangeNotifier {
  // List _todos = todos;
  List get getTodos => todos;
  set addTodos(Map val) {
    todos.add(val);
    notifyListeners();
  }
}

List todos = [
  {
    "title": "aw",
    "trailing": "aw",
  },
];
