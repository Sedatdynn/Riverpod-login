import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_login_project/core/base/exception/app_exception.dart';
import 'package:riverpod_login_project/core/network/network_constants.dart';
import 'package:riverpod_login_project/feature/home/model/data_model.dart';
import 'package:riverpod_login_project/feature/home/model/home_model.dart';
import 'package:riverpod_login_project/feature/home/service/i_home_service.dart';
import 'package:riverpod_login_project/product/utility/typedef/typedef.dart';

class HomeService extends IHomeService {
  HomeService(super.dio);

  @override
  BaseServiceModel<List<HomeModel>> fetchData() async {
    try {
      final response = await dio.get(NetworkConstants.homePath);
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          List<HomeModel>? results = DataModel.fromJson(jsonBody).data;
          return Right(results!);
        } else {
          return const Left(ServerException(message: 'Hata', statusCode: '606'));
        }
      } else {
        return left(ServerException(
            message: response.statusMessage!, statusCode: response.statusCode.toString()));
      }
    } on DioException catch (e) {
      return Left(ServerException(message: e.message.toString(), statusCode: '505'));
    }
  }
}
