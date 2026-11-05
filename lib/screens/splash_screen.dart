import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 3 saniye sonra senin tasarladığın lacivert ekrandan giriş ekranına geçiş yapar
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0B2545);

    return Scaffold(
      backgroundColor: darkBlue,
      body: SafeArea(
        child: Stack(
          children: [
            // Alt kısımdaki dalgalı çizgiler veya arka plan detayları için
            Positioned.fill(
              child: CustomPaint(
                painter: WavePainter(),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Kutusu
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F6F4),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Center(
                      child: Text(
                        'ht',
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: darkBlue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // HIZLI TEKLİF Başlığı
                  const Text(
                    "HIZLI TEKLİF",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Alt Açıklama Metni
                  const Text(
                    "Teklifini hızlı oluştur,\nfırsatları kaçırma!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Görseldeki dalgalı çizgilerin estetiğini veren yardımcı çizici sınıf
class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final Path path = Path();
    for (double i = 0; i < 6; i++) {
      path.moveTo(0, size.height * 0.7 + (i * 15));
      path.quadraticBezierTo(
        size.width * 0.4,
        size.height * 0.6 + (i * 15),
        size.width,
        size.height * 0.8 + (i * 15),
      );
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}