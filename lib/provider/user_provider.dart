import 'package:flutter/cupertino.dart';
import 'package:galve/model/user_login.dart';
import 'package:galve/shared_preferences/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  late UserLogin? _userLogin = null;

  set userLoginSet(UserLogin userLogin) {
    this._userLogin = userLogin;
    notifyListeners();
  }

  void quitUserLogin() {
    _userLogin = null;
    Preferences.removeEmail();
  }

  get objetctUserLogin {
    return _userLogin;
  }

  get userEmail {
    return _userLogin == null ? "" : _userLogin!.getEmail();
  }

  void guardarUsuario() {
    if (_userLogin != null) {
      Preferences.saveemail = userEmail;
    }
  }

  void recuperarUsuario() {
    String? email = Preferences.getEmail();
    if (email != null) {
      userLoginSet = UserLogin(email);
    }
  }
}
