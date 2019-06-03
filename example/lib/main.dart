import 'package:flutter/material.dart';
import 'package:flutter_progress_button/progress_button.dart';

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
                'await 1 second',
                width: 196,
                onProgress: () async {
                  await Future.delayed(const Duration(milliseconds: 1000));
                  return () {
                    print('await 1 second');
                  };
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                'no await',
                width: 196,
                onProgress: () {
                  print('no await');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
