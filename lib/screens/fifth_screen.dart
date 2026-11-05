import 'package:flutter/material.dart';
import 'sixth_screen.dart';

class FifthScreen extends StatelessWidget {
  const FifthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0B2545);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text("Tüm Tekliflerin\nTek Yerde", textAlign: TextAlign.center, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: darkBlue, height: 1.2)),
              const SizedBox(height: 16),
              const Text("Aktif, onaylanan ve taslak tekliflerinizi\nkolayca takip edin ve yönetin.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black54)),
              const Spacer(),
              
              // İstatistik Kartları
              Row(
                children: [
                  Expanded(child: _buildCard("Aktif Teklif", "18", "Devam eden teklifler", Icons.article_outlined, darkBlue)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard("Onaylandı", "142", "Bu ay onaylanan", Icons.check_circle_outline, const Color(0xFF65A30D))),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard("Beklemede", "7", "Onay bekleyen teklifler", Icons.access_time, const Color(0xFF94A3B8))),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard("Süresi dolan", "4", "Süresi dolan teklifler", Icons.warning_amber_rounded, const Color(0xFF3B82F6))),
                ],
              ),
              
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SixthScreen()));
                    }, 
                    child: const Text('Atla', style: TextStyle(color: darkBlue, fontSize: 19, fontWeight: FontWeight.bold))
                  ),
                  Row(
                    children: [
                      _buildDot(false, darkBlue), const SizedBox(width: 8),
                      _buildDot(false, darkBlue), const SizedBox(width: 8),
                      _buildDot(true, darkBlue), const SizedBox(width: 8),
                      _buildDot(false, darkBlue),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SixthScreen()));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: darkBlue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                    child: const Row(children: [Text('İleri', style: TextStyle(color: Colors.white, fontSize: 19)), SizedBox(width: 8), Icon(Icons.arrow_forward, color: Colors.white, size: 18)]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value, String sub, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          Row(children: [Icon(icon, color: Colors.white, size: 20), const SizedBox(width: 6), Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))]),
          const SizedBox(height: 4),
          Text(sub, style: const TextStyle(color: Colors.white54, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive, Color color) {
    return Container(width: isActive ? 24 : 8, height: 8, decoration: BoxDecoration(color: isActive ? color : color.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(4)));
  }
}