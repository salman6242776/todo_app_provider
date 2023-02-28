import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/presentation/screens/widgets/todo_list_item.dart';
import 'package:to_do_app/common/enums/api_status.dart';
import 'package:to_do_app/presentation/screens/providers/todo_provider.dart';

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
              case ApiStatus.loading:
                return const CircularProgressIndicator();
              case ApiStatus.noInternet:
                return getCenteredTextAndRetry(
                    todoProvider, "Please check your Internet connection");

              case ApiStatus.failed:
                return getCenteredTextAndRetry(
                    todoProvider, "Something went wrong.\nPlease try again.");
              case ApiStatus.success:
                return ListView.builder(
                  itemBuilder: ((context, index) => TodoListItem(
                        todoModel: todoProvider.listTodoModel.elementAt(index),
                      )),
                  itemCount: todoProvider.listTodoModel.length,
                );
              case ApiStatus.none:
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
