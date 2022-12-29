import 'package:http/http.dart';
import 'package:to_do_app/domain/model/todo_model.dart';

abstract class TodoRepository {
  Future<Response> getAllTodos();
}
