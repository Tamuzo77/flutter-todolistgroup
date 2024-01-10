
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolistgroup/core/config.dart';
import 'package:todolistgroup/core/data/dio_instance.dart';
import 'package:todolistgroup/models/todo.dart';
import 'package:http/http.dart' as http;

class ToDoService {

  static Dio api = configureDio();


  static Future<List> getAllTodos() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String token = prefs.getString("authToken") ?? "";

    if(token != ""){
      api.options.headers['AUTHORIZATION'] = 'Bearer $token';
    }
    final response = await api.get("${Config.apiUrl}/todos");

    var dataList = await response.data;
    return (dataList as List).map((e) => Todo.fromJson(e)).toList();
    
  }



  static Future<Todo>getTodo({required String id}) async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String token = prefs.getString("authToken") ?? "";

    if(token != ""){
      api.options.headers['AUTHORIZATION'] = 'Bearer $token';
    }
    final response = await api.get("${Config.apiUrl}/todos/$id");

    return Todo.fromJson(response.data);
  }

  static Future<List<Todo>> getAllTodosByPriority({required String priority}) async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String token = prefs.getString("authToken") ?? "";

    if(token != ""){
      api.options.headers['AUTHORIZATION'] = 'Bearer $token';
    }
    final response = await api.get("${Config.apiUrl}/todos?priority=$priority");

    return (response.data as List).map((e) => Todo.fromJson(e)).toList();
  }

  /*static Future<List<Todo>> getAllTodosAccordingDeadline(){

  }*/



  static Future<Todo> createTodo({required Map<String, dynamic> data}) async{

    SharedPreferences prefs= await SharedPreferences.getInstance();
    String token = prefs.getString("authToken") ?? "";

    if(token != ""){
      api.options.headers['AUTHORIZATION'] = 'Bearer $token';
    }

    final response = await api.post("${Config.apiUrl}/todos", data: data);

    return Todo.fromJson(response.data);

  }


  static Future<Todo> updateTodo({required String id, required Map<String, dynamic>data}) async{

    final response = await api.patch("${Config.apiUrl}/todos/$id", data: data);

    return Todo.fromJson(response.data);
  }




}