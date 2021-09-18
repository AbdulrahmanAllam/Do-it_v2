import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  SharedPreferencesServices._();

  static final SharedPreferencesServices singleton =
      SharedPreferencesServices._();

  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  Future<bool> setInt({required String key, required int value}) async {
    final prefs = await _prefs;
    return prefs.setInt(key, value);
  }

  Future<int?> getInt({required String key}) async {
    final prefs = await _prefs;
    return prefs.getInt(key);
  }

  Future<bool> setString({required String key, required String value}) async {
    final prefs = await _prefs;
    return prefs.setString(key, value);
  }

  Future<String?> getString({required String key}) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  void reload() async {
    final prefs = await _prefs;
    prefs.reload();
  }

  Future<bool> remove({required String key}) async {
    final prefs = await _prefs;
    return prefs.remove(key);
  }

  Future<bool> clear() async {
    final prefs = await _prefs;
    return prefs.clear();
  }
}
