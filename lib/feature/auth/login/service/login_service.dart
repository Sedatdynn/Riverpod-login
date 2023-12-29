import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_login_project/core/base/exception/app_exception.dart';
import 'package:riverpod_login_project/core/cache/shared_manager.dart';
import 'package:riverpod_login_project/core/network/network_constants.dart';
import 'package:riverpod_login_project/feature/auth/login/model/login_request_model.dart';
import 'package:riverpod_login_project/feature/auth/login/model/token_model.dart';
import 'package:riverpod_login_project/feature/auth/login/service/i_login_service.dart';
import 'package:riverpod_login_project/product/enum/shared_enum.dart';
import 'package:riverpod_login_project/product/utility/typedef/typedef.dart';

class LoginService extends ILoginService {
  LoginService(super.dio);
  @override
  BaseServiceModel<TokenModel> login(LoginRequestModel model) async {
    try {
      final response = await dio.post(NetworkConstants.loginPath, data: model.toJson());
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          final tok = TokenModel.fromJson(jsonBody);
          await SharedManager.instance.setStringValue(SharedKeys.token, tok.token!);
          return Right(tok);
        } else {
          return const Left(ServerException(message: 'Beklenmedik hata!', statusCode: '505'));
        }
      } else {
        return left(ServerException(
            message: response.statusMessage!, statusCode: response.statusCode.toString()));
      }
    } on DioException catch (e) {
      if (e.response?.data['error'] == "user not found") {
        return const Left(ServerException(message: 'Kullanıcı bulunamadı', statusCode: '505'));
      }
      return const Left(ServerException(
          message: 'Email ve şifrenizin doğruluğundan emin olun.', statusCode: '505'));
    }
  }
}
