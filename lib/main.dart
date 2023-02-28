import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/common/di/get_it.dart';
import 'package:to_do_app/presentation/screens/providers/todo_provider.dart';
import 'presentation/screens/todo_list_screen.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => TodoProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ToDoListScreen(),
      ),
    );
  }
}
