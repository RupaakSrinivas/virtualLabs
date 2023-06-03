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
      title: 'MobLabs',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
      routes: {
        '/physics': (context) => SubjectPage(
              subjectName: 'Physics',
              experiments: [
                Experiment(
                  name: 'Sonometer',
                  embeddedHTML:
                      '<div class="sketchfab-embed-wrapper"> <iframe title="Tektronix 2235 Oscilloscope" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/900b377c11724d8bb9985e6c17d6ebb9/embed?autostart=1&preload=1" height="600px" width="80%"> </iframe></div>',
                ),
                Experiment(
                  name: 'Refractive Index of Liquid',
                  embeddedHTML:
                      '<div class="sketchfab-embed-wrapper"> <iframe title="Bing Search Engine" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" height="600px" width="80%" src="https://www.bing.com"></iframe></div>',
                ),
                Experiment(
                  name: 'Refractive Index of Prism',
                  embeddedHTML: '',
                ),
                Experiment(
                  name: 'Laser Grating',
                  embeddedHTML: '',
                ),
                Experiment(
                  name: 'Electron Diffraction',
                  embeddedHTML: '',
                ),
                Experiment(
                  name: 'Phase and Group Velocities',
                  embeddedHTML: '',
                ),
                Experiment(
                  name: 'Optical Fiber',
                  embeddedHTML: '',
                ),
                Experiment(
                  name: 'Solar Cell',
                  embeddedHTML: '',
                ),
              ],
            ),
        // Define routes for other subjects as well
        '/chemistry': (context) =>
            SubjectPage(subjectName: 'Chemistry', experiments: [
              Experiment(
                name: 'Hardness of Water',
                embeddedHTML: '',
              ),
              Experiment(
                name: 'Colorimeteric estimation of Ni2+',
                embeddedHTML: '',
              ),
              Experiment(
                name: 'Analysis of Iron by Potentiometer',
                embeddedHTML: '',
              ),
              Experiment(
                name: 'Estimation of Sulfate ion in drinking water',
                embeddedHTML: '',
              ),
              Experiment(
                name: 'Preparation of Important Drug',
                embeddedHTML: '',
              ),
              Experiment(
                name: 'Determination of Reaction Rate and Order',
                embeddedHTML: '',
              ),
              Experiment(
                name: 'Preparation of Nanosilica',
                embeddedHTML: '',
              ),
              Experiment(
                name: 'Thermodynamic functions from EMF',
                embeddedHTML: '',
              ),
            ])
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobLabs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose a Subject',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/physics');
                    },
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: Text('Physics')),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/BEEE');
                    },
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: Text('BEEE')),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/chemistry');
                    },
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: Text('Chemistry')),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Mechanical');
                    },
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: Text('Mechanical')),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Architecture');
                    },
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: Text('Architecture')),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/biology');
                    },
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: Text('Biology')),
                    ),
                  ),
                ),
              ],
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
                  builder: (context) => WebViewPage(
                      embeddedHTML: experiments[index].embeddedHTML),
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
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: Uri.dataFromString(
          embeddedHTML,
          mimeType: 'text/html',
          encoding: utf8,
        ).toString(),
        onWebResourceError: (WebResourceError error) {
          print('WebView Error: ${error.description}');
        },
      ),
    );
  }
}
