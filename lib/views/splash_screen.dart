import 'dart:async';
import 'package:apitest/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;
  double _scale = 0.8;

  @override
  void initState() {
    super.initState();

    // Start animation after slight delay
    Timer(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1;
        _scale = 1.0;
      });
    });

    // Navigate to next screen after 2.5 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Or your brand color
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: _scale, end: _scale),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutBack,
          builder: (context, scale, child) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              opacity: _opacity,
              child: Transform.scale(
                scale: scale,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/radio.svg', // Replace with your logo
                      height: 120,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'My App',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
