import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// import 'package:flutter/foundation.dart';
// import 'dart:io';

import 'package:volleyapp/core/constants/colors.dart';
// import 'package:volleyapp/core/data/database_service.dart';
import 'package:volleyapp/features/home/presentation/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
  //   sqfliteFfiInit();
  //   databaseFactory = databaseFactoryFfi;
  // }

  // DatabaseService.instance.database;

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeoVolley',
      theme: ThemeData(
        primaryColor: AppColors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
        fontFamily: "ConcertOne",
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
