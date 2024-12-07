import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:volleyapp/core/constants/colors.dart';
import 'package:volleyapp/features/home/presentation/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
