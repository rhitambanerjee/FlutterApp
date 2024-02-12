class Todo {

  // Define a class `Todo` to represent a todo item
  final int id;
  final int userId;
  final String title;
  final bool completed;
  Todo({

    // Constructor for `Todo` class to initialize its properties
    required this.id,
    required this.title,
    required this.userId,
    required this.completed,
  });
}