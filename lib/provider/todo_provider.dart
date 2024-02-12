import 'package:flutter/material.dart';
import 'package:myapp/model/todo.dart';
import 'package:myapp/services/todo_services.dart';

class TodoProvider extends ChangeNotifier {
  final String apiUrl = "https://jsonplaceholder.typicode.com/todos";

  // Create an instance of `TodoService` to interact with the service
  final _service = TodoService();
  bool isLoading = false;
  List<Todo> _todos = [];

  // Define a getter `todos` to access the list of todos
  List<Todo> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;

    // Notify listeners (widgets) that the state has changed
    notifyListeners();

    final response = await _service.getAll();

    _todos = response;
    isLoading = false;

    // Notify listeners (widgets) that the state has changed
    notifyListeners();
  }
}
