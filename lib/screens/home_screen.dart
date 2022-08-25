import 'package:api_handling_http_get_post_patch_put_delete/controllers/todo_controller.dart';
import 'package:api_handling_http_get_post_patch_put_delete/repository/todo_repository.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // dependency injection
    var todoController = TodoController(TodoRepository());
    // //test
    // todoController.fetchTodoList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API'),
      ),
      body: FutureBuilder<List<Todo>>(
        future: todoController.fetchTodoList(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          }
          return ListView.separated(
              itemBuilder: ((context, index) {
                var todo = snapshot.data?[index];
                return Container(
                  height: 100.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text('${todo?.id}')),
                      Expanded(flex: 2, child: Text('${todo?.title}')),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildCallContainer('patch', Colors.orange.shade100),
                            buildCallContainer('put', Colors.purple.shade100),
                            buildCallContainer('delete', Colors.red.shade100),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 0.5,
                  height: 0.5,
                );
              },
              itemCount: snapshot.data?.length ?? 0);
        }),
      ),
    );
  }

  Container buildCallContainer(String title, Color color) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(child: Text("$title")),
    );
  }
}
