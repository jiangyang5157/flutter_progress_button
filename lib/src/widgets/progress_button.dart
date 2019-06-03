part of flutter_progress_button;

enum ProgressButtonState { Default, Progress }

class ProgressButton extends StatefulWidget {
  final Function onProgress;
  final Color color;
  final Color textColor;
  final String text;
  final double width;
  final double height;
  final double borderRadius;

  ProgressButton(this.text, {
    Key key,
    this.onProgress,
    this.color,
    this.textColor,
    this.width = double.infinity,
    this.height = 48,
    this.borderRadius = 24.0,
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
  Color _textColor;
  double _width;
  double _height;

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
    _textColor = widget.textColor;
    _width = widget.width;
    _height = widget.height;
  }

  @override
  Widget build(BuildContext context) {
    _color = _color ?? Theme
        .of(context)
        .buttonColor;
    _textColor = _textColor ?? Theme
        .of(context)
        .textTheme
        .body1
        .color;

    return PhysicalModel(
      color: Theme
          .of(context)
          .colorScheme
          .primary,
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: Container(
        key: _globalKey,
        height: _height,
        width: _width,
        child: RaisedButton(
          padding: EdgeInsets.all(0.0),
          color: _color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius)),
          child: _buildChildren(context),
          onPressed: () async {
            if (_state != ProgressButtonState.Default) {
              return;
            }

            _forward(() async {
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

  void _forward(Function onStart) {
    double initialWidth = _globalKey.currentContext.size.width;
    _animController = AnimationController(duration: _duration, vsync: this);
    _anim = Tween(begin: 0.0, end: 1.0).animate(_animController)
      ..addListener(() {
        setState(() {
          _width = initialWidth - ((initialWidth - _height) * _anim.value);
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

  Widget _buildChildren(BuildContext context) {
    switch (_state) {
      case ProgressButtonState.Default:
        return Text(widget.text, style: TextStyle(color: _textColor));
        break;
      case ProgressButtonState.Progress:
      default:
        return CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(_textColor),
        );
        break;
    }
  }
}
