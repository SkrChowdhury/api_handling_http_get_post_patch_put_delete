import 'package:api_handling_http_get_post_patch_put_delete/repository/repository.dart';

import '../models/todo.dart';

class TodoController {
  final Repository _repository;

  TodoController(this._repository);

  // get
  Future<List<Todo>> fetchTodoList() async {
    return _repository.getTodoList();
  }
}
