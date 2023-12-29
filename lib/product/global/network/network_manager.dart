import 'package:dio/dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init() {
    _dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api/'));
  }
  late final Dio _dio;

  Dio get service => _dio;
}
