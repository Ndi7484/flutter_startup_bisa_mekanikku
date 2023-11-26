// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/home_page.dart';
// import 'package:flutter_application_1/pages/login_page.dart';
// import 'package:flutter_application_1/providers/auth_provider.dart';
// import 'package:provider/provider.dart';

// class SplashPage extends StatelessWidget {
//   const SplashPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder(
//           future: authProvider.checkAccessToken(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               if (authProvider.loggedinUser != null) {
//                 WidgetsBinding.instance.addPostFrameCallback((_) {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const HomePage(),
//                     ),
//                   );
//                 });
//               } else {
//                 WidgetsBinding.instance.addPostFrameCallback((_) {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const LoginPage(),
//                     ),
//                   );
//                 });
//               }
//             }
//             return const CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }
