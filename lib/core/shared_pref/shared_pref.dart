import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._();

  static SharedPref instance = SharedPref._();

  factory SharedPref() {
    return instance;
  }

  late SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setToken(String token) async {
    await sharedPreferences.setString("token", token);
  }

  String? getToken() {
    return sharedPreferences.getString("token");
  }

  Future<void> removeToken() async {
    await sharedPreferences.remove("token");
  }
}
