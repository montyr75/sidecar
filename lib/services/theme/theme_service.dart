import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/screen_utils.dart';
import 'theme_state.dart';

part 'theme_service.g.dart';

// color palette (examples)
const weaponColor = Color(0xFF964F4C);
const accessoryColor = Color(0xFF5C7866);
const upgradeColor = Color(0xFFD18C29);
const driverColor = Color(0xFF3E6A93);
const structureColor = Color(0xFF7C7774);
const sidearmColor = Color(0xFFFFF200);
const gunnerColor = Color(0xFFB96028);
const gearColor = Color(0xFF7251A1);
const bpCostColor = Color(0xFF97D5CB);
const cpCostColor = Color(0xFFD70B8C);
const durabilityColor = Color(0xFFED1C24);

const destroyedColor = Colors.red;
const depletedColor = Colors.yellow;

final cardGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Colors.grey[300]!,
    Colors.grey[400]!,
    Colors.grey[500]!,
    Colors.grey[600]!,
  ],
);

@riverpod
class ThemeService extends _$ThemeService {
  static const colorScheme = FlexScheme.flutterDash;

  FlexSchemeData get schemeData => FlexColor.schemes[colorScheme]!;

  @override
  ThemeState build() {
    return ThemeState(
      light: FlexThemeData.light(scheme: colorScheme),
      dark: _modTheme(FlexThemeData.dark(scheme: colorScheme)),
    );
  }

  /// Use this to customize the color scheme (current code is an example).
  ThemeData _modTheme(ThemeData data) {
    // final textTheme = _buildTextTheme(data.textTheme);

    return data.copyWith(
      dividerColor: Colors.white12,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white24),
          borderRadius: radiusM,
        ),
      ),
      popupMenuTheme: const PopupMenuThemeData(
        color: Colors.black87,
      ),
      // textTheme: textTheme,
    );
  }

  /// Use this to customize the text theme (current code is an example).
  // TextTheme _buildTextTheme(TextTheme base) {
  //   return base.copyWith(
  //     displayLarge: const TextStyle(
  //       color: primaryColor,
  //       fontSize: 26,
  //       fontFamily: 'HeavyMetal2',
  //     ),
  //     displayMedium: const TextStyle(
  //       color: primaryColor,
  //       fontSize: 24,
  //       fontFamily: 'HeavyMetal2',
  //     ),
  //     displaySmall: const TextStyle(
  //       color: primaryColor,
  //       fontSize: 22,
  //       fontFamily: 'HeavyMetal2',
  //     ),
  //     headlineLarge: const TextStyle(
  //       color: primaryVariant,
  //       fontSize: 21,
  //       fontFamily: 'Digital7',
  //     ),
  //     headlineMedium: const TextStyle(
  //       color: primaryVariant,
  //       fontSize: 20,
  //       fontFamily: 'Digital7',
  //     ),
  //     headlineSmall: const TextStyle(
  //       color: primaryColor,
  //       fontSize: 18,
  //       fontFamily: 'HeavyMetal2',
  //     ),
  //     titleLarge: const TextStyle(
  //       color: primaryColor,
  //       fontSize: 16,
  //       fontFamily: 'HeavyMetal2',
  //     ),
  //     titleMedium: const TextStyle(
  //       // TextField default
  //       color: primaryVariant,
  //       fontSize: 14,
  //       fontFamily: 'HeavyMetal2',
  //     ),
  //     titleSmall: const TextStyle(
  //       color: primaryColor,
  //       fontSize: 12,
  //       fontFamily: 'HeavyMetal2',
  //     ),
  //     bodyLarge: const TextStyle(
  //       color: primaryVariant,
  //       fontSize: 12,
  //       fontFamily: 'FiraCodeMed',
  //     ),
  //     bodyMedium: const TextStyle(
  //       // Text default
  //       color: primaryVariant,
  //       fontSize: 12,
  //       fontFamily: 'FiraCodeLight',
  //     ),
  //     bodySmall: const TextStyle(
  //       color: primaryVariant,
  //       fontSize: 10,
  //       fontFamily: 'HeavyMetal5',
  //     ),
  //   );
  // }

  void onModeChange(ThemeMode value) {
    state = state.copyWith(mode: value);
  }
}
