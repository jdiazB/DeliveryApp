import 'package:shared_preferences/shared_preferences.dart';

class SPGlobal {
  static final SPGlobal _instance = SPGlobal._();
  SPGlobal._();
  factory SPGlobal() {
    return _instance;
  }
  late SharedPreferences _prefs;
  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set pickup(String value) {
    _prefs.setString("pickup", value);
  }

  String get pickup {
    return _prefs.getString("pickup") ?? "";
  }

  set delivery(String value) {
    _prefs.setString("delivery", value);
  }

  String get delivery {
    return _prefs.getString("delivery") ?? "";
  }
}
