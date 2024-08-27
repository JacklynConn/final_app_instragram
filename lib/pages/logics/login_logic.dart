import 'package:finalapp/models/user_model.dart';
import 'package:flutter/foundation.dart';

class LoginLogic extends ChangeNotifier {
  late UserModel _longgedInUser;

  UserModel get loggedInUser => _longgedInUser;

  void setLoggedInUser(UserModel userModel) {
    _longgedInUser = userModel;
    notifyListeners();
  }

  String get fullName {
    return _longgedInUser.name;
  }
}
