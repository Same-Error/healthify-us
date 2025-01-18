

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthy_recipies/view/dashboard.dart';
import 'package:healthy_recipies/view/login.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState() {
    Timer(Duration(seconds: 4),(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));

          // getData();

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/splash.json"),
      ),
    );
  }
}