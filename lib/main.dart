import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/providers/ads_provider.dart';
import 'package:flutter_mekanikku/providers/auth_provider.dart';
import 'package:flutter_mekanikku/providers/ui_settings_provider.dart';
import 'package:flutter_mekanikku/ui/logo_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
