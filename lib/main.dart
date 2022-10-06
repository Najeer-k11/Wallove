

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallove/splas.dart';
import 'themes.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemedataLight,
      darkTheme: ThemedataDark,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
