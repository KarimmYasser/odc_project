import 'package:flutter/material.dart';
import 'package:odc_project/core/network/dio_helper.dart';
import 'core/db/cache/cache_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'core/db/local_db/local_db_helper.dart';
import 'features/intro/presentation/screens/splash_screen.dart';

Future<void> main() async {
  // Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize sqflite_common_ffi
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  DioHelper.init();
  await SQLHelper.initDb();
  await CacheHelper.init();

  // Main App Starts here...
  runApp(const SplashScreen());
}