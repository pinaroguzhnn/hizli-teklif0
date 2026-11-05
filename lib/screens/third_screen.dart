import 'package:flutter/material.dart';
import 'fourth_screen.dart'; // İleri butonu 2. Tanıtım ekranına gider
import 'sixth_screen.dart';  // Atla butonu Giriş ekranına gider

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0B2545);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // 1. LOGO VE MARKA
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF2EE),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Center(
                        child: Text(
                          'ht',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: darkBlue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "HIZLI TEKLİF",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: darkBlue,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // 2. AÇIKLAMA YAZILARI (SOLA HİZALI)
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hızlı Teklif' e\nHoş Geldiniz.",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: darkBlue,
                        height: 1.15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Dakikalar içinde profesyonel teklifler hazırlayın ve müşterilerinize hızlıca gönderin",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // 3. BÜYÜK ROBOT GÖRSELİ
              Center(
                child: Image.asset(
                  'assets/robot.png',
                  height: 270,
                  fit: BoxFit.contain,
                ),
              ),

              const Spacer(),

              // 4. ALT MENÜ (ATLA, HALKA NOKTALAR, İLERİ)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // Daire Şeklindeki Noktalar (1. Nokta Aktif)
                  Row(
                    children: [
                      _buildCircleDot(true, darkBlue),
                      const SizedBox(width: 8),
                      _buildCircleDot(false, darkBlue),
                      const SizedBox(width: 8),
                      _buildCircleDot(false, darkBlue),
                      const SizedBox(width: 8),
                      _buildCircleDot(false, darkBlue),
                    ],
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FourthScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkBlue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'İleri',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

  // Tasarımdaki çember/halka şeklindeki noktalar
  Widget _buildCircleDot(bool isActive, Color color) {
    return Container(
      width: 13,
      height: 13,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? color : Colors.transparent,
        border: Border.all(
          color: color,
          width: 1.5,
        ),
      ),
    );
  }
}