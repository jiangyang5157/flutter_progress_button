import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:flutter_progress_button_example/three_size_dot.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_progress_button Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                normalWidget: const Text('Normal button'),
                width: 196,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                normalWidget: const Text('Animate button'),
                progressWidget: const CircularProgressIndicator(),
                width: 196,
                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 2000), () => 42);
                  // after returns, it will trigger animation running backwards, from end to beginning
                  return () {
                    // return is a function that will be called after animation is stopped at the beginning
                    // For example do page navigation in here: showScorePage(argument: score);
                  };
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                normalWidget: const Text('No animation button'),
                progressWidget: const CircularProgressIndicator(),
                width: 196,
                animate: false,
                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 2000), () => 42);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                normalWidget: const Text('Customized demo',
                    style: TextStyle(color: Colors.white)),
                progressWidget: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                color: Colors.blueAccent,
                width: 196,
                height: 48,
                borderRadius: 24,
                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 2000), () => 42);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                normalWidget: const Icon(Icons.clear, color: Colors.green),
                progressWidget: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green)),
                color: Colors.black45,
                width: 48,
                height: 48,
                borderRadius: 24,
                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 2000), () => 42);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                normalWidget: const Text('Customized progress widget1'),
                progressWidget: ThreeSizeDot(),
                width: 196,
                height: 48,
                borderRadius: 24,
                animate: false,
                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 2000), () => 42);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
