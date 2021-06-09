import 'package:calculator/app/screens/login/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: LoginForm(),
      ),
    );
  }
}