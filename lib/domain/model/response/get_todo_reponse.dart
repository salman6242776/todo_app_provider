import 'package:to_do_app/domain/model/todo_model.dart';

class GetTodoResponse {
  late List<TodoModel> _listTodoModel;

  List<TodoModel> get listTodoModel => _listTodoModel;

  GetTodoResponse(List<TodoModel> listTodoModel) {
    _listTodoModel = listTodoModel;
  }

  GetTodoResponse.fromJson(List list) {
    _listTodoModel = [];
    for (var element in list) {
      _listTodoModel.add(TodoModel.fromJson(element));
    }
  }
}
