import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff7e570f),
      surfaceTint: Color(0xff7e570f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffddb1),
      onPrimaryContainer: Color(0xff614000),
      secondary: Color(0xff6f5b40),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffadebb),
      onSecondaryContainer: Color(0xff56442a),
      tertiary: Color(0xff685f12),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff1e48a),
      onTertiaryContainer: Color(0xff4f4800),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f3),
      onSurface: Color(0xff201b13),
      onSurfaceVariant: Color(0xff4f4539),
      outline: Color(0xff817567),
      outlineVariant: Color(0xffd3c4b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362f27),
      inversePrimary: Color(0xfff3bd6e),
      primaryFixed: Color(0xffffddb1),
      onPrimaryFixed: Color(0xff291800),
      primaryFixedDim: Color(0xfff3bd6e),
      onPrimaryFixedVariant: Color(0xff614000),
      secondaryFixed: Color(0xfffadebb),
      onSecondaryFixed: Color(0xff271904),
      secondaryFixedDim: Color(0xffdcc3a1),
      onSecondaryFixedVariant: Color(0xff56442a),
      tertiaryFixed: Color(0xfff1e48a),
      onTertiaryFixed: Color(0xff201c00),
      tertiaryFixedDim: Color(0xffd4c871),
      onTertiaryFixedVariant: Color(0xff4f4800),
      surfaceDim: Color(0xffe4d8cc),
      surfaceBright: Color(0xfffff8f3),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffef2e5),
      surfaceContainer: Color(0xfff8ecdf),
      surfaceContainerHigh: Color(0xfff3e6da),
      surfaceContainerHighest: Color(0xffede1d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4c3100),
      surfaceTint: Color(0xff7e570f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff8f651e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff44331b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7e6a4d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3d3700),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff776e21),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f3),
      onSurface: Color(0xff151009),
      onSurfaceVariant: Color(0xff3e3529),
      outline: Color(0xff5b5144),
      outlineVariant: Color(0xff766b5e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362f27),
      inversePrimary: Color(0xfff3bd6e),
      primaryFixed: Color(0xff8f651e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff734d03),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7e6a4d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff655237),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff776e21),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5e5607),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd0c5b9),
      surfaceBright: Color(0xfffff8f3),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffef2e5),
      surfaceContainer: Color(0xfff3e6da),
      surfaceContainerHigh: Color(0xffe7dbcf),
      surfaceContainerHighest: Color(0xffdbd0c4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3e2800),
      surfaceTint: Color(0xff7e570f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff654200),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff392912),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff58462c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff322d00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff524a00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f3),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff332b20),
      outlineVariant: Color(0xff51483b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362f27),
      inversePrimary: Color(0xfff3bd6e),
      primaryFixed: Color(0xff654200),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff472e00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff58462c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff403018),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff524a00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff393300),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc2b7ab),
      surfaceBright: Color(0xfffff8f3),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbefe2),
      surfaceContainer: Color(0xffede1d4),
      surfaceContainerHigh: Color(0xffded3c6),
      surfaceContainerHighest: Color(0xffd0c5b9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff3bd6e),
      surfaceTint: Color(0xfff3bd6e),
      onPrimary: Color(0xff442b00),
      primaryContainer: Color(0xff614000),
      onPrimaryContainer: Color(0xffffddb1),
      secondary: Color(0xffdcc3a1),
      onSecondary: Color(0xff3d2e16),
      secondaryContainer: Color(0xff56442a),
      onSecondaryContainer: Color(0xfffadebb),
      tertiary: Color(0xffd4c871),
      onTertiary: Color(0xff363100),
      tertiaryContainer: Color(0xff4f4800),
      onTertiaryContainer: Color(0xfff1e48a),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff18130b),
      onSurface: Color(0xffede1d4),
      onSurfaceVariant: Color(0xffd3c4b4),
      outline: Color(0xff9b8f80),
      outlineVariant: Color(0xff4f4539),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffede1d4),
      inversePrimary: Color(0xff7e570f),
      primaryFixed: Color(0xffffddb1),
      onPrimaryFixed: Color(0xff291800),
      primaryFixedDim: Color(0xfff3bd6e),
      onPrimaryFixedVariant: Color(0xff614000),
      secondaryFixed: Color(0xfffadebb),
      onSecondaryFixed: Color(0xff271904),
      secondaryFixedDim: Color(0xffdcc3a1),
      onSecondaryFixedVariant: Color(0xff56442a),
      tertiaryFixed: Color(0xfff1e48a),
      onTertiaryFixed: Color(0xff201c00),
      tertiaryFixedDim: Color(0xffd4c871),
      onTertiaryFixedVariant: Color(0xff4f4800),
      surfaceDim: Color(0xff18130b),
      surfaceBright: Color(0xff3f382f),
      surfaceContainerLowest: Color(0xff120d07),
      surfaceContainerLow: Color(0xff201b13),
      surfaceContainer: Color(0xff251f17),
      surfaceContainerHigh: Color(0xff2f2921),
      surfaceContainerHighest: Color(0xff3a342b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd69d),
      surfaceTint: Color(0xfff3bd6e),
      onPrimary: Color(0xff362200),
      primaryContainer: Color(0xffb7883f),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff3d8b6),
      onSecondary: Color(0xff32230c),
      secondaryContainer: Color(0xffa48d6f),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffebde85),
      onTertiary: Color(0xff2b2600),
      tertiaryContainer: Color(0xff9c9242),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff18130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe9dac9),
      outline: Color(0xffbdb0a0),
      outlineVariant: Color(0xff9b8e80),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffede1d4),
      inversePrimary: Color(0xff634100),
      primaryFixed: Color(0xffffddb1),
      onPrimaryFixed: Color(0xff1b0f00),
      primaryFixedDim: Color(0xfff3bd6e),
      onPrimaryFixedVariant: Color(0xff4c3100),
      secondaryFixed: Color(0xfffadebb),
      onSecondaryFixed: Color(0xff1b0f00),
      secondaryFixedDim: Color(0xffdcc3a1),
      onSecondaryFixedVariant: Color(0xff44331b),
      tertiaryFixed: Color(0xfff1e48a),
      onTertiaryFixed: Color(0xff141100),
      tertiaryFixedDim: Color(0xffd4c871),
      onTertiaryFixedVariant: Color(0xff3d3700),
      surfaceDim: Color(0xff18130b),
      surfaceBright: Color(0xff4b433a),
      surfaceContainerLowest: Color(0xff0b0703),
      surfaceContainerLow: Color(0xff221d15),
      surfaceContainer: Color(0xff2d271f),
      surfaceContainerHigh: Color(0xff383229),
      surfaceContainerHighest: Color(0xff443d34),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffedd9),
      surfaceTint: Color(0xfff3bd6e),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffeeba6b),
      onPrimaryContainer: Color(0xff130900),
      secondary: Color(0xffffedd9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd8bf9d),
      onSecondaryContainer: Color(0xff130900),
      tertiary: Color(0xfffff296),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffd0c46e),
      onTertiaryContainer: Color(0xff0e0b00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff18130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfffdeedc),
      outlineVariant: Color(0xffcfc0b0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffede1d4),
      inversePrimary: Color(0xff634100),
      primaryFixed: Color(0xffffddb1),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xfff3bd6e),
      onPrimaryFixedVariant: Color(0xff1b0f00),
      secondaryFixed: Color(0xfffadebb),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffdcc3a1),
      onSecondaryFixedVariant: Color(0xff1b0f00),
      tertiaryFixed: Color(0xfff1e48a),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd4c871),
      onTertiaryFixedVariant: Color(0xff141100),
      surfaceDim: Color(0xff18130b),
      surfaceBright: Color(0xff574f45),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff251f17),
      surfaceContainer: Color(0xff362f27),
      surfaceContainerHigh: Color(0xff413a32),
      surfaceContainerHighest: Color(0xff4d463d),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  /// Custom Color 1
  static const customColor1 = ExtendedColor(
    seed: Color(0xffbe9000),
    value: Color(0xffbe9000),
    light: ColorFamily(
      color: Color(0xff775a0b),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffffdf9b),
      onColorContainer: Color(0xff5b4300),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff775a0b),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffffdf9b),
      onColorContainer: Color(0xff5b4300),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff775a0b),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffffdf9b),
      onColorContainer: Color(0xff5b4300),
    ),
    dark: ColorFamily(
      color: Color(0xffe8c26c),
      onColor: Color(0xff3f2e00),
      colorContainer: Color(0xff5b4300),
      onColorContainer: Color(0xffffdf9b),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffe8c26c),
      onColor: Color(0xff3f2e00),
      colorContainer: Color(0xff5b4300),
      onColorContainer: Color(0xffffdf9b),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffe8c26c),
      onColor: Color(0xff3f2e00),
      colorContainer: Color(0xff5b4300),
      onColorContainer: Color(0xffffdf9b),
    ),
  );

  List<ExtendedColor> get extendedColors => [
        customColor1,
      ];
  static const customRed = Color(0xffba1a1a);
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
