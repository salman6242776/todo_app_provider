class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool isCompleted;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  factory TodoModel.fromJson(Map<String, dynamic> inputJson) {
    return TodoModel(
        userId: inputJson['userId'],
        id: inputJson['id'],
        title: inputJson['title'],
        isCompleted: inputJson['completed']);
  }
}
