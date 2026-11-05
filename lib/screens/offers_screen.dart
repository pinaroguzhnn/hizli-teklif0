import 'package:flutter/material.dart';
import 'new_draft_screen.dart'; 

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final Color darkBlue = const Color(0xFF0B2545);
  String selectedFilter = "Tümü";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Appbar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.menu, size: 28, color: darkBlue), onPressed: () {}),
                Text("Hızlı Teklif", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: darkBlue)),
                Stack(
                  children: [
                    IconButton(icon: Icon(Icons.notifications_none, size: 28, color: darkBlue), onPressed: () {}),
                    Positioned(right: 8, top: 8, child: Container(padding: const EdgeInsets.all(4), decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle), child: const Text("2", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)))),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 2. Profil
            Row(
              children: [
                const CircleAvatar(radius: 28, backgroundImage: AssetImage('assets/robot.png')),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Merhaba, Pınar!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkBlue)),
                    const SizedBox(height: 4),
                    Text("Bugün 8 aktif teklifin bulunuyor.", style: TextStyle(fontSize: 13, color: Colors.blueGrey.shade600)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 3. Arama ve Filtre Menüsü
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black12)),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.black45),
                  const SizedBox(width: 12),
                  const Expanded(child: TextField(decoration: InputDecoration(hintText: "Ara...", border: InputBorder.none, hintStyle: TextStyle(color: Colors.black38)))),
                  Container(height: 30, width: 1, color: Colors.black12, margin: const EdgeInsets.symmetric(horizontal: 12)),
                  
                  PopupMenuButton<String>(
                    offset: const Offset(0, 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    icon: const Icon(Icons.tune, color: Colors.black54),
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: '1', child: Text('Teslimatı Yaklaşan', style: TextStyle(fontSize: 13))),
                      const PopupMenuItem(value: '2', child: Text('En son onaylanan', style: TextStyle(fontSize: 13))),
                      const PopupMenuItem(value: '3', child: Text('Yüksek Maliyetli', style: TextStyle(fontSize: 13))),
                      const PopupMenuItem(value: '4', child: Text('Süresi Dolmak Üzere olanlar', style: TextStyle(fontSize: 13))),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 4. Filtreler
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip("Tümü"),
                  _buildFilterChip("Aktif"),
                  _buildFilterChip("Onaylandı"),
                  _buildFilterChip("Beklemede"),
                  _buildFilterChip("Taslak"),
                  _buildFilterChip("Süresi Dolan"),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 5. Dinamik Teklif Listesi
            ..._buildFilteredList(),

            const SizedBox(height: 16),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                child: const Text("Daha Fazla Gör", style: TextStyle(color: Colors.black87)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = selectedFilter == label;
    
    Color getBackgroundColor() {
      if (!isSelected) return Colors.grey.shade200;
      switch (label) {
        case "Tümü": return Colors.grey.shade300;
        case "Aktif": return const Color(0xFF90CAF9);
        case "Onaylandı": return const Color(0xFFA5D6A7);
        case "Beklemede": return const Color(0xFFB0BEC5);
        case "Taslak": return const Color(0xFF80CBC4);
        case "Süresi Dolan": return const Color(0xFFBCAAA4);
        default: return darkBlue;
      }
    }

    return GestureDetector(
      onTap: () => setState(() => selectedFilter = label),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(color: getBackgroundColor(), borderRadius: BorderRadius.circular(8)),
        child: Text(label, style: TextStyle(color: isSelected ? darkBlue : Colors.black54, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, fontSize: 13)),
      ),
    );
  }

  List<Widget> _buildFilteredList() {
    List<Widget> items = [];

    if (selectedFilter == "Taslak") {
      items.add(
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NewDraftScreen()));
            },
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text("Yeni Taslak Oluştur", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF60BDB0), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
        ),
      );
      
      items.add(_buildExpandedDraftCard("Trend E-Ticaret Ltd. Şti.", "22 Temmuz 2026", "15.500"));
      items.add(_buildOfferCard("Atlas Yapı ve Proje", "20 Temmuz 2026", "Taslak", const Color(0xFF60BDB0), "Logo & Marka Tasarımı", "15.000"));
    } else if (selectedFilter == "Tümü") {
      items.add(_buildOfferCard("Atlas Mimarlık", "22 Temmuz 2026", "Onay bekliyor", const Color(0xFF94A3B8), "Web Tasarımı Projesi", "18.500"));
      items.add(_buildOfferCard("TechNova Yazılım", "21 Temmuz 2026", "Aktif", darkBlue, "Mobil Uygulama", "45.000"));
    } else if (selectedFilter == "Aktif") {
      items.add(_buildOfferCard("TechNova Yazılım", "21 Temmuz 2026", "Aktif", darkBlue, "Mobil Uygulama", "45.000"));
    } else if (selectedFilter == "Onaylandı") {
      items.add(_buildOfferCard("Doğa Tarım", "20 Temmuz 2026", "Onaylandı", const Color(0xFFA5D6A7), "Kurumsal Kimlik", "12.000"));
    } else if (selectedFilter == "Beklemede") {
      items.add(_buildOfferCard("Atlas Mimarlık", "22 Temmuz 2026", "Onay bekliyor", const Color(0xFFB0BEC5), "Web Tasarımı Projesi", "18.500"));
    } else if (selectedFilter == "Süresi Dolan") {
      items.add(_buildOfferCard("Zirve Lojistik", "15 Temmuz 2026", "Süresi doldu", const Color(0xFFBCAAA4), "SEO Optimizasyonu", "8.500"));
    }
    return items;
  }

  // Fonksiyon adının başında alt çizgi olmalı (_)
  String _getInitials(String companyName) {
    List<String> words = companyName.trim().split(' ');
    if (words.isEmpty) return "X";
    if (words.length == 1) return words[0][0].toUpperCase();
    return "${words[0][0]}${words[1][0]}".toUpperCase();
  }

  Widget _buildOfferCard(String company, String date, String status, Color statusColor, String project, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black12)),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: statusColor, radius: 20, child: Text(_getInitials(company), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14))),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(company, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), const SizedBox(height: 4), Text(date, style: const TextStyle(fontSize: 12, color: Colors.black54))])),
              Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: statusColor, borderRadius: BorderRadius.circular(6)), child: Text(status, style: TextStyle(color: statusColor == darkBlue ? Colors.white : darkBlue, fontSize: 12, fontWeight: FontWeight.bold))),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 12.0), child: Divider(height: 1, color: Colors.black12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(project, style: const TextStyle(color: Colors.black54, fontSize: 14)),
              Row(children: [Text("₺$price", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), const SizedBox(width: 4), const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black54)]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedDraftCard(String company, String date, String price) {
    const Color tealColor = Color(0xFF60BDB0);
    const Color tealShadow = Color(0x1A60BDB0);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: tealColor, width: 1.5), boxShadow: [BoxShadow(color: tealShadow, blurRadius: 10, offset: const Offset(0, 4))]),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: tealColor, radius: 20, child: Text(_getInitials(company), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14))),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(company, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), const SizedBox(height: 4), Text(date, style: const TextStyle(fontSize: 12, color: Colors.black54))])),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: tealColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "Taslak",
                  style: TextStyle(
                    color: darkBlue,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 12.0), child: Divider(height: 1, color: Colors.black12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Web Tasarımı Projesi", style: TextStyle(color: Colors.black54, fontSize: 14)),
              Text("₺$price", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, height: 45, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00897B), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Düzenlemeye Devam Et", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), SizedBox(width: 8), Icon(Icons.arrow_forward, color: Colors.white, size: 18)]))),
          const SizedBox(height: 8),
          SizedBox(width: double.infinity, height: 45, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFAAA5), elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Sil", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), SizedBox(width: 8), Icon(Icons.delete_outline, color: Colors.white, size: 18)]))),
        ],
      ),
    );
  }
}