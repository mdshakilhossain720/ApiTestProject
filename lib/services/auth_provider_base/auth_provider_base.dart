import 'package:dio/dio.dart';

abstract class AuthProviderBase {
  Future<Response> login({ required String phone,required String password});
  
}