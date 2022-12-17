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
  set fullName(String value) {
    _prefs.setString("fullName", value);
  }

  String get fullName {
    return _prefs.getString("fullName") ?? "";
  }

  set image(String value) {
    _prefs.setString("image", value);
  }

  String get image {
    return _prefs.getString("image") ?? "";
  }

  set phone(String value) {
    _prefs.setString("phone", value);
  }

  String get phone {
    return _prefs.getString("phone") ?? "";
  }

  set token(String value) {
    _prefs.setString("token", value);
  }

  String get token {
    return _prefs.getString("token") ?? "";
  }

  set email(String value) {
    _prefs.setString("email", value);
  }

  String get email {
    return _prefs.getString("email") ?? "";
  }
}
