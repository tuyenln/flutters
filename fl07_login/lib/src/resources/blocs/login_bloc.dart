import 'dart:async';
import 'package:fl07_login/src/resources/validators/validations.dart';

class LoginBloc {

  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  //Short hand function of dart language
  //Stream get _userStream => _userController.stream;
  //Stream get _passStream => _passController.stream;

  Stream getUserStream() {
    return _userController.stream;
  }

  Stream getPassStream() {
    return _passController.stream;
  }

  bool isValidInfo(String username, String password) {
    if(!Validations.isValidUser(username)) {
      _userController.sink.addError("Tài Khoản không hợp lệ");
      return false;
    }

    _userController.sink.add("OK");
    
    if (!Validations.isValidPass(password)) {
      _passController.sink.addError("Mật Khẩu không hợp lệ");
      return false;
    }
    _passController.sink.add("OK");

    return true;
  }

  void dispose(){
    _userController.close();
    _passController.close();
  }
}