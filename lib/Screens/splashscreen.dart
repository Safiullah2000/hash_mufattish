import 'package:flutter/material.dart';
import 'package:hash_mufattish/Screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 7), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => LoginScreen()));
    });
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Image.asset(
          "assets/Splash.gif",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
