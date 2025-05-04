import 'package:dio/dio.dart';

import '../../models/auth_model/sign_up.dart';

abstract class AuthProviderBase {
  Future<Response> login({ required String phone,required String password});
  Future<Response> register({required SignUpModel singUpInfo});

  
}