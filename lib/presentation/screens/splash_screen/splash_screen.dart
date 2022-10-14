import 'dart:async';
import 'package:flutter/material.dart';

import '../../widgets/app_title.dart';
import '../auth/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: AppTitle()),
    );
  }
}
