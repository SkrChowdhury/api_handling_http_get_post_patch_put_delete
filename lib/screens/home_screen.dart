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
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return buildBodyContent(snapshot, todoController);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //make post call
          //temp data
          Todo todo = Todo(userId: 3, title: 'sample post', completed: false);
          todoController.postTodo(todo);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  SafeArea buildBodyContent(
      AsyncSnapshot<List<Todo>> snapshot, TodoController todoController) {
    return SafeArea(
      child: ListView.separated(
          itemBuilder: ((context, index) {
            var todo = snapshot.data?[index];
            return Container(
              height: 100.0,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Text('${todo?.id}')),
                  Expanded(flex: 2, child: Text('${todo?.title}')),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //adding InkWell for onTap
                        InkWell(
                            onTap: () {
                              // add method and make a snakbar
                              todoController
                                  .updatePatchCompleted(todo!)
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(milliseconds: 500),
                                    content: Text('$value'),
                                  ),
                                );
                              });
                            },
                            child: buildCallContainer(
                                'patch', Colors.orange.shade100)),
                        InkWell(
                            onTap: () {
                              todoController.updatePutCompleted(todo!);
                            },
                            child: buildCallContainer(
                                'put', Colors.purple.shade100)),
                        InkWell(
                            onTap: () {
                              todoController
                                  .deleteCompleted(todo!)
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(milliseconds: 500),
                                    content: Text('$value'),
                                  ),
                                );
                              });
                            },
                            child: buildCallContainer(
                                'delete', Colors.red.shade100)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 0.5,
              height: 0.5,
            );
          },
          itemCount: snapshot.data?.length ?? 0),
    );
  }

  Container buildCallContainer(String title, Color color) {
    return Container(
      width: 45.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
          child: Text(
        "$title",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      )),
    );
  }
}

//Video 17.42 min
