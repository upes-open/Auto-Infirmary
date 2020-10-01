# Auto-Infirmary

Auto-Imfirmary

> [Hacktoberfest](https://hacktoberfest.digitalocean.com/) is a chance to level up your coding skills and get small goodies in reward.

<br />
## Official website for registration and tips on how to get started

- [Hacktoberfest Official Website](https://hacktoberfest.digitalocean.com/)
- [Hacktoberfest Tutorial](https://youtu.be/0mjJS1Y8wrI) - Introduction to Hacktoberfest
- [Hacktoberfest Swag List](https://benbarth.github.io/hacktoberfest-swag/) - List of all goodies given away by companies

# Table of Contents
- [Auto-Infirmary](#auto-infirmary)
  - [Official website for registration and tips on how to get started](#official-website-for-registration-and-tips-on-how-to-get-started)
- [Table of Contents](#table-of-contents)
  - [Built With](#built-with)
  - [Documentation](#documentation)
  - [About Flutter](#about-flutter)
    - [Beautiful user experiences](#beautiful-user-experiences)
    - [Fast results](#fast-results)
    - [Productive development](#productive-development)
    - [Extensible and open model](#extensible-and-open-model)
  - [Running the project](#running-the-project)
  - [Hide Generated Files](#hide-generated-files)
  - [Contributing](#contributing)

<br/>

## Built With

* [Flutter](https://flutter.dev/)

## Documentation

* [Install Flutter](https://flutter.dev/get-started/)
* [Flutter documentation](https://flutter.dev/docs)
* [Development wiki](https://github.com/flutter/flutter/wiki)
* [Contributing to Flutter](https://github.com/flutter/flutter/blob/master/CONTRIBUTING.md)

For announcements about new releases and breaking changes, follow the
[flutter-announce@googlegroups.com](https://groups.google.com/forum/#!forum/flutter-announce)
mailing list.

## About Flutter

We think Flutter will help you create beautiful, fast apps, with a productive,
extensible and open development model.

### Beautiful user experiences

We want to enable designers to deliver their full creative vision without being
forced to water it down due to limitations of the underlying framework.
Flutter's [layered architecture] gives you control over every pixel on the
screen and its powerful compositing capabilities let you overlay and animate
graphics, video, text, and controls without limitation. Flutter includes a full
[set of widgets][widget catalog] that deliver pixel-perfect experiences on both
iOS and Android.

![Reflectly hero image][Reflectly hero image]

### Fast results

Flutter is fast. It's powered by the same hardware-accelerated 2D graphics
library that underpins Chrome and Android: [Skia]. We architected Flutter to
support glitch-free, jank-free graphics at the native speed of your device.
Flutter code is powered by the world-class [Dart platform], which enables
compilation to 32-bit and 64-bit ARM machine code for iOS and Android, as well
as JavaScript for the web and Intel x64 for desktop devices.

![Dart platform diagram][]

### Productive development

Flutter offers stateful hot reload, allowing you to make changes to your code
and see the results instantly without restarting your app or losing its state.

[![Hot reload animation][]][Hot reload]

### Extensible and open model

Flutter works with any development tool (or none at all) but includes editor
plug-ins for both [Visual Studio Code] and [IntelliJ / Android Studio]. Flutter
provides [thousands of packages][Flutter packages] to speed your development,
regardless of your target platform. And accessing other native code is easy,
with support for both [FFI] and [platform-specific APIs][platform channels].

## Running the project


**Step 1:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 2:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

## Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.inject.summary;*.inject.dart;*.g.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:
```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```


## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch 
```md
   git checkout -b feature/AmazingFeature
```
3. Commit your Changes 
```md
   git commit -m 'Add some AmazingFeature'
```
4. Push to the Branch
```md
   git push origin feature/AmazingFeature
``` 
5. Open a Pull Request




[Flutter logo]: https://raw.githubusercontent.com/flutter/website/master/src/_assets/image/flutter-lockup.png
[flutter.dev]: https://flutter.dev
[Build Status - Cirrus]: https://api.cirrus-ci.com/github/flutter/flutter.svg
[Build status]: https://cirrus-ci.com/github/flutter/flutter/master
[Gitter Channel]: https://badges.gitter.im/flutter/flutter.svg
[Gitter badge]: https://gitter.im/flutter/flutter?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge
[Twitter handle]: https://img.shields.io/twitter/follow/flutterdev.svg?style=social&label=Follow
[Twitter badge]: https://twitter.com/intent/follow?screen_name=flutterdev
[layered architecture]: https://flutter.dev/docs/resources/inside-flutter
[widget catalog]: https://flutter.dev/widgets/
[Reflectly hero image]: https://github.com/flutter/website/blob/master/src/images/homepage/reflectly-hero-600px.png
[Skia]: https://skia.org/
[Dart platform]: https://dart.dev/
[Dart platform diagram]: https://github.com/flutter/website/blob/master/src/images/homepage/dart-diagram-small.png
[Hot reload animation]: https://raw.githubusercontent.com/flutter/website/master/src/_assets/image/tools/android-studio/hot-reload.gif
[Hot reload]: https://flutter.dev/docs/development/tools/hot-reload
[Visual Studio Code]: https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter
[IntelliJ / Android Studio]: https://plugins.jetbrains.com/plugin/9212-flutter
[Flutter packages]: https://pub.dev/flutter
[FFI]: https://flutter.dev/docs/development/platform-integration/c-interop
[platform channels]: https://flutter.dev/docs/development/platform-integration/platform-channels
[interop example]: https://github.com/flutter/flutter/tree/master/examples/platform_channel