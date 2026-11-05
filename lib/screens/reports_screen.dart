import 'dart:math';

import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0B2545);
    const Color topBgColor = Color(0xFFF2F5F2);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: topBgColor,
              padding: const EdgeInsets.only(
                  top: 50, left: 24, right: 24, bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        size: 28, color: darkBlue),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const Text(
                    "Raporlar",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: darkBlue),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none,
                        size: 28, color: darkBlue),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Bu Ay",
                            style: TextStyle(
                                fontSize: 18, color: Colors.black87)),
                        SizedBox(width: 24),
                        Icon(Icons.keyboard_arrow_down,
                            color: Colors.black87),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                            "Toplam Teklif",
                            Icons.insert_drive_file_outlined,
                            "245",
                            "Bu ay oluşturulan\ntoplam teklif",
                            darkBlue),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildStatCard(
                            "Toplam Teklif Tutarı",
                            Icons.credit_card,
                            "250.000",
                            "Bu ay oluşturulan\ntoplam tutar",
                            darkBlue),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildStatCard(
                            "Onay Oranı",
                            Icons.check_circle_outline,
                            "%74",
                            "Onaylanan teklif oranı",
                            darkBlue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Teklif Durumu",
                            style: TextStyle(
                                color: darkBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 140,
                              height: 140,
                              child: CustomPaint(
                                painter: DonutChartPainter(),
                              ),
                            ),
                            const SizedBox(width: 40),
                            Column(
                              children: [
                                _buildLegendDot(darkBlue),
                                _buildLegendDot(const Color(0xFF7CB342)),
                                _buildLegendDot(const Color(0xFF4DB6AC)),
                                _buildLegendDot(const Color(0xFF90A4AE)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black38),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                      ),
                      child: const Text("Daha Fazla Gör",
                          style: TextStyle(
                              color: darkBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, IconData icon, String value,
      String subtitle, Color iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 10,
                color: Colors.black87,
                fontWeight: FontWeight.w600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor, size: 22),
              const SizedBox(width: 4),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    value,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 8, color: Colors.black87, height: 1.2),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendDot(Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const strokeWidth = 35.0;
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    paint.color = const Color(0xFF0B2545);
    canvas.drawArc(rect, -pi / 2, 2 * pi * 0.41, false, paint);
    _drawText(canvas, center, radius, -pi / 2, 2 * pi * 0.41, "41%",
        Colors.white);

    paint.color = const Color(0xFF90A4AE);
    canvas.drawArc(
        rect, -pi / 2 + (2 * pi * 0.41), 2 * pi * 0.26, false, paint);
    _drawText(canvas, center, radius, -pi / 2 + (2 * pi * 0.41),
        2 * pi * 0.26, "26%", Colors.black87);

    paint.color = const Color(0xFF4DB6AC);
    canvas.drawArc(
        rect, -pi / 2 + (2 * pi * 0.67), 2 * pi * 0.15, false, paint);
    _drawText(canvas, center, radius, -pi / 2 + (2 * pi * 0.67),
        2 * pi * 0.15, "15%", Colors.black87);

    paint.color = const Color(0xFF7CB342);
    canvas.drawArc(
        rect, -pi / 2 + (2 * pi * 0.82), 2 * pi * 0.18, false, paint);
    _drawText(canvas, center, radius, -pi / 2 + (2 * pi * 0.82),
        2 * pi * 0.18, "18%", Colors.black87);
  }

  void _drawText(Canvas canvas, Offset center, double radius,
      double startAngle, double sweepAngle, String text, Color textColor) {
    final angle = startAngle + (sweepAngle / 2);
    final x = center.dx + radius * cos(angle);
    final y = center.dy + radius * sin(angle);

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
            color: textColor, fontSize: 9, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    textPainter.paint(
      canvas,
      Offset(x - (textPainter.width / 2), y - (textPainter.height / 2)),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}