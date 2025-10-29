import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ticket_with_celebrity/page/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), _navigateToHome);
  }

  void _navigateToHome() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '누구할래?',
              style:TextStyle(color: Color(0xFFFF77A9),fontWeight: FontWeight.bold,fontSize: 50),
            ),
            Icon(Icons.favorite, size: 50, color: Color(0xFFFF77A9)),
          ],
        ),
      ),
    );
  }
}
