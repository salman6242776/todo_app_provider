import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/application/screens/widgets/todo_list_item.dart';
import 'package:to_do_app/common/enums/status.dart';
import 'package:to_do_app/providers/todo_provider.dart';

class ToDoListScreen extends StatelessWidget {
  const ToDoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    todoProvider.fetchAllTodos();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo List"),
        ),
        body: Consumer<TodoProvider>(
          builder: (context, todoProvider, child) {
            print("BUILDER");
            switch (todoProvider.status) {
              case Status.loading:
                return const CircularProgressIndicator();
              case Status.noInternet:
                return getCenteredTextAndRetry(
                    todoProvider, "Please check your Internet connection");

              case Status.failed:
                return getCenteredTextAndRetry(
                    todoProvider, "Something went wrong.\nPlease try again.");
              case Status.success:
                return ListView.builder(
                  itemBuilder: ((context, index) => TodoListItem(
                        todoModel: todoProvider.listTodoModel.elementAt(index),
                      )),
                  itemCount: todoProvider.listTodoModel.length,
                );
              case Status.none:
                return const Center(
                  child: Text("Welcome!"),
                );
            }
          },
        ));
  }

  Widget getCenteredTextAndRetry(TodoProvider todoProvider, String text) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                todoProvider.fetchAllTodos();
              },
              child: const Text("Retry"))
        ],
      ),
    );
  }
}
