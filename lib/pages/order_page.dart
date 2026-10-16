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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xFFFDFBF7),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.brown.shade200),
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 40,
                    color: Color(0xFF4A3B32),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Berhasil Masuk Keranjang!',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3E2723),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  '$jumlah porsi $namaMenu telah ditambahkan ke keranjang belanja.',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF4A3B32),
                          side: const BorderSide(color: Color(0xFF4A3B32)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text('Tambah Menu Lain', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A3B32),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text('Lihat Menu', style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.bold)),
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
          style: GoogleFonts.poppins(
            color: const Color(0xFF4A3B32),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. FOTO UTAMA MENU (Ukurannya pas, tidak terlalu besar dan sudutnya melengkung rapi)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 200,
                width: double.infinity,
                color: const Color(0xFFF3EDE2),
                child: imageUrl.isNotEmpty
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      )
                    : const Center(child: Icon(Icons.fastfood, size: 70, color: Color(0xFF6D4C41))),
              ),
            ),
            const SizedBox(height: 20),
            
            // 2. Nama & Harga Makanan
            Text(
              namaMenu,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF3E2723),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              deskripsi,
              style: GoogleFonts.poppins(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 12),
            Text(
              hargaStr,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: const Color(0xFF6D4C41),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(),
            ),

            // 3. Pengatur Jumlah Pembelian
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jumlah Pesanan',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3E2723),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline, color: Color(0xFF6D4C41)),
                      onPressed: () {
                        if (jumlah > 1) setState(() => jumlah--);
                      },
                    ),
                    Text(
                      '$jumlah',
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline, color: Color(0xFF6D4C41)),
                      onPressed: () {
                        setState(() => jumlah++);
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 4. Catatan Tambahan
            TextField(
              controller: catatanController,
              style: GoogleFonts.poppins(fontSize: 14),
              decoration: InputDecoration(
                labelText: 'Catatan untuk penjual (opsional)',
                hintText: 'Misal: Jangan pakai pedas, kuah pisah',
                labelStyle: GoogleFonts.poppins(color: const Color(0xFF8D6E63)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF4A3B32)),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30), // Spasi bawah agar tidak terlalu mepet
          ],
        ),
      ),
      // 5. Tombol Simpan ke Keranjang di Bawah
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4A3B32),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
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
            style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),
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