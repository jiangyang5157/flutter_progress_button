import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button_example/dot.dart';

class ThreeBounceDot extends StatefulWidget {
  ThreeBounceDot(
      {Key key,
      this.shape = BoxShape.circle,
      this.duration = const Duration(milliseconds: 1000),
      this.size = 16.0,
      this.color_1 = Colors.red,
      this.color_2 = Colors.green,
      this.color_3 = Colors.blue,
      this.padding = const EdgeInsets.all(4),
      this.bounce = -48.0})
      : super(key: key);

  final BoxShape shape;
  final Duration duration;
  final double size;
  final Color color_1;
  final Color color_2;
  final Color color_3;
  final EdgeInsetsGeometry padding;
  final double bounce;

  @override
  _ThreeBounceDotState createState() => _ThreeBounceDotState();
}

class _ThreeBounceDotState extends State<ThreeBounceDot>
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
    animation_1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.8, curve: Curves.ease),
      ),
    );
    animation_2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.1, 0.9, curve: Curves.ease),
      ),
    );
    animation_3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.2, 1.0, curve: Curves.ease),
      ),
    );

    animationController.addListener(() {
      setState(() => {});
    });

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
          Transform.translate(
            offset: Offset(
              0.0,
              widget.bounce *
                  (animation_1.value <= 0.5
                      ? animation_1.value
                      : 1.0 - animation_1.value),
            ),
            child: Padding(
              padding: widget.padding,
              child: Dot(
                shape: widget.shape,
                size: widget.size,
                color: widget.color_1,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(
              0.0,
              widget.bounce *
                  (animation_2.value <= 0.5
                      ? animation_2.value
                      : 1.0 - animation_2.value),
            ),
            child: Padding(
              padding: widget.padding,
              child: Dot(
                shape: widget.shape,
                size: widget.size,
                color: widget.color_2,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(
              0.0,
              widget.bounce *
                  (animation_3.value <= 0.5
                      ? animation_3.value
                      : 1.0 - animation_3.value),
            ),
            child: Padding(
              padding: widget.padding,
              child: Dot(
                shape: widget.shape,
                size: widget.size,
                color: widget.color_3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
