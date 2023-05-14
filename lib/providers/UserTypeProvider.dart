import 'package:flutter/material.dart';
import 'package:cms_final_final/models/userType.dart';

class UserTypeProvider extends ChangeNotifier {
  late UserType _userType;

  UserType get userType => _userType;

  set userType(UserType value) {
    _userType = value;
    notifyListeners();
  }
}