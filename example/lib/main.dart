import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:themes_example/app/locator.dart';
import 'package:themes_example/ui/dark_light/dark_light_view.dart';

Future main() async {
  setupLocator();
  await ThemeManager.initialise();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.yellow[700], // Your accent color
          background: Colors.blue[700],
        ),
      ),
      lightTheme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(
              secondary: Colors.yellow[300], // Your accent color
            )
            .copyWith(background: Colors.blue[300]),
      ),
      statusBarColorBuilder: (theme) => theme.colorScheme.secondary,
      navigationBarColorBuilder: (theme) => theme.colorScheme.secondary,
      // themes: getThemes(),
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        title: 'Flutter Demo',
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        home: DarkLightView(),
      ),
    );
  }
}
