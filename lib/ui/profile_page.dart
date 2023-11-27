import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/providers/auth_provider.dart';
import 'package:flutter_mekanikku/ui/login_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.2,
              child: const Icon(Icons.person),
            ),
            const SizedBox(
              height: 16,
            ),
            if (authProv.loggedinUser != null)
              Text('Username : ${authProv.loggedinUser!.username}'),
            if (authProv.loggedinUser != null)
              Text('Nama : ${authProv.loggedinUser!.name}'),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        authProv.logout().then((value) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                            (route) => false,
                          );
                        });
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
