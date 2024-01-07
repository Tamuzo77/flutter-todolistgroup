import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolistgroup/core/data/dio_instance.dart';
import 'package:todolistgroup/models/authenticated_user.dart';

class UserService {
  Dio api = configureDio();
  Future<AuthenticatedUser> login(Map<String, dynamic> data) async {
    final response = await api.post('authentication', data: data);

    return AuthenticatedUser.fromJson(response.data);
  }

  Future<User> signUp(Map<String, dynamic> data) async {
    final response = await api.post('users', data: data);
    return User.fromJson(response.data);
  }

  static Future<bool> checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (prefs.getStringList('authUser') != null &&
            prefs.getString('authToken') != null ) {
      return true;
    }
    return false;
  }

  static Future<bool> logOut() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return Future.value(true);
  }
}
