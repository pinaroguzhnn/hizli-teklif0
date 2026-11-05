import 'package:flutter/material.dart';
import 'fourth_screen.dart';
import 'sixth_screen.dart'; 

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0B2545);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F6F4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          'ht',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: darkBlue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'HIZLI TEKLİF',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: darkBlue,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),

              const Text(
                "Hızlı Teklif'e\nHoş Geldiniz.",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Dakikalar içinde profesyonel teklifler hazırlayın ve müşterilerinize hızlıca gönderin.",
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),

              const Spacer(), 

              Center(
                child: Image.asset(
                  'assets/robot.png',
                  height: 400, 
                  fit: BoxFit.contain,
                ),
              ),

              const Spacer(), 

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
                        fontSize: 19, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  
                  Row(
                    children: [
                      _buildDot(true, darkBlue),
                      const SizedBox(width: 8),
                      _buildDot(false, darkBlue),
                      const SizedBox(width: 8),
                      _buildDot(false, darkBlue),
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