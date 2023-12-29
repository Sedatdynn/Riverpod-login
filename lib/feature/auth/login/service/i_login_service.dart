import 'package:dio/dio.dart';
import 'package:riverpod_login_project/feature/auth/login/model/login_request_model.dart';
import 'package:riverpod_login_project/feature/auth/login/model/token_model.dart';
import 'package:riverpod_login_project/product/utility/typedef/typedef.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);

  BaseServiceModel<TokenModel> login(LoginRequestModel model);
}
