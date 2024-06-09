import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController {
  FirebaseFirestore config = FirebaseFirestore.instance;

  void saveAuth(String userId, String fistName, String lastName, String email) {
    config.collection('Users').doc(userId).set({
      'userId': userId,
      'lastName': lastName,
      'fistName': fistName,
      'email': email,
      'theme': ThemeMode.system.toString(),
    });
  }

  Future<String> getAuth(String id) async {
    String name = '';
    await config.collection('Users').doc(id).get().then(
      (value) {
        name = value.data()!['name'];
      },
    );
    return name;
  }

  Future<String> createUserWithEmailAndPassword(email, password) async {
    try {
      final data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      saveAuth(data.user!.uid, 'Guest', 'User', email);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'Mật khẩu quá yếu';
      } else if (e.code == 'email-already-in-use') {
        return 'Email đã được sử dụng';
      }
    } catch (e) {
      return 'Không thể tạo tài khoản';
    }
    return 'Không thể tạo tài khoản';
  }

  Future<String> signInWithEmailAndPassword(email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Không tìm thấy tài khoản';
      } else if (e.code == 'wrong-password') {
        return 'Sai mật khẩu. Vui lòng thử lại';
      }
    } catch (e) {
      debugPrint('Error: $e');
      return 'Đã xảy ra lỗi. Vui lòng thử lại';
    }
    return 'Đã xảy ra lỗi. Vui lòng thử lại';
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

AuthController authController = AuthController();
