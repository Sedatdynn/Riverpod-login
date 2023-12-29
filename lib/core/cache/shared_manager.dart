import 'package:riverpod_login_project/product/enum/shared_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  SharedManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static final SharedManager _instance = SharedManager._init();

  SharedPreferences? _preferences;
  static SharedManager get instance => _instance;
  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> setStringValue(SharedKeys key, String value) async {
    await _preferences!.setString(key.name, value);
  }

  Future<void> setBoolValue(SharedKeys key, bool value) async {
    await _preferences!.setBool(key.name, value);
  }

  Future<void> setDoubleValue(SharedKeys key, double value) async {
    await _preferences!.setDouble(key.name, value);
  }

  Future<void> removeValue(SharedKeys value) async {
    await _preferences!.remove(value.name);
  }

  String? getStringValue(String key) => _preferences?.getString(key);

  bool? getBoolValue(String key) => _preferences!.getBool(key);

  double? getDoubleValue(String key) => _preferences!.getDouble(key);
}
