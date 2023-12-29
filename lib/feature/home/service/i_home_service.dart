import 'package:dio/dio.dart';
import 'package:riverpod_login_project/feature/home/model/home_model.dart';
import 'package:riverpod_login_project/product/utility/typedef/typedef.dart';

abstract class IHomeService {
  final Dio dio;

  IHomeService(this.dio);

  BaseServiceModel<List<HomeModel>> fetchData();
}
