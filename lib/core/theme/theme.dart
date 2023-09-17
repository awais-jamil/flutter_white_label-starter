import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

part 'colors.dart';
part 'spacing.dart';
part 'text_styles.dart';

class AppTheme {
  const AppTheme._();
  factory AppTheme() => instance;
  static const instance = AppTheme._();

  AppSpacings get spacing => const AppSpacings();

  ThemeData get lightTheme => baseTheme(
        colors: LightAppColors(),
        textStyles: LightAppTextStyles(),
      );

  ThemeData get darkTheme => baseTheme(
        colors: DarkAppColors(),
        textStyles: DarkAppTextStyles(),
      );

  ThemeData baseTheme({
    required AppColors colors,
    required AppTextStyles textStyles,
  }) {
    final iconTheme =
        IconThemeData(size: 24, color: colors.colorScheme.primary);
    return ThemeData(
      canvasColor: colors.colorScheme.surface,
      scaffoldBackgroundColor: colors.colorScheme.background,
      colorScheme: colors.colorScheme,
      hintColor: colors.colorScheme.outlineVariant,
      appBarTheme: AppBarTheme(
        elevation: 10,
        shadowColor: colors.colorScheme.shadow,
        backgroundColor: colors.colorScheme.surface,
        foregroundColor: colors.colorScheme.onSurface,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: colors.colorScheme.surface,
          statusBarBrightness: colors.brightness,
          systemNavigationBarIconBrightness: colors.brightness.inverse,
        ),
      ),
      iconTheme: iconTheme,
      primaryIconTheme: iconTheme,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: textStyles.bodySmall,
        unselectedLabelStyle: textStyles.bodySmall,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        elevation: 0,
        color: colors.colorScheme.surface,
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 0,
        color: colors.colorScheme.outline,
      ),
      textTheme: TextTheme(
        headlineMedium: textStyles.headlineMedium,
        headlineSmall: textStyles.headlineSmall,
        bodyLarge: textStyles.bodyLarge,
        bodyMedium: textStyles.bodyMedium,
        bodySmall: textStyles.bodySmall,
      ),
      fontFamily: textStyles.base.fontFamily,
    );
  }
}

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  IconThemeData get iconTheme => theme.iconTheme;

  AppSpacings get spacing => AppTheme().spacing;

  TargetPlatform get platform => theme.platform;
}

extension BrightnessX on Brightness {
  Brightness get inverse =>
      this == Brightness.dark ? Brightness.light : Brightness.dark;
}
