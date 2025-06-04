import 'package:flutter/material.dart';
import 'package:student/app.dart';
import 'package:student/servicelocator/service_locator.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized(); //load to all dependency in the app
  await initDependencies();
  runApp(const MyApp(),);
}

       