import 'package:flutter/material.dart';

const borderThickness = 2.0;

Color comicContainerBackgroundColor(BuildContext context) =>
    Theme.of(context).colorScheme.surface;

class ComicIconButtonThemeData {
  ComicIconButtonThemeData();

  static ThemeData of(BuildContext context) {
    final theme = Theme.of(context);
    return ThemeData(
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(
                color: theme.colorScheme.outline,
                width: borderThickness,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ComicTextButtonThemeData {
  // ComicTextButtonThemeData();

  static ThemeData of(BuildContext context) {
    final theme = Theme.of(context);
    return ThemeData(
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface),
          backgroundColor: WidgetStateProperty.all(theme.colorScheme.surface),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(
                width: borderThickness,
                color: theme.colorScheme.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ComicThemeData
///
/// [ComicThemeData] is a class that holds the color scheme for the Comic theme.
class ComicThemeData {
  ComicThemeData();

  /// of
  ///
  /// [of] is a method that returns a [ThemeData] object with the color scheme
  static ThemeData of(BuildContext context) {
    final theme = Theme.of(context);
    // final theme = Theme.of(context).copyWith(
    //   colorScheme: ColorScheme.fromSeed(
    //     seedColor: const Color(0xFF6750A4),
    //     brightness: Brightness.dark,
    //     error: const Color(0xFFB00020),
    //     outline: Colors.red,
    //   ),
    //   // textTheme: Theme.of(context).textTheme.copyWith(
    //   //       labelSmall: const TextStyle(
    //   //         fontWeight: FontWeight.w400,
    //   //         color: Colors.pink,
    //   //       ),
    //   //       labelMedium: const TextStyle(
    //   //         fontWeight: FontWeight.w400,
    //   //         color: Colors.pink,
    //   //       ),
    //   //       labelLarge: const TextStyle(
    //   //         fontWeight: FontWeight.w400,
    //   //         color: Colors.pink,
    //   //       ),
    //   //       bodyLarge: const TextStyle(
    //   //         fontWeight: FontWeight.w400,
    //   //         color: Colors.pink,
    //   //       ),
    //   //       bodyMedium: const TextStyle(
    //   //         fontWeight: FontWeight.w400,
    //   //         color: Colors.pink,
    //   //       ),
    //   //       bodySmall: const TextStyle(
    //   //         fontWeight: FontWeight.w400,
    //   //         color: Colors.pink,
    //   //       ),
    //   //     ),
    // );
    return ThemeData(
      appBarTheme: AppBarTheme(
        //   iconTheme: theme.iconTheme.copyWith(
        //     color: theme.colorScheme.onSurface,
        //   ),
        //   actionsIconTheme: theme.iconTheme.copyWith(
        //     color: theme.colorScheme.onSurface,
        //   ),
        //   titleTextStyle: theme.textTheme.headlineMedium?.copyWith(
        //     color: theme.colorScheme.onSurface,
        //   ),
        shape: Border(
          bottom: BorderSide(
            width: borderThickness,
            color: theme.colorScheme.outline,
          ),
        ),
      ),

      // actionIconTheme: ActionIconThemeData(
      //   backButtonIconBuilder: (context) =>
      //       IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      // ),

      // NOTE: Did not set the badge color because it
      // should be up to the developer
      // by default it is set to colorScheme.error
      // badgeTheme: theme.badgeTheme.copyWith(
      //   backgroundColor: theme.colorScheme.primary,
      // ),

      // NOTE: Unable to add borders for comic theme in bottom app bar.
      bottomAppBarTheme: theme.bottomAppBarTheme,

      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        elevation: 0,
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        // backgroundColor: theme.colorScheme.surface,
        shape: Border(
          top: BorderSide(
            width: borderThickness,
          ),
          left: BorderSide(
            width: borderThickness,
          ),
          right: BorderSide(
            width: borderThickness,
          ),
        ),
      ),
      cardTheme: theme.cardTheme.copyWith(
        // color: theme.colorScheme.error,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: borderThickness,
            color: theme.colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),

      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        fillColor: WidgetStateProperty.all(
          comicContainerBackgroundColor(context),
        ),
        checkColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return theme.colorScheme.outlineVariant;
            }

            return theme.colorScheme.onSurface;
          },
        ),
      ),

      /// [Chip] @thruthesky - 2024-05-22
      ///
      chipTheme: theme.chipTheme.copyWith(
        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: theme.colorScheme.outline,
            width: borderThickness,
          ),
        ),
        backgroundColor: comicContainerBackgroundColor(context),
        selectedColor: comicContainerBackgroundColor(context),
      ),
      colorScheme: theme.colorScheme,

      dialogTheme: DialogTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(
            // removed the border color so the default value from [BorderSide] will be used
            // color: theme.colorScheme.outline,
            width: borderThickness,
          ),
        ),
      ),
      dividerTheme: theme.dividerTheme.copyWith(
        color: theme.colorScheme.outline,
        thickness: borderThickness,
      ),
      drawerTheme: theme.drawerTheme.copyWith(
        elevation: 0,
        shadowColor: Colors.transparent,
        endShape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
            side: BorderSide(
              width: borderThickness,
              color: theme.colorScheme.outline,
            )),
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24)),
            side: BorderSide(
              width: borderThickness,
              color: theme.colorScheme.outline,
            )),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(
                color: theme.colorScheme.outline,
                width: borderThickness,
              ),
            ),
          ),
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            width: borderThickness,
            color: theme.colorScheme.outline,
          ),
        ),
        highlightElevation: 0,
      ),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.15),
          borderSide: BorderSide(
            color: theme.colorScheme.outline,
            width: borderThickness,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.15),
          borderSide: BorderSide(
            color: theme.colorScheme.outline,
            width: borderThickness,
          ),
        ),
      ),

      listTileTheme: theme.listTileTheme.copyWith(
        // Note: By default, the tileColor uses Colors.transparent so we should
        // not give tile color on comic theme because it might conflict with other
        // widget that uses background color. We should let the developers
        // override the tileColor instead
        // tileColor: theme.colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: theme.colorScheme.outline,
            width: borderThickness,
          ),
        ),
      ),
      menuBarTheme: MenuBarThemeData(
        style:
            (theme.dropdownMenuTheme.menuStyle ?? const MenuStyle()).copyWith(
          backgroundColor: WidgetStateProperty.all(
            comicContainerBackgroundColor(context),
          ),
          shadowColor: WidgetStateProperty.all(
            Colors.transparent,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  width: borderThickness,
                  color: theme.colorScheme.outline,
                )),
          ),
        ),
      ),

      // uses the menuTheme
      // dropdownMenuTheme: const DropdownMenuThemeData(),
      menuTheme: MenuThemeData(
        style:
            (theme.dropdownMenuTheme.menuStyle ?? const MenuStyle()).copyWith(
          backgroundColor: WidgetStateProperty.all(
            comicContainerBackgroundColor(context),
          ),
          shadowColor: WidgetStateProperty.all(
            Colors.transparent,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  width: borderThickness,
                  color: theme.colorScheme.outline,
                )),
          ),
        ),
      ),

      navigationBarTheme: theme.navigationBarTheme.copyWith(
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.onSurface,
            );
          }
          return TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.onSurface,
          );
        }),
        indicatorShape: RoundedRectangleBorder(
          side: BorderSide(
            width: borderThickness,
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
      navigationDrawerTheme: theme.navigationDrawerTheme.copyWith(
        elevation: 0,
        shadowColor: Colors.transparent,
        // indicatorColor: Colors.transparent,
        indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(
              width: borderThickness,
              color: theme.colorScheme.outline,
            )),
      ),
      navigationRailTheme: theme.navigationRailTheme.copyWith(
        indicatorColor: Colors.transparent,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: theme.colorScheme.outline,
            width: borderThickness,
          ),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            width: borderThickness,
            color: theme.colorScheme.outline,
          ),
        ),
        color: comicContainerBackgroundColor(context),
      ),

      radioTheme: const RadioThemeData(),

      // ),
      snackBarTheme: SnackBarThemeData(
        elevation: 0,
        backgroundColor: comicContainerBackgroundColor(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            width: borderThickness,
            color: theme.colorScheme.outline,
          ),
        ),
        actionTextColor: theme.colorScheme.primary,
        contentTextStyle: TextStyle(
          color: theme.colorScheme.onSurface,
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(
          // selectedBackgroundColor: theme.colorScheme.secondary.withAlpha(80),
          // selectedForegroundColor: theme.colorScheme.onSurface,
          // foregroundColor: theme.colorScheme.onSurface,
          side: BorderSide(
            width: borderThickness,
            color: theme.colorScheme.outline,
          ),
          elevation: 0,
        ),
      ),
      switchTheme: SwitchThemeData(
        trackOutlineWidth: WidgetStateProperty.all(
          borderThickness,
        ),
        thumbColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return theme.colorScheme.outlineVariant;
            }
            return theme.colorScheme.outline;
          },
        ),
        trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return theme.colorScheme.outlineVariant;
            }

            return theme.colorScheme.onSurface;
          },
        ),
        trackColor: WidgetStateProperty.all(
          comicContainerBackgroundColor(context),
        ),
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedBorderColor: theme.colorScheme.outline,
        borderWidth: borderThickness,
        fillColor: comicContainerBackgroundColor(context),
        borderRadius: BorderRadius.circular(7),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          // NOTE: Shape is not working here.
          side: WidgetStatePropertyAll(
            BorderSide(
              // Please review this might be a wrong way to do it.
              // because in flutter way, to set the color scheme, we can usually set
              // it thru copyWith, then set the color scheme.
              // Here, it is accessing the outline color from the theme variable.
              // When developer used this like ComicTheme.of(context).copyWith( colorScheme: theme.colorScheme )
              // theme.colorScheme.
              color: theme.colorScheme.outline,
              width: borderThickness,
            ),
          ),
        ),
      ),
      // progressIndicatorTheme: const ProgressIndicatorThemeData(
      // linearTrackColor: theme.colorScheme.outlineVariant.withAlpha(40),
      // color: theme.colorScheme.secondary,

      tabBarTheme: theme.tabBarTheme.copyWith(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: borderThickness * 3,
              color: theme.colorScheme.outline,
            ),
          ),
        ),
        indicatorSize: TabBarIndicatorSize.label,
        // Note: By default, the dividerColor uses outlineVariant
        // dividerColor: theme.colorScheme.onSurface,
        dividerHeight: borderThickness * 0.8,
      ),
    );
  }
}

/// ComicTheme
///
/// [ComicTheme] is a class that returns a [Theme] widget with the [ComicThemeData] object
class ComicTheme extends StatelessWidget {
  const ComicTheme({super.key, required this.child});

  final Widget child;

  /// Supporting method to get the [ThemeData] object
  ///
  /// @example
  /// ```dart
  /// final theme = ComicTheme.of(context);
  ///
  /// Theme(
  ///   data: theme,
  /// )
  /// ```
  static ThemeData of(BuildContext context) {
    return ComicThemeData.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ComicThemeData.of(context),
      child: child,
    );
  }
}
