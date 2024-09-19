import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281821501),
      surfaceTint: Color(4281821501),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4290310585),
      onPrimaryContainer: Color(4278198536),
      secondary: Color(4283523920),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292143312),
      onSecondaryContainer: Color(4279181073),
      tertiary: Color(4281951596),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290636531),
      onTertiaryContainer: Color(4278198052),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294441970),
      onSurface: Color(4279770392),
      onSurfaceVariant: Color(4282534208),
      outline: Color(4285692272),
      outlineVariant: Color(4290890174),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281152044),
      inversePrimary: Color(4288533662),
      primaryFixed: Color(4290310585),
      onPrimaryFixed: Color(4278198536),
      primaryFixedDim: Color(4288533662),
      onPrimaryFixedVariant: Color(4280176935),
      secondaryFixed: Color(4292143312),
      onSecondaryFixed: Color(4279181073),
      secondaryFixedDim: Color(4290301109),
      onSecondaryFixedVariant: Color(4282010426),
      tertiaryFixed: Color(4290636531),
      onTertiaryFixed: Color(4278198052),
      tertiaryFixedDim: Color(4288794326),
      onTertiaryFixedVariant: Color(4280241492),
      surfaceDim: Color(4292336595),
      surfaceBright: Color(4294441970),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294047212),
      surfaceContainer: Color(4293652455),
      surfaceContainerHigh: Color(4293257697),
      surfaceContainerHighest: Color(4292928731),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279847972),
      surfaceTint: Color(4281821501),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283269202),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281747254),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284971366),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279912784),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283464579),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294441970),
      onSurface: Color(4279770392),
      onSurfaceVariant: Color(4282271037),
      outline: Color(4284113240),
      outlineVariant: Color(4285889907),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281152044),
      inversePrimary: Color(4288533662),
      primaryFixed: Color(4283269202),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281624379),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284971366),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283392078),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283464579),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281754474),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336595),
      surfaceBright: Color(4294441970),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294047212),
      surfaceContainer: Color(4293652455),
      surfaceContainerHigh: Color(4293257697),
      surfaceContainerHighest: Color(4292928731),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200587),
      surfaceTint: Color(4281821501),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4279847972),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279641623),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281747254),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200108),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4279912784),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294441970),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280231454),
      outline: Color(4282271037),
      outlineVariant: Color(4282271037),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281152044),
      inversePrimary: Color(4290902722),
      primaryFixed: Color(4279847972),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203664),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281747254),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280299809),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4279912784),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278202936),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336595),
      surfaceBright: Color(4294441970),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294047212),
      surfaceContainer: Color(4293652455),
      surfaceContainerHigh: Color(4293257697),
      surfaceContainerHighest: Color(4292928731),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288533662),
      surfaceTint: Color(4288533662),
      onPrimary: Color(4278270227),
      primaryContainer: Color(4280176935),
      onPrimaryContainer: Color(4290310585),
      secondary: Color(4290301109),
      onSecondary: Color(4280562724),
      secondaryContainer: Color(4282010426),
      onSecondaryContainer: Color(4292143312),
      tertiary: Color(4288794326),
      onTertiary: Color(4278203965),
      tertiaryContainer: Color(4280241492),
      onTertiaryContainer: Color(4290636531),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279244048),
      onSurface: Color(4292928731),
      onSurfaceVariant: Color(4290890174),
      outline: Color(4287402889),
      outlineVariant: Color(4282534208),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928731),
      inversePrimary: Color(4281821501),
      primaryFixed: Color(4290310585),
      onPrimaryFixed: Color(4278198536),
      primaryFixedDim: Color(4288533662),
      onPrimaryFixedVariant: Color(4280176935),
      secondaryFixed: Color(4292143312),
      onSecondaryFixed: Color(4279181073),
      secondaryFixedDim: Color(4290301109),
      onSecondaryFixedVariant: Color(4282010426),
      tertiaryFixed: Color(4290636531),
      onTertiaryFixed: Color(4278198052),
      tertiaryFixedDim: Color(4288794326),
      onTertiaryFixedVariant: Color(4280241492),
      surfaceDim: Color(4279244048),
      surfaceBright: Color(4281743925),
      surfaceContainerLowest: Color(4278914827),
      surfaceContainerLow: Color(4279770392),
      surfaceContainer: Color(4280033564),
      surfaceContainerHigh: Color(4280757030),
      surfaceContainerHighest: Color(4281415216),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288796834),
      surfaceTint: Color(4288533662),
      onPrimary: Color(4278196998),
      primaryContainer: Color(4285046124),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290564281),
      onSecondary: Color(4278852108),
      secondaryContainer: Color(4286813825),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289057498),
      onTertiary: Color(4278196765),
      tertiaryContainer: Color(4285307039),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279244048),
      onSurface: Color(4294507763),
      onSurfaceVariant: Color(4291218882),
      outline: Color(4288587163),
      outlineVariant: Color(4286481787),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928731),
      inversePrimary: Color(4280242729),
      primaryFixed: Color(4290310585),
      onPrimaryFixed: Color(4278195460),
      primaryFixedDim: Color(4288533662),
      onPrimaryFixedVariant: Color(4278796056),
      secondaryFixed: Color(4292143312),
      onSecondaryFixed: Color(4278522887),
      secondaryFixedDim: Color(4290301109),
      onSecondaryFixedVariant: Color(4280957482),
      tertiaryFixed: Color(4290636531),
      onTertiaryFixed: Color(4278195223),
      tertiaryFixedDim: Color(4288794326),
      onTertiaryFixedVariant: Color(4278729795),
      surfaceDim: Color(4279244048),
      surfaceBright: Color(4281743925),
      surfaceContainerLowest: Color(4278914827),
      surfaceContainerLow: Color(4279770392),
      surfaceContainer: Color(4280033564),
      surfaceContainerHigh: Color(4280757030),
      surfaceContainerHighest: Color(4281415216),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293984236),
      surfaceTint: Color(4288533662),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288796834),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293984236),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290564281),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294049279),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289057498),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279244048),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294376945),
      outline: Color(4291218882),
      outlineVariant: Color(4291218882),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928731),
      inversePrimary: Color(4278202895),
      primaryFixed: Color(4290573757),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288796834),
      onPrimaryFixedVariant: Color(4278196998),
      secondaryFixed: Color(4292406485),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290564281),
      onSecondaryFixedVariant: Color(4278852108),
      tertiaryFixed: Color(4290899959),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289057498),
      onTertiaryFixedVariant: Color(4278196765),
      surfaceDim: Color(4279244048),
      surfaceBright: Color(4281743925),
      surfaceContainerLowest: Color(4278914827),
      surfaceContainerLow: Color(4279770392),
      surfaceContainer: Color(4280033564),
      surfaceContainerHigh: Color(4280757030),
      surfaceContainerHighest: Color(4281415216),
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


  List<ExtendedColor> get extendedColors => [
  ];
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
