import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF7), // Krem hangat ala kafe
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. HERO SECTION (Background Foto Estetik + Tema Cokelat Elegan)
            Container(
              width: double.infinity,
              height: 480,
              child: Stack(
                children: [
                  // LAPISAN 1: GAMBAR BACKGROUND
                  Positioned.fill(
                    child: Image.asset(
                      'assets/Gambar Home Page.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),

                  // LAPISAN 2: OVERLAY COKLAT GELAP ELEGAN
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF3E2723).withOpacity(0.55),
                      ),
                    ),
                  ),

                  // LAPISAN 3: KONTEN TEKS & LOGO
                  Positioned.fill(
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // LOGO KANTIN DI HALAMAN UTAMA
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white.withOpacity(0.6), width: 2.5),
                                image: const DecorationImage(
                                  image: AssetImage('assets/logo kantin.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Good Food, Good Mood',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFD7CCC8), // Krem lembut
                                fontStyle: FontStyle.italic,
                                letterSpacing: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Kantin Bu Sari 🍲',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Nikmati kelezatan masakan rumahan autentik dengan cita rasa istimewa, higienis, dan harga ramah di kantong.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.9),
                                height: 1.4,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/menu');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4A3B32), // Tombol cokelat tua elegan
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 32),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 2,
                                ),
                                child: const Text(
                                  'JELAJAHI MENU LEZAT ➔',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 2. BAGIAN KEUNGGULAN (Why Choose Us)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Text(
                    'Why Choose Us? ⭐',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3E2723),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Kami berkomitmen memberikan kualitas dan kenyamanan terbaik untuk setiap pelanggan.',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _buildInfoCard(Icons.local_fire_department, 'Selalu Fresh', 'Dimasak dadakan setiap hari')),
                      const SizedBox(width: 16),
                      Expanded(child: _buildInfoCard(Icons.verified, 'Higienis & Sehat', 'Bahan pilihan berkualitas')),
                      const SizedBox(width: 16),
                      Expanded(child: _buildInfoCard(Icons.savings, 'Ramah di Kantong', 'Pas untuk dompet mahasiswa')),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),

            // Footer Sederhana
            Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xFFF3EDE2),
              width: double.infinity,
              child: const Text(
                '© 2026 Kantin Bu Sari. All Rights Reserved.',
                style: TextStyle(color: Color(0xFF8D6E63), fontSize: 11),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Kotak Informasi Keunggulan
  Widget _buildInfoCard(IconData icon, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.brown.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF8D6E63), size: 28),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF3E2723)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: const TextStyle(color: Colors.grey, fontSize: 11, height: 1.3),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}