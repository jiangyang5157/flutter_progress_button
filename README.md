# flutter_progress_button

**flutter_progress_button** is a free and open source (MIT license) Material Flutter Button that supports variety of buttons style demands. It is designed to be easy to use and customizable.

![](https://github.com/jiangyang5157/flutter_progress_button/blob/master/example/assets/example.gif | width=100)

## Get started

### **Depend on it**

Add this to your package's pubspec.yaml file:

```yaml
flutter_progress_button: '^0.6.0'
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
    normalWidget: const Text('I am a button'),
    progressWidget: const CircularProgressIndicator(),
    width: 196,
    height: 40,
    onPressed: () async {
        int score = await Future.delayed(
            const Duration(milliseconds: 3000), () => 42);
        // After [onPressed], it will trigger animation running backwards, from end to beginning
        return () {
        // Optional returns is returning a function that can be called 
        // after the animation is stopped at the beginning.
        // A best practice would be to do time-consuming task in [onPressed], 
        // and do page navigation in the returned function.
        // So that user won't missed out the reverse animation.
        };
    },
),
```

## Source
Source code and examples of this library can be found in git:

```
$ git clone https://github.com/jiangyang5157/flutter_progress_button.git
```
