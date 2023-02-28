import 'package:http/http.dart';

abstract class TodoRepository {
  Future<Response> getAllTodos();
}
