import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/providers/auth_provider.dart';
import 'package:flutter_mekanikku/ui/login_page.dart';
import 'package:flutter_mekanikku/ui/main_page.dart';
import 'package:provider/provider.dart';

class LogoPage extends StatelessWidget {
  LogoPage({
    Key? key,
    required this.dark_mode,
  }) : super(key: key);
  bool dark_mode;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authProvider.checkAccessToken(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (authProvider.loggedinUser != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ),
                  );
                });
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                });
              }
            }
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    (dark_mode)
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.white,
                    (dark_mode)
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white,
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      (dark_mode)
                          ? 'assets/logo_white.png'
                          : 'assets/logo_blue.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
