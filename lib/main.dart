import 'package:flutter/material.dart';
import 'package:odc_project/core/network/dio_helper.dart';
import 'app.dart';

Future<void> main() async {
  // Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  // Main App Starts here...
  runApp(const App());
}