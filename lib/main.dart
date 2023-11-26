import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_mekanikku/providers/ads_provider.dart';
import 'package:flutter_mekanikku/providers/auth_provider.dart';
import 'package:flutter_mekanikku/providers/ui_settings_provider.dart';
import 'package:flutter_mekanikku/ui/logo_page.dart';
import 'package:provider/provider.dart';
=======
import 'package:mekanikku_application/features/login_page/login_page.dart';
>>>>>>> 1df6cbb924cb9bb9e147612d7c4ea8f4b5cc71c2

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UiSettingsProvider()..getLocation()),
        ChangeNotifierProvider(create: (context) => AdsProvider()..loadApiAds()),
      ],
      child: MaterialApp(
        title: 'Randumu App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(
                primary: const MaterialColor(
                  0xFF0C0A83,
                  <int, Color>{},
                ),
              )
              .copyWith(
                secondary: const MaterialColor(
                  0xFF313131,
                  <int, Color>{},
                ),
              ),
        ),
        home: LogoPage(dark_mode: true),
      ),
=======
    return MaterialApp(
      title: 'Mekanikku App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.indigo,
        accentColor: Colors.indigo[900],
      ).copyWith(secondary: Colors.grey[850])),
      home: const LoginPage(),
>>>>>>> 1df6cbb924cb9bb9e147612d7c4ea8f4b5cc71c2
    );
  }
}
