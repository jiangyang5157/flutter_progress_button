import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

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
                '2 seconds delayed task',
                width: 196,
                onProgress: () async {
                  await Future.delayed(const Duration(milliseconds: 2000));
                  return () {
                    print('Take action when animation completed');
                  };
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                'No delay task',
                width: 196,
                onProgress: () {
                  print('Take action here or returns a handler Function');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                'Board radius adapt',
                width: 196,
                borderRadius: 2,
                onProgress: () async {
                  await Future.delayed(const Duration(milliseconds: 2000));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
