import 'package:flutter/material.dart';
import 'login_screen.dart';

class AppleRegisterScreen extends StatelessWidget {
  const AppleRegisterScreen({super.key});

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
              const Icon(Icons.apple, size: 80, color: darkBlue),
              const SizedBox(height: 24),
              const Text("Apple Kimliği ile Kayıt", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: darkBlue)),
              const SizedBox(height: 16),
              const Text("Hızlı Teklif uygulaması, kayıt işlemi için Apple Kimliğinizi kullanacak.", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.5)),
              const Spacer(),
              SizedBox(width: double.infinity, height: 50, child: ElevatedButton(onPressed: () { Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false); }, style: ElevatedButton.styleFrom(backgroundColor: darkBlue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: const Text("Onayla ve Devam Et", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)))),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}