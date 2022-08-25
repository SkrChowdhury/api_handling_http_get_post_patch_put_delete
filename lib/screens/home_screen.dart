import 'package:api_handling_http_get_post_patch_put_delete/controllers/todo_controller.dart';
import 'package:api_handling_http_get_post_patch_put_delete/repository/todo_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // dependency injection
    var todoController = TodoController(TodoRepository());
    //test
    todoController.fetchTodoList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API'),
      ),
      body: Container(),
    );
  }
}
