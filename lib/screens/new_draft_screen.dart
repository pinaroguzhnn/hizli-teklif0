import 'package:flutter/material.dart';

class NewDraftScreen extends StatelessWidget {
  const NewDraftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0B2545);
    const Color tealColor = Color(0xFF60BDB0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: darkBlue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Yeni Taslak", style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none, color: darkBlue), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Yeni Taslak Oluştur", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: darkBlue)),
              const SizedBox(height: 8),
              const Text("Taslak oluşturmak için bilgileri doldurun", style: TextStyle(fontSize: 14, color: Colors.black54)),
              const SizedBox(height: 24),

              _buildInputLabel("Taslak Adı"),
              _buildTextField("Örn: Web Tasarımı Teklifi", counterText: "0/100"),
              const SizedBox(height: 16),

              _buildInputLabel("Müşteri Adı"),
              _buildTextField("Müşterinin adını giriniz"),
              const SizedBox(height: 16),

              _buildInputLabel("Kategori"),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(8)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: const Text("Kategori seçin", style: TextStyle(color: Colors.black38, fontSize: 14)),
                    items: const [], // Seçenekler buraya eklenebilir
                    onChanged: (value) {},
                  ),
                ),
              ),
              const SizedBox(height: 16),

              _buildInputLabel("Açıklama"),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Kısa bir açıklama ekleyin...",
                  hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
                  counterText: "0/500",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.black12)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.black12)),
                ),
              ),
              const SizedBox(height: 16),

              _buildInputLabel("Son Teslim Tarihi"),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Tarih Seçiniz",
                  hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
                  suffixIcon: const Icon(Icons.calendar_today_outlined, color: Colors.black45, size: 20),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.black12)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.black12)),
                ),
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tealColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Oluştur", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0B2545))),
    );
  }

  Widget _buildTextField(String hint, {String? counterText}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
        counterText: counterText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.black12)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.black12)),
      ),
    );
  }
}