import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/providers/ads_provider.dart';
import 'package:flutter_mekanikku/providers/auth_provider.dart';
import 'package:flutter_mekanikku/providers/blog_provider.dart';
import 'package:flutter_mekanikku/providers/bookmark_provider.dart';
import 'package:flutter_mekanikku/providers/menu_provider.dart';
import 'package:flutter_mekanikku/providers/ui_settings_provider.dart';
import 'package:flutter_mekanikku/ui/logo_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ja', 'JP')],
      path:
          'assets/translations', // The directory where your JSON or CSV files are stored.
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(
            create: (context) => UiSettingsProvider()..getLocation()),
        ChangeNotifierProvider(
            create: (context) => AdsProvider()..loadApiAds()),
        ChangeNotifierProvider(create: (context) => BookmarkProvider()),
        ChangeNotifierProvider(
            create: (_) => BlogProvider()..loadDrsBlogHtmlRaw()),
        ChangeNotifierProvider(
            create: (_) => MenuProvider()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
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
