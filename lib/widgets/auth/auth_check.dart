// lib/widgets/auth/auth_check.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../screens/home_screen.dart';
// import '../../screens/splash_screen.dart';
import '../../screens/auth_screen.dart';

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot) {
        if (userSnapshot.hasData) {
          // 認証ずみ
          return HomeScreen();
        } else {
          // 認証画面へ変更
          return AuthScreen();
        }
      },
    );
  }
}
