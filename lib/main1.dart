// import 'package:flutter/material.dart';

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Scaffold(
//           body: Row(
//             children: [
//               SafeArea(
//                 child: NavigationBar(),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class NavigationBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60, // Adjust the height as needed
//       color: Colors.blue, // Customize the background color
//       child: Row(
//         children: [
//           // Replace with your navigation items
//           NavigationItem(text: 'Home'),
//           NavigationItem(text: 'About'),
//           NavigationItem(text: 'Services'),
//           NavigationItem(text: 'Contact'),
//         ],
//       ),
//     );
//   }
// }

// class NavigationItem extends StatelessWidget {
//   final String text;

//   const NavigationItem({required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: Text(
//         text,
//         style: TextStyle(
//           color: Colors.white, // Customize the text color
//           fontSize: 18, // Customize the font size
//         ),
//       ),
//     );
//   }
// }
