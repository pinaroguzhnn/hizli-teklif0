import 'package:flutter/material.dart';
import 'dart:async';
import 'third_screen.dart'; // 1. Tanıtım (Hoş Geldiniz) ekranı

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // 3 saniye sonra 1. Tanıtım ekranı olan ThirdScreen'e geçer
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ThirdScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0B2545);

    return const Scaffold(
      backgroundColor: darkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Yükleniyor...",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}