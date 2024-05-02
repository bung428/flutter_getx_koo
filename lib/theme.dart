import 'package:flutter/material.dart';

extension TextStyleByTheme on ThemeData {
  Color get textColor => colorScheme.onSurface;

  Color get primaryTextColor => colorScheme.onPrimary;

  Color get secondTextColor => colorScheme.onSecondary;

  Color get tertiaryTextColor => colorScheme.onTertiary;

  Color get errorTextColor => colorScheme.onError;
}

extension AppTextStyleByColor on Color {
  TextStyle w100(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w100,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w200(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w200,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w300(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w300,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w400(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w400,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w500(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w500,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w600(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w600,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w700(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w700,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w800(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w800,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle w900(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w900,
      color: this,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle normal(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return w400(
      fontSize,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle semiBold(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return w600(
      fontSize,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  TextStyle bold(
      double fontSize, {
        FontStyle? fontStyle,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return w700(
      fontSize,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }
}

enum AppButtonStyle {
  primary,
  primaryContainer,
  secondary,
  secondaryContainer,
  tertiary,
  tertiaryContainer,
  error,
  errorContainer,
  outline,
}

extension AppButtonStyleExt on ThemeData {
  ButtonStyle getElevatedBtnStyle(AppButtonStyle style) => switch(style) {
    AppButtonStyle.primary => ElevatedButton.styleFrom(
      foregroundColor: colorScheme.onPrimary,
      backgroundColor: colorScheme.primary,
    ),
    AppButtonStyle.primaryContainer => ElevatedButton.styleFrom(
      foregroundColor: colorScheme.onPrimaryContainer,
      backgroundColor: colorScheme.primaryContainer,
    ),
    AppButtonStyle.secondary => ElevatedButton.styleFrom(
      foregroundColor: colorScheme.onSecondary,
      backgroundColor: colorScheme.secondary,
    ),
    AppButtonStyle.secondaryContainer => ElevatedButton.styleFrom(
      foregroundColor: colorScheme.onSecondaryContainer,
      backgroundColor: colorScheme.secondaryContainer,
    ),
    AppButtonStyle.tertiary => ElevatedButton.styleFrom(
      foregroundColor: colorScheme.onTertiary,
      backgroundColor: colorScheme.tertiary,
    ),
    AppButtonStyle.tertiaryContainer => ElevatedButton.styleFrom(
      foregroundColor: colorScheme.onTertiaryContainer,
      backgroundColor: colorScheme.tertiaryContainer,
    ),
    AppButtonStyle.error => ElevatedButton.styleFrom(
      foregroundColor: colorScheme.onError,
      backgroundColor: colorScheme.error,
    ),
    AppButtonStyle.errorContainer => ElevatedButton.styleFrom(
      foregroundColor: colorScheme.onErrorContainer,
      backgroundColor: colorScheme.errorContainer,
    ),
    AppButtonStyle.outline => ElevatedButton.styleFrom(
      foregroundColor: scaffoldBackgroundColor,
      backgroundColor: colorScheme.outline,
    ),
  };

  ButtonStyle getOutlinedBtnStyle(AppButtonStyle style) => switch(style) {
    AppButtonStyle.primary => OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        side: BorderSide(color: colorScheme.primary)
    ),
    AppButtonStyle.primaryContainer => OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primaryContainer,
        side: BorderSide(color: colorScheme.primaryContainer)
    ),
    AppButtonStyle.secondary => OutlinedButton.styleFrom(
        foregroundColor: colorScheme.secondary,
        side: BorderSide(color: colorScheme.secondary)
    ),
    AppButtonStyle.secondaryContainer => OutlinedButton.styleFrom(
        foregroundColor: colorScheme.secondaryContainer,
        side: BorderSide(color: colorScheme.secondaryContainer)
    ),
    AppButtonStyle.tertiary => OutlinedButton.styleFrom(
        foregroundColor: colorScheme.tertiary,
        side: BorderSide(color: colorScheme.tertiary)
    ),
    AppButtonStyle.tertiaryContainer => OutlinedButton.styleFrom(
        foregroundColor: colorScheme.tertiaryContainer,
        side: BorderSide(color: colorScheme.tertiaryContainer)
    ),
    AppButtonStyle.error => OutlinedButton.styleFrom(
        foregroundColor: colorScheme.error,
        side: BorderSide(color: colorScheme.error)
    ),
    AppButtonStyle.errorContainer => OutlinedButton.styleFrom(
        foregroundColor: colorScheme.errorContainer,
        side: BorderSide(color: colorScheme.errorContainer)
    ),
    AppButtonStyle.outline => OutlinedButton.styleFrom(
        foregroundColor: colorScheme.outline,
        side: BorderSide(color: colorScheme.outline)
    ),
  };
}