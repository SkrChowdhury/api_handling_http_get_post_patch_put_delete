import 'package:api_handling_http_get_post_patch_put_delete/models/todo.dart';
import 'package:api_handling_http_get_post_patch_put_delete/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoRepository implements Repository {
  // use http
  String dataURL = 'https://jsonplaceholder.typicode.com';
  @override
  Future<String> deleteCompleted(Todo todo) {
    // TODO: implement deleteCompleted
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodoList() async {
    List<Todo> todoList = [];
    var url = Uri.parse('$dataURL/todos');
    var response = await http.get(url);
    print('status code: ${response.statusCode}');
    //convert
    var body = json.decode(response.body);
    //parse
    for (var i = 0; i < body.length; i++) {
      todoList.add(Todo.fromJson(body[i]));
    }
    return todoList;
  }

  @override
  Future<String> patchCompleted(Todo todo) {
    // TODO: implement patchCompleted
    throw UnimplementedError();
  }

  @override
  Future<String> postTodo(Todo todo) {
    // TODO: implement postTodo
    throw UnimplementedError();
  }

  @override
  Future<String> putCompleted(Todo todo) {
    // TODO: implement putCompleted
    throw UnimplementedError();
  }
}
