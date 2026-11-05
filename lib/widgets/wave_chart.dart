import 'package:flutter/material.dart';

class WaveChart extends StatelessWidget {
  final Color color;
  const WaveChart({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      // Yükseklik 100'den 150'ye çıkarıldı, grafik yukarı doğru uzayabilecek
      size: const Size(double.infinity, 150),
      painter: _WavePainter(color: color),
    );
  }
}

class _WavePainter extends CustomPainter {
  final Color color;
  _WavePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withValues(alpha: 0.85), // Üst kısım lacivert
          color.withValues(alpha: 0.0),  // Alt kısım tam şeffaf
        ],
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // Dalga rotası daha yukarıdan başlatıldı (Y değerleri küçültüldü)
    path.moveTo(0, size.height * 0.65); // Sol başlangıç noktası
    
    // İlk tepe noktası ve orta kısımdaki hafif çukur
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.35, 
        size.width * 0.5, size.height * 0.45);
        
    // Sağa doğru sürekli yükseliş (Figma'daki sağ üst köşe hedefi)
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.35, 
        size.width, size.height * 0.2); // Sağ bitiş en yukarıda
        
    path.lineTo(size.width, size.height); // Sağ alt köşeye in
    path.lineTo(0, size.height); // Sol alt köşeye dön
    path.close(); // İçi boyansın diye kapat

    canvas.drawPath(path, paint);
    
    // Üstteki belirgin lacivert çizgi
    final linePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
      
    final linePath = Path();
    linePath.moveTo(0, size.height * 0.65);
    linePath.quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.45);
    linePath.quadraticBezierTo(size.width * 0.75, size.height * 0.35, size.width, size.height * 0.2);
    
    canvas.drawPath(linePath, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}