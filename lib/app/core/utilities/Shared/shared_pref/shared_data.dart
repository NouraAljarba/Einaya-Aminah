// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class CasheData {
  static late SharedPreferences prefs;

  static intialise() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setData({required String key, required bool value}) async {
    await prefs.setBool(key, value);
  }

  static bool? getData({required String key}) {
    bool? value = prefs.getBool(key);

    return value;
  }
}
