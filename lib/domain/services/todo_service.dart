import 'package:http/http.dart' as http;

import '../../common/constants.dart';
import '../../domain/repository/todo_repository.dart';

class TodoService extends TodoRepository {
  @override
  Future<http.Response> getAllTodos() async {
    print("getAllTodos");
    Uri uri = Uri.https(baseUrl, ApiEndpoints.getAllTodos);
    return await http.get(uri);
  }
}
