import 'package:api_handling_http_get_post_patch_put_delete/models/todo.dart';
import 'repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoRepository implements Repository {
  // use http
  String dataURL = 'https://jsonplaceholder.typicode.com';

  @override
  Future<String> deleteCompleted(Todo todo) async {
    // TODO: implement deleteCompleted
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      //temp
      return result = 'true';
    });
    return result;
  }

//get example
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

//patch example
//patch -> modify passed variables only
  @override
  Future<String> patchCompleted(Todo todo) async {
    // TODO: implement patchCompleted
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    //call back data
    String resData = '';
    //bool? -> String
    await http.patch(
      url,
      body: {
        'completed': (!todo.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      //homeScreen -> data
      Map<String, dynamic> result = json.decode(response.body);
      // print(result);
      return resData = result['completed'];
    });
    return resData;
  }

//Modify passed variables onlyand treat other variables NULL or Default
  @override
  Future<String> putCompleted(Todo todo) async {
    // TODO: implement putCompleted
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    //call back data
    String resData = '';
    //bool? -> String
    await http.put(
      url,
      body: {
        'completed': (!todo.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      //homeScreen -> data
      Map<String, dynamic> result = json.decode(response.body);
      print(result);
      return resData = result['completed'];
    });
    return resData;
  }

  @override
  Future<String> postTodo(Todo todo) async {
    // TODO: implement postTodo
    print('${todo.toJson()}');
    var url = Uri.parse('$dataURL/todos/');
    var result = '';
    var response = await http.post(url, body: todo.toJson());

    print(response.statusCode);
    print(response.body);

    return result;
  }
}
