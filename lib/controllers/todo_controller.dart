import 'package:api_handling_http_get_post_patch_put_delete/repository/repository.dart';

import '../models/todo.dart';

class TodoController {
  final Repository _repository;

  TodoController(this._repository);

  // get
  Future<List<Todo>> fetchTodoList() async {
    return _repository.getTodoList();
  }

  //patch
  Future<String> updatePatchCompleted(Todo todo) async {
    return _repository.patchCompleted(todo);
  }

  //put
  Future<String> updatePutCompleted(Todo todo) async {
    return _repository.putCompleted(todo);
  }

  //delete
  Future<String> deleteCompleted(Todo todo) async {
    return _repository.deleteCompleted(todo);
  }

  //post
  Future<String> postTodo(Todo todo) async {
    return _repository.postTodo(todo);
  }

}
