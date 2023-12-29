import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_login_project/core/cache/shared_manager.dart';

@immutable
final class AppInitialize {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedManager.preferencesInit();
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }
}
