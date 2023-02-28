import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_do_app/domain/model/todo_model.dart';

class TodoListItem extends StatelessWidget {
  late final TodoModel _todoModel;
  TodoListItem({super.key, required TodoModel todoModel}) {
    _todoModel = todoModel;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(_todoModel.completed
          ? Icons.check_box
          : Icons.check_box_outline_blank),
      title: Text(_todoModel.title),
    );
  }
}
