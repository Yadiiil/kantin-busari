import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cart_data.dart';

class OrderPage extends StatefulWidget {
  final Map<String, dynamic> menuItem;

  const OrderPage({super.key, required this.menuItem});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int jumlah = 1;
  final TextEditingController catatanController = TextEditingController();

  void _showSuccessDialog(String namaMenu, int totalHarga) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: const Color(0xFFFDFBF7),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.brown.shade50, shape: BoxShape.circle, border: Border.all(color: Colors.brown.shade200)),
                  child: const Icon(Icons.check_rounded, size: 40, color: Color(0xFF4A3B32)),
                ),
                const SizedBox(height: 16),
                Text('Berhasil Masuk Keranjang!', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF3E2723)), textAlign: TextAlign.center),
                const SizedBox(height: 8),
                Text('$jumlah porsi $namaMenu telah ditambahkan ke keranjang belanja.', style: GoogleFonts.montserrat(fontSize: 13, color: Colors.grey), textAlign: TextAlign.center),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF4A3B32),
                          side: const BorderSide(color: Color(0xFF4A3B32)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text('Tambah Menu Lain', style: GoogleFonts.montserrat(fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A3B32),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text('Lihat Menu', style: GoogleFonts.montserrat(fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String namaMenu = widget.menuItem['name'] ?? 'Menu Pilihan';
    int hargaSatuan = widget.menuItem['price'] ?? 0;
    String hargaStr = widget.menuItem['priceStr'] ?? 'Rp 0';
    String deskripsi = widget.menuItem['desc'] ?? '';
    String imageUrl = widget.menuItem['image'] ?? '';

    int totalHarga = hargaSatuan * jumlah;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDFBF7),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF4A3B32)),
        title: Text(
          'DETAIL PESANAN',
          style: GoogleFonts.montserrat(
            color: const Color(0xFF4A3B32),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BANNER KANTIN BU SARI
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20.0),
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3E2723), Color(0xFF5D4037)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.brown.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4)),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white.withOpacity(0.5), width: 2),
                      image: const DecorationImage(image: AssetImage('assets/logo kantin.jpeg'), fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kantin Bu Sari 🍲', style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('Pesanan Makanan Lezat & Berkualitas', style: GoogleFonts.montserrat(color: const Color(0xFFD7CCC8), fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // FOTO UTAMA MENU (DIBATASI LEBARNYA DI TENGAH AGAR TIDAK NGE-ZOOM/MELEBAR BERLEBIHAN)
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600, maxHeight: 300),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    color: const Color(0xFFF3EDE2),
                    child: imageUrl.isNotEmpty
                        ? Image.network(imageUrl, fit: BoxFit.cover)
                        : const Center(child: Icon(Icons.fastfood, size: 70, color: Color(0xFF6D4C41))),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Nama & Harga Makanan
            Text(namaMenu, style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF3E2723))),
            const SizedBox(height: 6),
            Text(deskripsi, style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 12),
            Text(hargaStr, style: GoogleFonts.montserrat(fontSize: 20, color: const Color(0xFF6D4C41), fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Divider()),

            // Pengatur Jumlah
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Jumlah Pesanan', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF3E2723))),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline, color: Color(0xFF6D4C41)),
                      onPressed: () {
                        if (jumlah > 1) setState(() => jumlah--);
                      },
                    ),
                    Text('$jumlah', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline, color: Color(0xFF6D4C41)),
                      onPressed: () => setState(() => jumlah++),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Catatan
            TextField(
              controller: catatanController,
              style: GoogleFonts.montserrat(fontSize: 14),
              decoration: InputDecoration(
                labelText: 'Catatan untuk penjual (opsional)',
                hintText: 'Misal: Jangan pakai pedas, kuah pisah',
                labelStyle: GoogleFonts.montserrat(color: const Color(0xFF8D6E63)),
                focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color(0xFF4A3B32)), borderRadius: BorderRadius.circular(12)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4A3B32),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () {
            CartManager.addItem(
              CartItem(
                namaMenu: namaMenu,
                hargaSatuan: hargaSatuan,
                jumlah: jumlah,
                catatan: catatanController.text,
              ),
            );
            _showSuccessDialog(namaMenu, totalHarga);
          },
          child: Text(
            'Simpan ke Keranjang • Rp ${_formatRupiah(totalHarga)}',
            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  String _formatRupiah(int angka) {
    return angka.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }
}