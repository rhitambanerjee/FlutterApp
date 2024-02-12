import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/provider/todo_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Add a post-frame callback to fetch todos after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Use Provider to get the TodoProvider and call getAllTodos to fetch todos
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider API'),
      ),

      // Use Consumer to listen for changes in TodoProvider
      body: Consumer<TodoProvider>(
        builder: (context, value, child) {
          // Check if todos are loading
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // Extract todos from TodoProvider
          final todos = value.todos;

          // Build a ListView to display todos
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              // Display todo details in a ListTile
              return ListTile(
                // Display todo ID in CircleAvatar
                leading: CircleAvatar(
                  child: Text(todo.id.toString()),
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    // Set text color based on completion status
                    color: todo.completed ? Colors.grey : Colors.black,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
