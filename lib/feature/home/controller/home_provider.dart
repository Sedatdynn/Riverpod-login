import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_login_project/core/base/exception/app_exception.dart';
import 'package:riverpod_login_project/feature/home/model/home_model.dart';
import 'package:riverpod_login_project/feature/home/service/home_service.dart';

final userDataProvider = FutureProvider<Either<ServerException, List<HomeModel>>>((ref) async {
  return ref.watch(userProvider).fetchData();
});
