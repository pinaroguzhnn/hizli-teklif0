import 'package:flutter/material.dart';

class GoogleLoginScreen extends StatelessWidget {
  const GoogleLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0B2545);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, iconTheme: const IconThemeData(color: darkBlue)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(width: 80, height: 80, decoration: BoxDecoration(color: const Color(0xFFF4F6F4), borderRadius: BorderRadius.circular(20)), child: const Center(child: Text('ht', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Color(0xFF0B2545))))),
              const Spacer(),
              const Icon(Icons.g_mobiledata, size: 100, color: darkBlue),
              const SizedBox(height: 16),
              const Text("Google ile Giriş Yap", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: darkBlue)),
              const SizedBox(height: 16),
              const Text("Hızlı Teklif uygulamasına güvenli bir şekilde giriş yapmak için Google hesabınıza bağlanılıyor.", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.5)),
              const Spacer(),
              SizedBox(width: double.infinity, height: 50, child: ElevatedButton(onPressed: () { }, style: ElevatedButton.styleFrom(backgroundColor: darkBlue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: const Text("Girişi Onayla", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)))),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}