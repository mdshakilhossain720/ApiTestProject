import 'package:dio/dio.dart';

abstract class AuthProviderBase {
  Future<Response> login(String phone, String password);
  
}