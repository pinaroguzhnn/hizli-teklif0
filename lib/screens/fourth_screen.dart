import 'package:flutter/material.dart';
import 'fifth_screen.dart';
import 'sixth_screen.dart'; // Atla butonu yönlendirmesi için eklendi

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0B2545);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // 1. ÜST KISIM: Başlık ve Açıklama (Ortalı)
              const Text(
                "Bir Kaç Dokunuşla\nTeklif Oluştur",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Firma bilgilerinizi girin, fiyatları ekleyin ve profesyonel teklifinizi saniyeler içinde hazırlayın.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // 2. GÖRSEL KISMI: Telefon (Büyük ve Ortalı)
              Center(
                child: Image.asset(
                  'assets/phone.png', 
                  height: 400, 
                  fit: BoxFit.contain,
                ),
              ),

              const Spacer(),

              // 3. ALT KISIM: Atla, Noktalar, İleri Butonu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Atla Butonu (6. Sayfaya Gider)
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SixthScreen()),
                      );
                    },
                    child: const Text(
                      'Atla',
                      style: TextStyle(
                        color: darkBlue, 
                        fontSize: 19, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  
                  // Sayfa gösterge noktaları 
                  Row(
                    children: [
                      _buildDot(false, darkBlue),
                      const SizedBox(width: 8),
                      _buildDot(true, darkBlue), // 2. Sayfa Aktif
                      const SizedBox(width: 8),
                      _buildDot(false, darkBlue),
                      const SizedBox(width: 8),
                      _buildDot(false, darkBlue),
                    ],
                  ),

                  // İleri Butonu (5. Sayfaya Gider)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FifthScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: const Row(
                      children: [
                        Text('İleri', style: TextStyle(color: Colors.white, fontSize: 19)),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive, Color color) {
    return Container(
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? color : color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}