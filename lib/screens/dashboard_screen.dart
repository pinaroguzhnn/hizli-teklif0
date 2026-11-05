import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/wave_chart.dart'; 

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0B2545);

    // Firebase'den anlık olarak giriş yapmış olan kullanıcıyı (ve adını) alıyoruz
    final user = FirebaseAuth.instance.currentUser;
    // Eğer kayıt olurken isim alınmışsa (displayName doluysa) onu, boşsa 'Kullanıcı' metnini kullanır
    final String userName = user?.displayName ?? "Kullanıcı";

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Appbar Kısmı
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: const Icon(Icons.menu, size: 28, color: darkBlue), onPressed: () {}),
                const Text("Hızlı Teklif", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: darkBlue)),
                Stack(
                  children: [
                    IconButton(icon: const Icon(Icons.notifications_none, size: 28, color: darkBlue), onPressed: () {}),
                    Positioned(
                      right: 8, 
                      top: 8, 
                      child: Container(
                        padding: const EdgeInsets.all(4), 
                        decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle), 
                        child: const Text("2", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold))
                      )
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 2. Profil Karşılama
            Row(
              children: [
                const CircleAvatar(radius: 28, backgroundImage: AssetImage('assets/robot.png')), 
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Statik "Pınar" yerine giriş yapan kişinin Firebase'deki adı yazdırılır
                    Text("Merhaba, $userName!", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkBlue)),
                    const SizedBox(height: 4),
                    Text("Bugün 8 aktif teklifin bulunuyor.", style: TextStyle(fontSize: 13, color: Colors.blueGrey.shade600)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 3. Arama Çubuğu
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black12)),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.black45),
                  const SizedBox(width: 12),
                  const Expanded(child: TextField(decoration: InputDecoration(hintText: "Ara...", border: InputBorder.none, hintStyle: TextStyle(color: Colors.black38)))),
                  Container(height: 30, width: 1, color: Colors.black12, margin: const EdgeInsets.symmetric(horizontal: 12)),
                  TextButton.icon(onPressed: () {}, icon: const Icon(Icons.tune, size: 18, color: Colors.black54), label: const Text("Filtrele", style: TextStyle(color: Colors.black54))),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 4. İstatistik Kartları (2x2 Grid)
            Row(
              children: [
                Expanded(child: _buildStatCard("Aktif Teklif", "18", "Devam eden teklifler", Icons.insert_drive_file_outlined, darkBlue, Colors.white)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard("Onaylandı", "142", "Bu ay onaylanan", Icons.check_circle_outline, const Color(0xFF65A30D), Colors.white)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildStatCard("Beklemede", "7", "Onay bekleyen teklifler", Icons.schedule, const Color(0xFF94A3B8), Colors.white)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard("Süresi dolan", "4", "Süresi dolan teklifler", Icons.warning_amber_rounded, const Color(0xFF4A7DAB), Colors.white)),
              ],
            ),
            const SizedBox(height: 32),

            // 5. Grafik Alanı 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Bu Ay Teklif Grafiği", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: darkBlue)),
                Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.black12)), child: const Row(children: [Text("Bu Ay", style: TextStyle(fontSize: 12, color: Colors.black87)), SizedBox(width: 4), Icon(Icons.keyboard_arrow_down, size: 16)])),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(16), 
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05), 
                    blurRadius: 10, 
                    offset: const Offset(0, 4)
                  )
                ]
              ),
              child: Stack(
                children: [
                  const Positioned(
                    bottom: 0, 
                    left: 0, 
                    right: 0, 
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)), 
                      child: WaveChart(color: darkBlue)
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Teklif Sayısı", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: darkBlue)),
                        const Spacer(), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("56", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: darkBlue)),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
                              decoration: BoxDecoration(color: const Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(8)), 
                              child: const Text("%18", style: TextStyle(color: Color(0xFF166534), fontWeight: FontWeight.bold, fontSize: 12))
                            ),
                          ],
                        ),
                      ],
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

  Widget _buildStatCard(String title, String value, String sub, IconData icon, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: textColor, size: 24),
              const SizedBox(width: 8),
              Expanded(child: Text(title, style: TextStyle(color: textColor.withValues(alpha: 0.9), fontSize: 13, fontWeight: FontWeight.w500), maxLines: 1, overflow: TextOverflow.ellipsis)),
            ],
          ),
          const SizedBox(height: 12),
          Text(value, style: TextStyle(color: textColor, fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(sub, style: TextStyle(color: textColor.withValues(alpha: 0.7), fontSize: 11)),
        ],
      ),
    );
  }
}