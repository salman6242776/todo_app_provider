class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> inputJson) {
    return TodoModel(
        userId: inputJson['userId'],
        id: inputJson['id'],
        title: inputJson['title'],
        completed: inputJson['completed']);
  }
}
