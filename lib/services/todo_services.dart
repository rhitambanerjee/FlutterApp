import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/model/todo.dart';

class TodoService {
  // This method retrieves all todos from the API
  Future<List<Todo>> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    // Check if the response status code is 200 (OK)
    if (response.statusCode == 200) {
      // Decode the response body from JSON format to a List<dynamic>
      final json = jsonDecode(response.body) as List;

      // Map each JSON object to a Todo object and convert the list to a List<Todo>
      final todos = json.map((e) {
        return Todo(
          id: e['id'],
          title: e['title'],
          userId: e['userId'],
          completed: e['completed'],
        );
      }).toList();
      return todos;
    }

    // If the response status code is not 200, return an empty list
    return [];
    // throw "Something went wrong";
  }
}
