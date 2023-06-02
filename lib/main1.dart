// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext content) {
//     return ChangeNotifierProvider(
//       create: (context) => MyAppState(),
//       child: MaterialApp(
//         title: 'MobLab',
//         theme: ThemeData(
//           useMaterial3: true,
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         ),
//         home: MyHomePage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     Widget page;
//     switch (selectedIndex) {
//       case 0:
//         page = MyHomePage();
//         break;
//       case 1:
//         page = Physics_Page();
//         break;
//       case 2:
//         page = BEEE_Page();
//         break;
//       case 3:
//         page = Chemistry_Page();
//         break;
//       case 4:
//         page = Mechanical_Page();
//         break;
//       case 5:
//         page = Engineering_Physics();
//         break;
//       case 6:
//         page = Biology_Page();
//         break;
//       default:
//         throw UnimplementedError('no widget for $selectedIndex');
//     }
//   }
// }