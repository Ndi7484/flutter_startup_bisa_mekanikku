// import 'package:flutter/material.dart';
// import 'package:flutter_mekanikku/ui/main_page/widgets/main_page_appbar.dart';
// import 'package:flutter_mekanikku/ui/main_page/widgets/main_page_body.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   ScrollController scrollController = ScrollController();
//   double offset = 0.0;
//   // bool dark_mode = true;
//   @override
//   void initState() {
//     super.initState();
//     scrollController.addListener(_scrollListener);
//   }

//   // Define a method to handle scroll events
//   void _scrollListener() {
//     setState(() {
//       offset = scrollController.offset;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       extendBody: true,
//       appBar: MainPageAppbar(
//         offset: offset,
//       ),
//       body: MainPageBody(
//         offset: offset,
//         scrollController: scrollController,
//       ),
//     );
//   }
// }
