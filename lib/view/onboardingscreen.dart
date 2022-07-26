// import 'dart:async';
//
// import 'package:cellsandcell/constants/color.dart';
// import 'package:cellsandcell/model/slide.dart';
// import 'package:cellsandcell/view/loginscreen.dart';
// import 'package:cellsandcell/widgets/slidedots.dart';
// import 'package:cellsandcell/widgets/slideitems.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class OnBoardingScreen extends StatefulWidget {
//   @override
//   _GettingStartedScreenState createState() => _GettingStartedScreenState();
// }
//
// class _GettingStartedScreenState extends State<OnBoardingScreen> {
//   int _currentPage = 0;
//   final PageController _pageController = PageController(initialPage: 0);
//   @override
//   void initState() {
//     super.initState();
//     Timer.periodic(const Duration(seconds: 2), (Timer timer) {
//       if (_currentPage < 3) {
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//       }
//
//       _pageController.animateToPage(
//         _currentPage,
//         duration: const Duration(milliseconds: 50),
//         curve: Curves.easeIn,
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _pageController.dispose();
//   }
//
//   _onPageChanged(int index) {
//     setState(() {
//       _currentPage = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: Stack(
//                 alignment: AlignmentDirectional.bottomCenter,
//                 children: <Widget>[
//                   PageView.builder(
//                     scrollDirection: Axis.horizontal,
//                     controller: _pageController,
//                     onPageChanged: _onPageChanged,
//                     itemCount: slideList.length,
//                     itemBuilder: (ctx, i) => SlideItem(i),
//                   ),
//                   Stack(
//                     alignment: AlignmentDirectional.topStart,
//                     children: <Widget>[
//                       Container(
//                         margin: const EdgeInsets.only(bottom: 35),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             for (int i = 0; i < slideList.length; i++)
//                               if (i == _currentPage)
//                                 SlideDots(true)
//                               else
//                                 SlideDots(false)
//                           ],
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: purple),
//                   onPressed: () {
//                     Get.offAll(LoginScreen());
//                   },
//                   child: Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(10),
//                       child: const Center(
//                         child: Text(
//                           'Get Started',
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                       ))),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
