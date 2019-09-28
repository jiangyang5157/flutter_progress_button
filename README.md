# flutter_progress_button

![GitHub repo size](https://img.shields.io/github/repo-size/jiangyang5157/flutter_progress_button.svg)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/jiangyang5157/flutter_progress_button.svg)
![GitHub top language](https://img.shields.io/github/languages/top/jiangyang5157/flutter_progress_button.svg)
[![GitHub issues](https://img.shields.io/github/issues/jiangyang5157/flutter_progress_button.svg)](https://github.com/jiangyang5157/flutter_progress_button/issues)
[![GitHub license](https://img.shields.io/github/license/jiangyang5157/flutter_progress_button.svg)](https://github.com/jiangyang5157/flutter_progress_button/blob/master/LICENSE)

**flutter_progress_button** is a free and open source (MIT license) Material Flutter Button that supports variety of buttons style demands. It is designed to be easy to use and customizable.

<img src="https://github.com/jiangyang5157/flutter_progress_button/blob/master/example/assets/example_20190616.gif" width="600">

## Get started

### **Depend on it**

Add this to your package's pubspec.yaml file:

```yaml
flutter_progress_button: '^1.0.0'
```

### **Install it**

You can install packages from the command line:

```
$ flutter pub get
```

Alternatively, your editor might support flutter pub get.

### **Import it**

Now in your Dart code, you can use:

```dart
import 'package:flutter_progress_button/flutter_progress_button.dart';

```

## How to use

Add `ProgressButton` to your widget tree:

```dart
ProgressButton(
    defaultWidget: const Text('I am a button'),
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
```

More parameters:
```dart
ProgressButton({
    Key key,
    this.defaultWidget,
    this.progressWidget,
    this.onPressed,
    this.type = ProgressButtonType.Raised,
    this.color,
    this.width = double.infinity,
    this.height = 40.0,
    this.borderRadius = 2.0,
    this.animate = true,
}) : super(key: key);
```

Three types supported:
```dart
enum ProgressButtonType {
    Raised,
    Flat,
    Outline,
}
```

## Source
Source code and example of this library can be found in git:

```
$ git clone https://github.com/jiangyang5157/flutter_progress_button.git
```
