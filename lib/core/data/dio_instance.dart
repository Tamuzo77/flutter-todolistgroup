import 'package:dio/dio.dart';

Dio configureDio(){
  final options = BaseOptions(
    baseUrl: "http://172.17.0.1:3030/",
    connectTimeout: Duration(seconds: 30),
    receiveTimeout: Duration(seconds:30)
  );

  final dio = Dio(options);

  return dio;
}