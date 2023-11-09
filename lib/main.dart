import 'package:flutter/material.dart';
import 'package:mekanikku_application/features/login_page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mekanikku App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.indigo,
        accentColor: Colors.indigo[900],
      ).copyWith(secondary: Colors.grey[850])),
      home: const LoginPage(),
    );
  }
}
