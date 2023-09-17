part of 'theme.dart';

abstract class AppTextStyles {
  const AppTextStyles();

  Color get color;

  TextStyle get base => GoogleFonts.lato(color: color);

  TextStyle get displayLarge => base.copyWithGoogleFont(
        fontSize: 22,
        height: 16.59 / 14,
        fontWeight: FontWeight.w700,
        color: color,
      );

  TextStyle get displayMedium => base.copyWithGoogleFont(
        fontSize: 20,
        height: 16.59 / 14,
        fontWeight: FontWeight.w700,
        color: color,
      );

  TextStyle get displaySmall => base.copyWithGoogleFont(
        fontSize: 18,
        height: 16.59 / 14,
        fontWeight: FontWeight.w700,
        color: color,
      );

  TextStyle get headlineLarge => base.copyWithGoogleFont(
        fontSize: 16,
        height: 16.59 / 14,
        fontWeight: FontWeight.w700,
        color: color,
      );

  TextStyle get headlineMedium => base.copyWithGoogleFont(
        fontSize: 14,
        height: 16.59 / 14,
        fontWeight: FontWeight.w700,
        color: color,
      );

  TextStyle get headlineSmall => base.copyWithGoogleFont(
        fontSize: 14,
        height: 16.59 / 14,
        fontWeight: FontWeight.w400,
        color: color,
      );

  TextStyle get bodyLarge => base.copyWithGoogleFont(
        fontSize: 14,
        height: 21 / 14,
        fontWeight: FontWeight.w400,
        color: color,
      );

  TextStyle get bodyMedium => base.copyWithGoogleFont(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w400,
        color: color,
      );

  TextStyle get bodySmall => base.copyWithGoogleFont(
        fontSize: 12,
        height: 14.22 / 12,
        fontWeight: FontWeight.w400,
        color: color,
      );
}

class LightAppTextStyles extends AppTextStyles {
  const LightAppTextStyles._();
  factory LightAppTextStyles() => instance;
  static const instance = LightAppTextStyles._();

  @override
  Color get color => LightAppColors().colorScheme.onSurface;
}

class DarkAppTextStyles extends AppTextStyles {
  const DarkAppTextStyles._();
  factory DarkAppTextStyles() => instance;
  static const instance = DarkAppTextStyles._();

  @override
  Color get color => DarkAppColors().colorScheme.onSurface;
}

extension TextThemeContext on BuildContext {
  /// fontSize: 22,
  /// height: 16.59
  /// fontWeight: FontWeight.w700,
  TextStyle? get displayLarge => textTheme.displayLarge;

  /// fontSize: 20,
  /// height: 16.59
  /// fontWeight: FontWeight.w700,
  TextStyle? get displayMedium => textTheme.displayMedium;

  /// fontSize: 18,
  /// height: 16.59
  /// fontWeight: FontWeight.w700,
  TextStyle? get displaySmall => textTheme.displaySmall;

  /// fontSize: 16,
  /// height: 16.59
  /// fontWeight: FontWeight.w700,
  TextStyle? get headlineLarge => textTheme.headlineLarge;

  /// fontSize: 14,
  /// height: 16.59
  /// fontWeight: FontWeight.w700,
  TextStyle? get headlineMedium => textTheme.headlineMedium;

  /// fontSize: 14,
  /// height: 16.59
  /// fontWeight: FontWeight.w400,
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  /// fontSize: 14,
  /// height: 21
  /// fontWeight: FontWeight.w400,
  TextStyle? get bodyLarge => textTheme.bodyLarge;

  /// fontSize: 12,
  /// height: 16
  /// fontWeight: FontWeight.w400,
  TextStyle? get bodyMedium => textTheme.bodyMedium;

  /// fontSize: 12,
  /// height: 14.22
  /// fontWeight: FontWeight.w400,
  TextStyle? get bodySmall => textTheme.bodySmall;
}

extension TextStyleWeight on TextStyle {
  TextStyle get bold => copyWithGoogleFont(fontWeight: FontWeight.bold);
  TextStyle get semiBold => copyWithGoogleFont(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWithGoogleFont(fontWeight: FontWeight.w500);
  TextStyle get regular => copyWithGoogleFont(fontWeight: FontWeight.w400);

  TextStyle get underline => copyWithGoogleFont(
        decoration: TextDecoration.underline,
      );
}

extension GoogleFontCopy on TextStyle {
  TextStyle copyWithGoogleFont({
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return GoogleFonts.lato(
      textStyle: copyWith(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        height: height,
        decoration: decoration,
      ),
    );
  }
}
