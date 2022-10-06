import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallove/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:const [
             Text('Wallove',style: TextStyle(fontFamily: 'Odin',color: Color.fromARGB(255, 28, 187, 250),fontSize: 50),),
             Text('Made With ❤️ By Najeer',),
          ],
        ),
      ),
    );
  }
}
