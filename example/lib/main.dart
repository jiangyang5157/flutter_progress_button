import 'dart:math' as math show sin, pi;

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
              padding: EdgeInsets.only(left: 0, top: 16, right: 0, bottom: 0.0),
              child: Text('Like normal button:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                defaultWidget: const Text('Button_1'),
                width: 196,
                height: 40,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0, top: 16, right: 0, bottom: 0.0),
              child: Text('Animate button with board adjustment:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                defaultWidget: const Text('height=40'),
                progressWidget: const CircularProgressIndicator(),
                width: 196,
                height: 40,
                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 3000), () => 42);
                  // After [onPressed], it will trigger animation running backwards, from end to beginning
                  return () {
                    // Optional returns is returning a VoidCallback that will be called
                    // after the animation is stopped at the beginning.
                    // A best practice would be to do time-consuming task in [onPressed],
                    // and do page navigation in the returned VoidCallback.
                    // So that user won't missed out the reverse animation.
                  };
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                defaultWidget: const Text('height=48',
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
              child: Text('No animation button:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                defaultWidget: const Text('Button_4',
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
              child: Text('Customized:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: ProgressButton(
                defaultWidget: const Text('borderRadius=h/2',
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
                defaultWidget: const Text('Button_6',
                    style: TextStyle(color: Colors.white)),
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
                defaultWidget:
                    const Icon(Icons.clear, color: Colors.lightGreen),
                progressWidget: const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.lightGreen)),
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

/// following code is a customized widget -- ThreeSizeDot
/// -- for a demonstration of how it looks in [ProgressButton]

class ThreeSizeDot extends StatefulWidget {
  ThreeSizeDot(
      {Key key,
      this.shape = BoxShape.circle,
      this.duration = const Duration(milliseconds: 1000),
      this.size = 8.0,
      this.color_1,
      this.color_2,
      this.color_3,
      this.padding = const EdgeInsets.all(2)})
      : super(key: key);

  final BoxShape shape;
  final Duration duration;
  final double size;
  final Color color_1;
  final Color color_2;
  final Color color_3;
  final EdgeInsetsGeometry padding;

  @override
  _ThreeSizeDotState createState() => _ThreeSizeDotState();
}

class _ThreeSizeDotState extends State<ThreeSizeDot>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation_1;
  Animation<double> animation_2;
  Animation<double> animation_3;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: widget.duration);
    animation_1 = DelayTween(begin: 0.0, end: 1.0, delay: 0.0)
        .animate(animationController);
    animation_2 = DelayTween(begin: 0.0, end: 1.0, delay: 0.2)
        .animate(animationController);
    animation_3 = DelayTween(begin: 0.0, end: 1.0, delay: 0.4)
        .animate(animationController);
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ScaleTransition(
            scale: animation_1,
            child: Padding(
              padding: widget.padding,
              child: Dot(
                shape: widget.shape,
                size: widget.size,
                color:
                    widget.color_1 ?? Theme.of(context).textTheme.body1.color,
              ),
            ),
          ),
          ScaleTransition(
            scale: animation_2,
            child: Padding(
              padding: widget.padding,
              child: Dot(
                shape: widget.shape,
                size: widget.size,
                color:
                    widget.color_2 ?? Theme.of(context).textTheme.body1.color,
              ),
            ),
          ),
          ScaleTransition(
            scale: animation_3,
            child: Padding(
              padding: widget.padding,
              child: Dot(
                shape: widget.shape,
                size: widget.size,
                color:
                    widget.color_3 ?? Theme.of(context).textTheme.body1.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final BoxShape shape;
  final double size;
  final Color color;

  Dot({
    Key key,
    this.shape,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: shape),
      ),
    );
  }
}

class DelayTween extends Tween<double> {
  DelayTween({
    double begin,
    double end,
    this.delay,
  }) : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) =>
      super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
