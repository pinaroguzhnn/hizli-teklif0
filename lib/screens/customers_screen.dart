import 'package:flutter/material.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0B2545);
    // Üst kısımdaki hafif yeşilimsi/gri arka plan rengi
    const Color topBgColor = Color(0xFFF2F5F2); 

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. ÜST ALAN (Appbar ve Profil)
            Container(
              color: topBgColor,
              padding: const EdgeInsets.only(top: 50, left: 24, right: 24, bottom: 24), // SafeArea yerine manuel boşluk
              child: Column(
                children: [
                  // Appbar Satırı
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu, size: 28, color: darkBlue),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const Text(
                        "Hızlı Teklif",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: darkBlue),
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications_none, size: 28, color: darkBlue),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Profil Karşılama Satırı
                  Row(
                    children: [
                      // Eğer profil resminiz yoksa AssetImage yerine Icon kullanabilirsiniz
                      const CircleAvatar(
                        radius: 26,
                        backgroundImage: AssetImage('assets/profile.png'), 
                        // Profil resmi assets'de yoksa alttaki satırı aktif edebilirsiniz:
                        // backgroundColor: Colors.blueGrey, child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Merhaba, Pınar!",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: darkBlue),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Bugün 8 aktif teklifin bulunuyor.",
                            style: TextStyle(fontSize: 13, color: darkBlue.withValues(alpha: 0.7)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 2. ARAMA VE FİLTRELEME ÇUBUĞU
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  const Icon(Icons.search, color: darkBlue),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Ara...",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 4),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: Colors.black12, // Dikey çizgi ayırıcı
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: const [
                          Icon(Icons.tune, size: 18, color: Colors.black54),
                          SizedBox(width: 6),
                          Text("Filtrele", style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 3. MÜŞTERİ LİSTESİ
            _buildCustomerCard("Ahmet Yılmaz", "Sektör/Yazılım", "AY"),
            _buildCustomerCard("Selin Tunalı", "Sektör /E-Ticaret", "ST"),
            _buildCustomerCard("Kerem Tunç", "Yazılım / Bilişim", "KT"),
            _buildCustomerCard("Ayşe Yılmaz", "Gıda / Tarım", "AY"),
            _buildCustomerCard("Burak Kaya", "Eğitim / Danışmanlık", "BK"),

            const SizedBox(height: 16),

            // 4. DAHA FAZLA GÖR BUTONU
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text(
                "Daha Fazla Gör",
                style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            
            const SizedBox(height: 32), // Alt boşluk
          ],
        ),
      ),
    );
  }

  // Müşteri Kartı Oluşturan Yardımcı Widget
  Widget _buildCustomerCard(String name, String sector, String initials) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 24, right: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9), // Kart arka planı (açık gri)
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF5A5A5A), // Koyu gri yuvarlak
            radius: 24,
            child: Text(
              initials,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0B2545), fontSize: 15),
              ),
              const SizedBox(height: 4),
              Text(
                sector,
                style: const TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}