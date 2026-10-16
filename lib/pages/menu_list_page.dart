import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'order_page.dart';
import '../cart_data.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key});

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  String selectedCategory = 'Semua Menu';

  // Daftar menu lengkap dengan foto kuliner asli yang akurat
  final List<Map<String, dynamic>> menuItems = [
    // --- MAKANAN BERAT ---
    {
      'name': 'Nasi Goreng',
      'category': 'Makanan Berat',
      'price': 15000,
      'priceStr': 'Rp 15.000',
      'desc': 'Menu klasik dengan tambahan telur, ayam, atau sosis.',
      'image': 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500',
      'badge': 'Klasik ⭐',
    },
    {
      'name': 'Rice Bowl Ayam (Teriyaki/Matah)',
      'category': 'Makanan Berat',
      'price': 18000,
      'priceStr': 'Rp 18.000',
      'desc': 'Nasi putih dengan lauk ayam tanpa tulang dan saus khas kafe.',
      'image': 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500',
      'badge': 'Favorit 🔥',
    },
    {
      'name': 'Nasi Ayam Bakar / Geprek',
      'category': 'Makanan Berat',
      'price': 19000,
      'priceStr': 'Rp 19.000',
      'desc': 'Paket nasi lengkap dengan ayam berbumbu dan lalapan segar.',
      'image': 'https://images.unsplash.com/photo-1626777552726-4a6b54c97e46?w=500',
      'badge': 'Best Seller',
    },
    {
      'name': 'Nasi Campur / Nasi Sayur',
      'category': 'Makanan Berat',
      'price': 14000,
      'priceStr': 'Rp 14.000',
      'desc': 'Nasi dengan pilihan sayur (sop/lodeh) dan lauk tempe, tahu, telur.',
      'image': 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500',
      'badge': 'Rumahan 🍲',
    },
    {
      'name': 'Mie Goreng / Rebus ala Kafe',
      'category': 'Makanan Berat',
      'price': 13000,
      'priceStr': 'Rp 13.000',
      'desc': 'Indomie custom dengan topping keju, kornet, telur, dan sawi.',
      'image': 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500',
      'badge': 'Andalan',
    },
    {
      'name': 'Kwetiau Goreng',
      'category': 'Makanan Berat',
      'price': 16000,
      'priceStr': 'Rp 16.000',
      'desc': 'Olahan mie pipih lebar khas warung atau kafe.',
      'image': 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500',
      'badge': 'Gurih',
    },
    {
      'name': 'Pasta (Carbonara / Bolognese)',
      'category': 'Makanan Berat',
      'price': 22000,
      'priceStr': 'Rp 22.000',
      'desc': 'Spaghetti dengan pilihan saus krim keju atau saus daging tomat.',
      'image': 'https://images.unsplash.com/photo-1621996346565-e3d5d6281296?w=500',
      'badge': 'Western 🍝',
    },
    {
      'name': 'Beef Burger & French Fries',
      'category': 'Makanan Berat',
      'price': 25000,
      'priceStr': 'Rp 25.000',
      'desc': 'Roti tangkup patty daging sapi panggang, keju, dan kentang goreng.',
      'image': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500',
      'badge': 'Spesial',
    },
    {
      'name': 'Chicken Katsu / Steak',
      'category': 'Makanan Berat',
      'price': 20000,
      'priceStr': 'Rp 20.000',
      'desc': 'Dada ayam goreng tepung saus barbeque/black pepper & kentang.',
      'image': 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?w=500',
      'badge': 'Lezat',
    },

    // --- MAKANAN RINGAN / SNACK ---
    {
      'name': 'Kentang Goreng (French Fries)',
      'category': 'Snack / Jajanan',
      'price': 12000,
      'priceStr': 'Rp 12.000',
      'desc': 'Potongan kentang renyah dengan bumbu tabur keju/barbeque.',
      'image': 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=500',
      'badge': 'Camilan 🍟',
    },
    {
      'name': 'Cireng Bumbu Rujak',
      'category': 'Snack / Jajanan',
      'price': 10000,
      'priceStr': 'Rp 10.000',
      'desc': 'Aci digoreng khas Jawa Barat, kenyal di dalam garing di luar.',
      'image': 'https://images.unsplash.com/photo-1599487488170-d3311b2ae941?w=500',
      'badge': 'Tradisional',
    },
    {
      'name': 'Dimsum Udang / Ayam',
      'category': 'Snack / Jajanan',
      'price': 15000,
      'priceStr': 'Rp 15.000',
      'desc': 'Olahan ayam/udang kukus dengan kulit pangsit dan saus khusus.',
      'image': 'https://images.unsplash.com/photo-1541696432-82c6da8ce7bf?w=500',
      'badge': 'Dimsum 🥟',
    },
    {
      'name': 'Pisang / Tahu Mendoan',
      'category': 'Snack / Jajanan',
      'price': 9000,
      'priceStr': 'Rp 9.000',
      'desc': 'Gorengan berbalut tepung terigu berbumbu bawang & daun bawang.',
      'image': 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500',
      'badge': 'Gorengan',
    },
    {
      'name': 'Telur Gulung',
      'category': 'Snack / Jajanan',
      'price': 8000,
      'priceStr': 'Rp 8.000',
      'desc': 'Adonan telur digulung menggunakan tusuk sate dalam minyak panas.',
      'image': 'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=500',
      'badge': 'Jadul',
    },
    {
      'name': 'Bakso Goreng (Basreng)',
      'category': 'Snack / Jajanan',
      'price': 10000,
      'priceStr': 'Rp 10.000',
      'desc': 'Bakso diiris tipis digoreng garing dengan taburan bubuk cabai.',
      'image': 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500',
      'badge': 'Pedas 🌶️',
    },
    {
      'name': 'Onion Rings',
      'category': 'Snack / Jajanan',
      'price': 11000,
      'priceStr': 'Rp 11.000',
      'desc': 'Irisan bawang bombay tebal dibalut adonan tepung hingga krispi.',
      'image': 'https://images.unsplash.com/photo-1639024471283-03518883512d?w=500',
      'badge': 'Krispi',
    },
    {
      'name': 'Roti Bakar Cokelat Keju',
      'category': 'Snack / Jajanan',
      'price': 13000,
      'priceStr': 'Rp 13.000',
      'desc': 'Roti tawar dipanggang mentega dengan isian meses dan keju melimpah.',
      'image': 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500',
      'badge': 'Manis 🍞',
    },
    {
      'name': 'Pisang Bakar / Goreng Keju',
      'category': 'Snack / Jajanan',
      'price': 12000,
      'priceStr': 'Rp 12.000',
      'desc': 'Pisang dengan topping susu kental manis, keju parut, dan cokelat.',
      'image': 'https://images.unsplash.com/photo-1603052875302-d376b7c0638a?w=500',
      'badge': 'Favorit',
    },
    {
      'name': 'Churros & Chocolate Dip',
      'category': 'Snack / Jajanan',
      'price': 16000,
      'priceStr': 'Rp 16.000',
      'desc': 'Kue goreng khas Spanyol bentuk panjang disajikan dengan saus cokelat.',
      'image': 'https://images.unsplash.com/photo-1624371414361-e670ff628fdb?w=500',
      'badge': 'Dessert 🍫',
    },

    // --- MINUMAN ---
    {
      'name': 'Es Kopi Susu Gula Aren',
      'category': 'Minuman Segar',
      'price': 18000,
      'priceStr': 'Rp 18.000',
      'desc': 'Perpaduan espresso, susu segar, dan manis khas gula aren.',
      'image': 'https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5?w=500',
      'badge': 'Kopi ☕',
    },
    {
      'name': 'Americano / Long Black',
      'category': 'Minuman Segar',
      'price': 15000,
      'priceStr': 'Rp 15.000',
      'desc': 'Espresso yang dicampur dengan air panas atau air dingin.',
      'image': 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500',
      'badge': 'Black Coffee',
    },
    {
      'name': 'Café Latte / Cappuccino',
      'category': 'Minuman Segar',
      'price': 20000,
      'priceStr': 'Rp 20.000',
      'desc': 'Espresso dengan takaran susu kukus dan busa tebal seimbang.',
      'image': 'https://images.unsplash.com/photo-1534778101976-62847782c213?w=500',
      'badge': 'Signature',
    },
    {
      'name': 'Matcha Latte',
      'category': 'Minuman Segar',
      'price': 19000,
      'priceStr': 'Rp 19.000',
      'desc': 'Serbuk teh hijau khas Jepang yang dicampur susu segar.',
      'image': 'https://images.unsplash.com/photo-1536256263959-770b48d82b0a?w=500',
      'badge': 'Green Tea 🍵',
    },
    {
      'name': 'Thai Tea / Milk Tea',
      'category': 'Minuman Segar',
      'price': 15000,
      'priceStr': 'Rp 15.000',
      'desc': 'Teh hitam khas Thailand atau teh susu dengan tambahan boba.',
      'image': 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500',
      'badge': 'Manis',
    },
    {
      'name': 'Classic Hot / Iced Chocolate',
      'category': 'Minuman Segar',
      'price': 18000,
      'priceStr': 'Rp 18.000',
      'desc': 'Minuman cokelat kaya rasa disajikan hangat atau dingin.',
      'image': 'https://images.unsplash.com/photo-1542990253-0d0f5be5f0ed?w=500',
      'badge': 'Cokelat 🍫',
    },
    {
      'name': 'Lemon Mint Mojito',
      'category': 'Minuman Segar',
      'price': 16000,
      'priceStr': 'Rp 16.000',
      'desc': 'Air soda dengan perasan lemon, daun mint, dan sirup segar.',
      'image': 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500',
      'badge': 'Mocktail 🍋',
    },
    {
      'name': 'Fruit Juice / Smoothies',
      'category': 'Minuman Segar',
      'price': 15000,
      'priceStr': 'Rp 15.000',
      'desc': 'Jus buah segar pilihan (alpukat, mangga, atau jeruk) kaya vitamin.',
      'image': 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=500',
      'badge': 'Sehat 🥤',
    },
  ];

  void _showCheckoutForm(BuildContext context) {
    final TextEditingController namaController = TextEditingController();
    final TextEditingController telpController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: const Color(0xFFFDFBF7),
          title: Text('Data Pemesan', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: const Color(0xFF3E2723))),
          content: Form(
            key: formKey,
            child: SizedBox(
              width: 320,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Masukkan nama dan nomor telepon untuk menyelesaikan pesanan:',
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: namaController,
                    style: GoogleFonts.poppins(fontSize: 14),
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap *',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (val) => val == null || val.trim().isEmpty ? 'Nama wajib diisi' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: telpController,
                    keyboardType: TextInputType.phone,
                    style: GoogleFonts.poppins(fontSize: 14),
                    decoration: InputDecoration(
                      labelText: 'Nomor Telepon / WhatsApp *',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (val) => val == null || val.trim().isEmpty ? 'Nomor telepon wajib diisi' : null,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Batal', style: GoogleFonts.poppins(color: const Color(0xFF4A3B32))),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A3B32),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  String nama = namaController.text;

                  Navigator.pop(context);

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
                                decoration: BoxDecoration(
                                  color: Colors.brown.shade50,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.brown.shade200),
                                ),
                                child: const Icon(
                                  Icons.celebration_rounded,
                                  size: 40,
                                  color: Color(0xFF4A3B32),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Terima Kasih, $nama!',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF3E2723),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Pesanan segera diproses.\nTerima kasih sudah memesan, selamat menunggu pesanan ya! 🍲',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
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
                                  },
                                  child: Text('OK, Siap!', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );

                  setState(() {
                    CartManager.clear();
                  });
                }
              },
              child: Text('Kirim Pesanan', style: GoogleFonts.poppins(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _showCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              backgroundColor: const Color(0xFFFDFBF7),
              title: Text('Keranjang Belanja', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: const Color(0xFF3E2723))),
              content: SizedBox(
                width: 320,
                child: CartManager.items.isEmpty
                    ? Text('Keranjang masih kosong nih. Yuk pesan dulu!', style: GoogleFonts.poppins(fontSize: 13))
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: CartManager.items.length,
                            itemBuilder: (context, index) {
                              final cartItem = CartManager.items[index];
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text('${cartItem.namaMenu} (${cartItem.jumlah}x)', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 13)),
                                subtitle: Text(
                                  cartItem.catatan.isEmpty ? 'Tanpa catatan' : 'Catatan: ${cartItem.catatan}',
                                  style: GoogleFonts.poppins(fontSize: 11),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Rp ${cartItem.totalHarga}', style: GoogleFonts.poppins(fontSize: 12)),
                                    IconButton(
                                      icon: const Icon(Icons.delete_outline, size: 18, color: Colors.red),
                                      onPressed: () {
                                        setDialogState(() {
                                          CartManager.items.removeAt(index);
                                        });
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Keseluruhan:', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 13)),
                              Text('Rp ${CartManager.grandTotal}', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: const Color(0xFF6D4C41), fontSize: 13)),
                            ],
                          ),
                        ],
                      ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Tutup', style: GoogleFonts.poppins(color: const Color(0xFF4A3B32))),
                ),
                if (CartManager.items.isNotEmpty)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A3B32)),
                    onPressed: () {
                      Navigator.pop(context);
                      _showCheckoutForm(context);
                    },
                    child: Text('Checkout Pesanan', style: GoogleFonts.poppins(color: Colors.white)),
                  ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredMenus = selectedCategory == 'Semua Menu'
        ? menuItems
        : menuItems.where((item) => item['category'] == selectedCategory).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDFBF7),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF4A3B32)),
        title: Text(
          'DAFTAR MENU KANTIN',
          style: GoogleFonts.poppins(
            color: const Color(0xFF4A3B32),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 16,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: Color(0xFF4A3B32)),
                onPressed: () => _showCartDialog(context),
              ),
              if (CartManager.items.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${CartManager.items.length}',
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BANNER LOGO
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3E2723), Color(0xFF5D4037)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
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
                    image: const DecorationImage(
                      image: AssetImage('assets/logo kantin.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kantin Bu Sari 🍲',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Pilih menu favoritmu di bawah dan nikmati hidangan lezat hari ini!',
                        style: GoogleFonts.poppins(color: const Color(0xFFD7CCC8), fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // FILTER KATEGORI
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryButton('Semua Menu'),
                _buildCategoryButton('Makanan Berat'),
                _buildCategoryButton('Snack / Jajanan'),
                _buildCategoryButton('Minuman Segar'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Text(
              'Menampilkan: $selectedCategory',
              style: GoogleFonts.poppins(
                color: const Color(0xFF8D6E63),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),

          // DAFTAR MENU DENGAN FOTO MAKANAN ASLI DARI UNSPLASH
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: filteredMenus.length,
              itemBuilder: (context, index) {
                final menu = filteredMenus[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.brown.shade100, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown.withOpacity(0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    // FOTO MAKANAN KULINER ASLI
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(menu['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            menu['name'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: const Color(0xFF3E2723),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.brown.shade50,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.brown.shade200),
                          ),
                          child: Text(
                            menu['badge'],
                            style: GoogleFonts.poppins(fontSize: 10, color: const Color(0xFF6D4C41), fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        Text(
                          menu['desc'],
                          style: GoogleFonts.poppins(color: Colors.grey, fontSize: 11),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          menu['priceStr'],
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF6D4C41),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderPage(menuItem: menu),
                            ),
                          ).then((_) {
                            setState(() {});
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A3B32),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        ),
                        child: Text('Pesan', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String categoryName) {
    bool isSelected = selectedCategory == categoryName;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedCategory = categoryName;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF4A3B32) : Colors.white,
          foregroundColor: isSelected ? Colors.white : const Color(0xFF6D4C41),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected ? const Color(0xFF4A3B32) : Colors.brown.shade200,
            ),
          ),
        ),
        child: Text(
          categoryName,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: isSelected ? Colors.white : const Color(0xFF4A3B32),
          ),
        ),
      ),
    );
  }
}