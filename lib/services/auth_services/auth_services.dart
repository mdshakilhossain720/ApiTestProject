import 'package:apitest/config/app_constant.dart';
import 'package:apitest/services/auth_provider_base/auth_provider_base.dart';
import 'package:apitest/utils/api_client.dart';
import 'package:dio/src/response.dart';
import 'package:riverpod/riverpod.dart';

class AuthServices implements AuthProviderBase {
  final Ref ref;

  AuthServices(this.ref);


  @override
  Future<Response> login({
    required String phone,
    required String password,
  }) async {
    final response = await ref
        .read(apiClientProvider)
        .post(AppConstant.login, data: {"phone": phone, "password": password});
    return response;
  }
}

final authServiceProvider = Provider((ref) => AuthServices(ref));
