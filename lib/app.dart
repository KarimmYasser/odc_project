import 'package:flutter/material.dart';

import 'core/config/theme/theme.dart';
import 'core/helpers/device/web_material_scroll.dart';
import 'features/intro/presentation/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      home: SplashScreen(),
    );
  }
}
