// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';

ThemeData ThemedataLight = ThemeData(
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  accentColor:  Color.fromARGB(200, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
  primaryColor: Color.fromARGB(250, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
  dividerColor: Colors.black12,
  focusColor: const Color.fromARGB(71, 0, 0, 0),
  brightness: Brightness.light,
  cardColor: Colors.black87,
  hintColor: Colors.black26,
  
);

ThemeData ThemedataDark = ThemeData(
  backgroundColor: const Color(0xFF121212),
  scaffoldBackgroundColor: const Color(0xFF121212),
  dividerColor: Colors.white12,
  focusColor: const Color.fromARGB(61, 255, 255, 255),
  accentColor: Color.fromARGB(200, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
  primaryColor: Color.fromARGB(250, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
  brightness: Brightness.dark,
  cardColor: Colors.white ,
  hintColor: const Color.fromARGB(97, 255, 255, 255),
  
);
