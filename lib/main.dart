// import 'package:english_words/english_words.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MyAppState(),
//       child: MaterialApp(
//         title: 'Namer App',
//         theme: ThemeData(
//           useMaterial3: true,
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
//         ),
//         home: MyHomePage(),
//       ),
//     );
//   }
// }

// class MyAppState extends ChangeNotifier {
//   var current = WordPair.random();
//   // var pair = appState

//   void getNext() {
//     current = WordPair.random();
//     notifyListeners();
//   }

//   var favorites = <WordPair>[];

//   void toggleFavorite() {
//     if (favorites.contains(current)) {
//       favorites.remove(current);
//     } else {
//       favorites.add(current);
//     }
//     notifyListeners();
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
//     // ignore: unused_local_variable
//     Widget page;
//     switch (selectedIndex) {
//       case 0:
//         page = GeneratorPage();
//         break;
//       case 1:
//         page = FavoritesPage();
//         break;
//       default:
//         throw UnimplementedError('no widget for $selectedIndex');
//     }

//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Scaffold(
//           body: Row(
//             children: [
//               SafeArea(
//                 child: NavigationRail(
//                   extended: constraints.maxWidth >= 600,
//                   destinations: [
//                     NavigationRailDestination(
//                       icon: Icon(Icons.home),
//                       label: Text('Home'),
//                     ),
//                     NavigationRailDestination(
//                       icon: Icon(Icons.favorite),
//                       label: Text('Favorites'),
//                     ),
//                   ],
//                   selectedIndex: selectedIndex,
//                   onDestinationSelected: (value) {
//                     setState(() {
//                       selectedIndex = value;
//                     });
//                   },
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   color: Theme.of(context).colorScheme.primaryContainer,
//                   child: page,
//                 ),
//               ),
//             ],
//           ),
//         );
//       }
//     );
//   }
// }

// class GeneratorPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var pair = appState.current;

//     IconData icon;
//     if (appState.favorites.contains(pair)) {
//       icon = Icons.favorite;
//     } else {
//       icon = Icons.favorite_border;
//     }

//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           BigCard(pair: pair),
//           SizedBox(height: 10),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: () {
//                   appState.toggleFavorite();
//                 },
//                 icon: Icon(icon),
//                 label: Text('Like'),
//               ),
//               SizedBox(width: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   appState.getNext();
//                 },
//                 child: Text('Next'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FavoritesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();

//     if (appState.favorites.isEmpty) {
//       return Center(
//         child: Text('No favorites yet.'),
//       );
//     }

//     return ListView(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: Text('You have '
//               '${appState.favorites.length} favorites:'),
//         ),
//         for (var pair in appState.favorites)
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: Text(pair.asLowerCase),
//           ),
//       ],
//     );
//   }
// }

// class BigCard extends StatelessWidget {
//   const BigCard({
//     super.key,
//     required this.pair,
//   });

//   final WordPair pair;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     final style = theme.textTheme.displayMedium!.copyWith(
//       color: theme.colorScheme.onPrimary,
//     );

//     return Card(
//       color: theme.colorScheme.primary,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Text(pair.asString, style: style),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/physics': (context) => SubjectPage(
              subjectName: 'Physics',
              experiments: [
                Experiment(
                  name: 'Experiment 1',
                  embeddedHTML:
                      '<div class="sketchfab-embed-wrapper"> <iframe title="Tektronix 2235 Oscilloscope" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/900b377c11724d8bb9985e6c17d6ebb9/embed"> </iframe> <p style="font-size: 13px; font-weight: normal; margin: 5px; color: #4A4A4A;"> <a href="https://sketchfab.com/3d-models/tektronix-2235-oscilloscope-900b377c11724d8bb9985e6c17d6ebb9?utm_medium=embed&utm_campaign=share-popup&utm_content=900b377c11724d8bb9985e6c17d6ebb9" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;"> Tektronix 2235 Oscilloscope </a> by <a href="https://sketchfab.com/shrednector?utm_medium=embed&utm_campaign=share-popup&utm_content=900b377c11724d8bb9985e6c17d6ebb9" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;"> shrednector </a> on <a href="https://sketchfab.com?utm_medium=embed&utm_campaign=share-popup&utm_content=900b377c11724d8bb9985e6c17d6ebb9" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;">Sketchfab</a></p></div>',
                ),
                Experiment(
                  name: 'Experiment 2',
                  embeddedHTML:
                      '<div class="sketchfab-embed-wrapper"> ... Your embedded HTML code here ... </div>',
                ),
              ],
            ),
        // Define routes for other subjects as well
      },
    );
  }
}




class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experiment App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose a Subject',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/physics');
              },
              child: Text('Physics'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chemistry');
              },
              child: Text('Chemistry'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/biology');
              },
              child: Text('Biology'),
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectPage extends StatelessWidget {
  final String subjectName;
  final List<Experiment> experiments;

  const SubjectPage({required this.subjectName, required this.experiments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName),
      ),
      body: ListView.builder(
        itemCount: experiments.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(experiments[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(embeddedHTML: experiments[index].embeddedHTML),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class Experiment {
  final String name;
  final String embeddedHTML;

  const Experiment({required this.name, required this.embeddedHTML});
}



class WebViewPage extends StatelessWidget {
  final String embeddedHTML;

  const WebViewPage({required this.embeddedHTML});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experiment'),
      ),
      body: WebView(
        initialUrl: Uri.dataFromString(
          embeddedHTML,
          mimeType: 'text/html',
          encoding: utf8,
        ).toString(),
      ),
    );
  }
}

