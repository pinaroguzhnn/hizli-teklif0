import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart'; // Anasayfa bağlantısı eklendi

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0B2545);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, 
        elevation: 0, 
        iconTheme: const IconThemeData(color: darkBlue)
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLogo(),
              const SizedBox(height: 32),
              const Text(
                "E - Posta Adresinizi\nDogrulayın",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: darkBlue, height: 1.3),
              ),
              const SizedBox(height: 16),
              const Text(
                "p**********@G*****.com\nadresine bir dogrulama kodu gönderdik lutfen kodu\nasagıya giriniz.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.5, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOtpBox(context, darkBlue),
                  _buildOtpBox(context, darkBlue),
                  _buildOtpBox(context, darkBlue),
                  _buildOtpBox(context, darkBlue),
                ],
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerRight,
                child: Text("(58 s)", style: TextStyle(color: Colors.black54, fontSize: 14)),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {},
                child: const Text("Yeniden Gönder", style: TextStyle(color: Colors.black45, fontSize: 14)),
              ),
              const SizedBox(height: 24),
              
              // DOĞRULA BUTONU YÖNLENDİRMESİ
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Giriş başarılı olunca geçmiş sayfaları silip direkt Anasayfaya geçer
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkBlue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Doğrula", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(color: const Color(0xFFF4F6F4), borderRadius: BorderRadius.circular(20)),
      child: const Center(child: Text('ht', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Color(0xFF0B2545)))),
    );
  }

  Widget _buildOtpBox(BuildContext context, Color activeColor) {
    return SizedBox(
      height: 64,
      width: 64,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.black26)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.black26)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: activeColor, width: 2)),
          counterText: '', 
        ),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1), 
          FilteringTextInputFormatter.digitsOnly, 
        ],
      ),
    );
  }
}