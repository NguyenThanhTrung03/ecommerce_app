import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class LoginRegisterController {
  void register(context, email, password, confirmPassword) async {
    String status = '';
    status = checkValidate(email, password, confirmPassword: confirmPassword);
    if (status == 'Success') {
      status =
          await authController.createUserWithEmailAndPassword(email, password);
    }
    if (status == 'Success') {
      return;
    } else {
      dialog(context, status);
    }
  }

  void signInWithEmailAndPassword(context, email, password) async {
    String status = '';
    status = checkValidate(email, password, confirmPassword: null);
    if (status == 'Success') {
      status = await authController.signInWithEmailAndPassword(email, password);
    }
    if (status == 'Success') {
      return;
    } else {
      dialog(context, status);
    }
  }

  bool checkComfirmPassword(password, confirmPassword) {
    return password == confirmPassword;
  }

  String checkValidate(email, password, {confirmPassword}) {
    if (email.isEmpty) {
      return 'Vui lòng nhập tên email';
    }
    if (!checkRegexEmail(email)) {
      return 'Email không hợp lệ';
    }
    if (password.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (confirmPassword != null) {
      if (password.length < 8) {
        return 'Mật khẩu phải lớn hơn 8 ký tự';
      }
      if (!checkFormatPassword(password)) {
        return 'Mật khẩu phải chứa ít nhất 1 kí tự đặc biệt, chữ cái viết hoa và số';
      }
      if (confirmPassword.isEmpty) {
        return 'Vui lòng nhập lại mật khẩu';
      }
      if (!checkComfirmPassword(password, confirmPassword)) {
        return 'Mật khẩu không khớp';
      }
    }

    return 'Success';
  }

  bool checkRegexEmail(String email) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  bool checkFormatPassword(String password) {
    String pattern = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  void signOut() {
    authController.signOut();
  }

  void dialog(context, status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          // title: const Text('Lỗi'),
          content: Text(status),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
        );
      },
    );
  }
}

LoginRegisterController loginRegisterController = LoginRegisterController();
