import 'package:flutter/material.dart';
import 'package:odc_project/core/network/dio_helper.dart';
import 'features/intro/presentation/screens/splash_screen.dart';

Future<void> main() async {
  // Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  // Main App Starts here...
  runApp(const SplashScreen());
}