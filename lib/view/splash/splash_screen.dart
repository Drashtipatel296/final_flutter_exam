import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
        Get.to(HomeScreen());
      },
    );

    return Scaffold(
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/cart.png'),
                  fit: BoxFit.cover,
              ),
          ),
        ),
      ),
    );
  }
}
