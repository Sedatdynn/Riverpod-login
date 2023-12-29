import 'package:dartz/dartz.dart';
import 'package:riverpod_login_project/core/base/exception/app_exception.dart';

typedef BaseServiceModel<T> = Future<Either<ServerException, T>>;
