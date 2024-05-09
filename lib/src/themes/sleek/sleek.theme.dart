import 'package:flutter/material.dart';

/// SleekThemeData
///
/// [SleekThemeData] is a class that holds the color scheme for the Comic theme.
class SleekThemeData {
  SleekThemeData({required this.colorScheme});

  final ColorScheme colorScheme;

  /// of
  ///
  /// [of] is a method that returns a [ThemeData] object with the color scheme
  static ThemeData of(BuildContext context) {
    final theme = Theme.of(context);
    return ThemeData(
      colorScheme: Theme.of(context).colorScheme,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all(theme.colorScheme.onSurface),
          backgroundColor: MaterialStateProperty.all(
            theme.colorScheme.primaryContainer,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          foregroundColor:
              MaterialStateProperty.all(theme.colorScheme.onSurface),
          backgroundColor: MaterialStateProperty.all(
            theme.colorScheme.primaryContainer,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ),
      // textTheme: const TextTheme(
      // bodyLarge: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // bodyMedium: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // bodySmall: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // titleLarge: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // titleMedium: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // titleSmall: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // labelLarge: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // labelMedium: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // labelSmall: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // displayLarge: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // displayMedium: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // displaySmall: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // headlineLarge: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // headlineMedium: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // headlineSmall: TextStyle(
      //   color: Colors.red,
      //   fontSize: 20,
      // ),
      // ),
    );
  }
}

/// SleekTheme
///
/// [SleekTheme] is a class that returns a [Theme] widget with the [SleekThemeData] object
class SleekTheme extends StatelessWidget {
  const SleekTheme({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: SleekThemeData.of(context),
      child: child,
    );
  }
}
