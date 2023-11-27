// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/login_page.dart';
// import 'package:flutter_application_1/providers/auth_provider.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);
//     final user = authProvider.loggedinUser;

//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Welcome, ${user?.name}'),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(vertical: 20),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     authProvider.logout().then((value) {
//                       Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const LoginPage(),
//                         ),
//                         (route) => false,
//                       );
//                     });
//                   },
//                   child: const Text(
//                     'Logout',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
