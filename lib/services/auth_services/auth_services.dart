import 'dart:io';

import 'package:apitest/config/app_constant.dart';
import 'package:apitest/models/auth_model/sign_up.dart';
import 'package:apitest/models/auth_model/user.dart';
import 'package:apitest/services/auth_provider_base/auth_provider_base.dart';
import 'package:apitest/utils/api_client.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:riverpod/riverpod.dart';

class AuthServices implements AuthProviderBase {
  final Ref ref;

  AuthServices(this.ref);

  // login

  @override
  Future<Response> login({
    required String phone,
    required String password,
  }) async {
    final response = await ref
        .read(apiClientProvider)
        .post(AppConstants.loginUrl, data: {"phone": phone, "password": password});
    return response;
  }

  // regestion
  @override
  Future<Response> register({required SignUpModel singUpInfo}) async {
    //final fcmToken = await ref.read(apiClientProvider).getFcmToken();
    final response = await ref
        .read(apiClientProvider)
        .post(AppConstants.registrationUrl,
          data: {
        ...singUpInfo.toMap(),
        //'device_key': fcmToken,
        'device_type': Platform.isIOS ? 'ios' : 'android',
      },
        
        );
    return response;
  }

  // forget password
  @override
  Future<Response> sendOTP({
    required String phone,
    required bool isForgot,
  }) async {
    final response = await ref
        .read(apiClientProvider)
        .post(
          AppConstants .sendOTP,
          data: {"phone": phone, "forgot_password ": isForgot == true ? 1 : 0},
        );
    return response;
  }
// verify otp
  @override
  Future<Response> verifyOTP({required String phone, required String otp}) {
    final response = ref
        .read(apiClientProvider)
        .post(AppConstants.verifyOtp, data: {"phone": phone, "otp": otp});
    return response;
  }

// change password
  @override
  Future<Response> changePassword({required String oldPassword, required String newPassword, required String confirmNewPassword}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
 // logout
  @override
  Future<Response> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

// reset password
  @override
  Future<Response> resetPassword({required String password, required String confirmPassword, required String forgotPasswordToken}) async {
    final response = await ref.read(apiClientProvider).post(
      AppConstants .resetPassword,
      data: {
        "password": password,
        "password_confirmation": confirmPassword,
        "token": forgotPasswordToken,
      },
    );
    return response;
  }
// update profile
  @override
   Future<Response> updateProfile(
      {required User userInfo, required File? file}) async {
    FormData formData = FormData.fromMap({
      "profile_photo": file != null
          ? await MultipartFile.fromFile(file.path,
              filename: 'profile_photo.jpg')
          : null,
      ...userInfo.toMap(),
    });
    final response = await ref
        .read(apiClientProvider)
        .post(AppConstants.updateProfile, data: formData);
    return response;
  }
}

final authServiceProvider = Provider((ref) => AuthServices(ref));
