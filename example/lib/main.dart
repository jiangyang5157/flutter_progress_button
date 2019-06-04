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
              padding: EdgeInsets.only(left: 0, top: 16, right: 0, bottom: 0.0),
              child: Text('Normal button:', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                normalWidget: const Text('Button_1'),
                width: 196,
                height: 40,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0, top: 16, right: 0, bottom: 0.0),
              child: Text('Animate button with board adjustment:', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                normalWidget: const Text('height=40'),
                progressWidget: const CircularProgressIndicator(),
                width: 196,
                height: 40,
                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 3000), () => 42);
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
                normalWidget: const Text('height=48',
                    style: TextStyle(color: Colors.white)),
                progressWidget: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                color: Colors.blueAccent,
                width: 196,
                height: 48,
                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 3000), () => 42);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0, top: 16, right: 0, bottom: 0.0),
              child: Text('No animation button:', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                normalWidget: const Text('Button_4',
                    style: TextStyle(color: Colors.white)),
                progressWidget: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                color: Colors.blueAccent,
                width: 196,
                height: 48,
                animate: false,
                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 3000), () => 42);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0, top: 16, right: 0, bottom: 0.0),
              child: Text('Customized:', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                normalWidget: const Text('borderRadius=h/2',
                    style: TextStyle(color: Colors.black)),
                progressWidget: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
                color: Colors.lightGreen,
                width: 196,
                height: 48,
                borderRadius: 24,
                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 3000), () => 42);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                normalWidget: const Text('Button_6', style: TextStyle(color: Colors.white)),
                progressWidget: ThreeSizeDot(),
                color: Colors.black54,
                width: 196,
                height: 48,
                borderRadius: 24,
                animate: false,
                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 3000), () => 42);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                normalWidget: const Icon(Icons.clear, color: Colors.lightGreen),
                progressWidget: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen)),
                color: Colors.black54,
                width: 48,
                height: 48,
                borderRadius: 24,
                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 3000), () => 42);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
