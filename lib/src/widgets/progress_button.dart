part of flutter_progress_button;

enum ProgressButtonState { Default, Progress }

class ProgressButton extends StatefulWidget {
  final Function onProgress;
  final Color color;
  final double width;
  final double height;
  final double borderRadius;
  final Widget normalWidget;
  final Widget progressWidget;

  ProgressButton({
    Key key,
    @required this.normalWidget,
    @required this.progressWidget,
    this.onProgress,
    this.color,
    this.width = double.infinity,
    this.height = 48.0,
    this.borderRadius = 2.0,
  }) : super(key: key);

  @override
  _ProgressButtonState createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
  GlobalKey _globalKey = GlobalKey();
  Animation _anim;
  AnimationController _animController;
  Duration _duration = const Duration(milliseconds: 250);
  ProgressButtonState _state;
  Color _color;
  double _width;
  double _height;
  double _borderRadius;

  @override
  dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _reset();
    super.deactivate();
  }

  @override
  void initState() {
    _reset();
    super.initState();
  }

  void _reset() {
    _state = ProgressButtonState.Default;
    _color = widget.color;
    _width = widget.width;
    _height = widget.height;
    _borderRadius = widget.borderRadius;
  }

  @override
  Widget build(BuildContext context) {
    _color = _color ?? Theme.of(context).buttonColor;

    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(_borderRadius),
      child: Container(
        key: _globalKey,
        height: _height,
        width: _width,
        child: RaisedButton(
          padding: EdgeInsets.all(0.0),
          color: _color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_borderRadius)),
          child: _buildChildren(context),
          onPressed: () async {
            if (_state != ProgressButtonState.Default) {
              return;
            }

            _forward(() {
              _state = ProgressButtonState.Progress;
            });

            var onProgressCompleted;
            if (widget.onProgress != null) {
              onProgressCompleted = await widget.onProgress();
            }

            _reverse(() {
              _state = ProgressButtonState.Default;
              if (onProgressCompleted != null &&
                  onProgressCompleted is Function) {
                onProgressCompleted();
              }
            });
          },
        ),
      ),
    );
  }

  Widget _buildChildren(BuildContext context) {
    switch (_state) {
      case ProgressButtonState.Default:
        return widget.normalWidget;
        break;
      case ProgressButtonState.Progress:
      default:
        return widget.progressWidget;
        break;
    }
  }

  void _forward(Function onStart) {
    double initialWidth = _globalKey.currentContext.size.width;
    double initialBorderRadius = widget.borderRadius;
    double targetWidth = _height;
    double targetBorderRadius = _height / 2;

    _animController = AnimationController(duration: _duration, vsync: this);
    _anim = Tween(begin: 0.0, end: 1.0).animate(_animController)
      ..addListener(() {
        setState(() {
          _width = initialWidth - ((initialWidth - targetWidth) * _anim.value);
          _borderRadius = initialBorderRadius -
              ((initialBorderRadius - targetBorderRadius) * _anim.value);
        });
      });
    _animController.forward();

    onStart();
  }

  void _reverse(Function onFinish) {
    _animController.reverse();
    Timer(_duration, () {
      onFinish();
    });
  }
}
