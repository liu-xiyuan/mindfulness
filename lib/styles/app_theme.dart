import 'package:fluent_ui/fluent_ui.dart';

class AppTheme {
  static final lightTheme = darkTheme.copyWith();
  static final darkTheme = FluentThemeData(
    fontFamily: 'Harmony',
    scaffoldBackgroundColor: Colors.black,
  );
}
