import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<String> getUsename() async {
    var storage = await SharedPreferences.getInstance();
    try {
      return storage.getString('usename') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future setUsename(String username) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString('usename', username);
  }
}
