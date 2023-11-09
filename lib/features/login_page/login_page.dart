import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mekanikku_application/core/providers/helper/auth_helper.dart';
import 'package:mekanikku_application/features/bottom_navigation/bottom_navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthFirebase auth;
  // bool _passwordInvisible = true;
  // bool _runChecker = true;

  @override
  void initState() {
    auth = AuthFirebase();
    auth.getUser().then((value) {
      MaterialPageRoute route;
      if (value != null) {
        route = MaterialPageRoute(
            builder: (context) => const BottomNavigationPage());
        Navigator.pushReplacement(context, route);
      }
    }).catchError((err) => print(err));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary
        ),
      ),
    );
  }
}
