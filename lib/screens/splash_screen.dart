import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_user_app/constants.dart';
import 'package:multi_user_app/screens/login_screen.dart';
import 'package:multi_user_app/screens/tekken_screen.dart';
import 'package:multi_user_app/screens/genshin_screen.dart';
import 'package:multi_user_app/screens/dota_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLoggedin();
  }

  void isLoggedin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLoggedIn = sharedPreferences.getBool('isLoggedIn') ?? false;
    String userRole = sharedPreferences.getString('userRole') ?? '';
    if (isLoggedIn && userRole == 'Dota 2') {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DotaScreen(),
          ),
        );
      });
    } else if (isLoggedIn && userRole == 'Genshin Impact') {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GenshinScreen(),
          ),
        );
      });
    } else if (isLoggedIn && userRole == 'Tekken 7') {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TekkenScreen(),
          ),
        );
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: klightBlackColor,
      body: Center(
        child: Lottie.asset('assets/lottie/game.json'),
      ),
    );
  }
}
