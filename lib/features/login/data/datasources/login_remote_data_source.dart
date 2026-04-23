import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/features/login/data/models/login_model.dart';

class LoginRemoteDataSource {
  final ApiConsumer api;

  LoginRemoteDataSource({required this.api});

  Future<AuthResultModel> login({
    required String email,
    required String password,
  }) async {
    dynamic response = await api.post(
      EndPoint.login,
      data: {ApiKeys.login: email, ApiKeys.password: password},
      isFromData: true,
    );
    return AuthResultModel.fromJson(response);
  }
}
