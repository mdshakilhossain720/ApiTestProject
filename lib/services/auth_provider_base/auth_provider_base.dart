import 'dart:io';

import 'package:apitest/models/auth_model/user.dart';
import 'package:dio/dio.dart';

import '../../models/auth_model/sign_up.dart';

abstract class AuthProviderBase {
  Future<Response> login({ required String phone,required String password});
  Future<Response> register({required SignUpModel singUpInfo});
  Future<Response> sendOTP({required String phone, required bool isForgot});
  Future<Response> verifyOTP({required String phone, required String otp});

   Future<Response> resetPassword({
    required String password,
    required String confirmPassword,
    required String forgotPasswordToken,
  });
  Future<Response> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  });
  Future<Response> updateProfile({required User userInfo, required File? file});
  Future<Response> logout();

  
}