import 'package:flutter/material.dart';
import 'package:ghulk/screens/auth/login.dart';
import 'package:ghulk/screens/auth/signup.dart';

class AuthScrn extends StatefulWidget {
  AuthScrn({Key? key}) : super(key: key);
  @override
  State<AuthScrn> createState() => _AuthScrnState();
}

class _AuthScrnState extends State<AuthScrn> {
  bool isLogin = true;
  toggle() {
    setState(() => isLogin = !isLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginScreen(toggle: toggle);
    } else {
      return SignUpScreen(toggle: toggle);
    }
  }
}
