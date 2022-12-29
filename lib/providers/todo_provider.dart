import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:to_do_app/common/constants.dart';
import 'package:to_do_app/common/enums/status.dart';
import 'package:to_do_app/common/utils/network_util.dart';
import 'package:to_do_app/domain/model/response/get_todo_reponse.dart';
import 'package:to_do_app/domain/model/todo_model.dart';
import 'package:to_do_app/domain/services/todo_service.dart';

class TodoProvider extends ChangeNotifier {
  late List<TodoModel> _listTodoModel;
  Status _status = Status.none;

  Status get status => _status;

  List<TodoModel> get listTodoModel => _listTodoModel;

  Future<void> fetchAllTodos() async {
    print("fetchAllTodos");
    NetworkUtil.hasInternetConnection().then((value) {
      if (value) {
        _status = Status.loading;
        TodoService().getAllTodos().then((response) {
          print("Response : ${response.body}");
          if (response.statusCode == ApiStatusCode.success) {
            final todoReponse =
                GetTodoResponse.fromJson(json.decode(response.body));
            print("todoReponse : ${todoReponse.listTodoModel}");
            _listTodoModel = todoReponse.listTodoModel;
            _status = Status.success;
          } else {
            _status = Status.failed;
          }
          notifyListeners();
        });
      } else {
        _status = Status.noInternet;
        notifyListeners();
      }
    });
  }
}
