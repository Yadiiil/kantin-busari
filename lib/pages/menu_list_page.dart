import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'order_page.dart';
import 'home_page.dart';
import '../cart_data.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key});

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  String selectedCategory = 'Semua Menu';
  String searchQuery = '';
  int activeSidebarIndex = 1; // 0: Home, 1: Menu, 2: My Orders

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

  void _showCheckoutDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: const Color(0xFFFAF7F2),
          title: Text('Konfirmasi Pesanan', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: const Color(0xFF3E2723))),
          content: SizedBox(
            width: 320,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Nama Pemesan', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Nomor WhatsApp', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A3B32), foregroundColor: Colors.white),
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      title: Text('Pesanan Berhasil! 🎉', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
                      content: Text('Terima kasih ${nameController.text}, pesanan kamu segera disiapkan oleh Bu Sari! 🍲'),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A3B32), foregroundColor: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              CartManager.clear();
                              activeSidebarIndex = 1;
                            });
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Kirim Pesanan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth > 900;

    var filteredMenus = selectedCategory == 'Semua Menu'
        ? menuItems
        : menuItems.where((item) => item['category'] == selectedCategory).toList();

    if (searchQuery.isNotEmpty) {
      filteredMenus = filteredMenus.where((item) => item['name'].toLowerCase().contains(searchQuery.toLowerCase())).toList();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF7F3EE),
      body: Row(
        children: [
          // 1. SIDEBAR KIRI (Tanpa Log out & Tanpa History)
          if (isDesktop)
            Container(
              width: 240,
              color: const Color(0xFFFAF7F2),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage('assets/logo kantin.jpeg'), fit: BoxFit.cover)),
                      ),
                      const SizedBox(width: 12),
                      Text('Kantin Bu Sari', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 16, color: const Color(0xFF3E2723))),
                    ],
                  ),
                  const SizedBox(height: 40),
                  
                  // Home Page
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    },
                    child: _buildSidebarItem(Icons.home_outlined, 'Home page', activeSidebarIndex == 0),
                  ),

                  // Menu
                  InkWell(
                    onTap: () => setState(() => activeSidebarIndex = 1),
                    child: _buildSidebarItem(Icons.restaurant_menu, 'Menu', activeSidebarIndex == 1),
                  ),

                  // My Orders
                  InkWell(
                    onTap: () => setState(() => activeSidebarIndex = 2),
                    child: _buildSidebarItem(Icons.shopping_bag_outlined, 'My orders', activeSidebarIndex == 2, badge: CartManager.items.isNotEmpty ? CartManager.items.length.toString() : null),
                  ),
                ],
              ),
            ),

          // 2. KONTEN UTAMA
          Expanded(
            child: activeSidebarIndex == 2
                ? _buildMyOrdersView()
                : Column(
                    children: [
                      // Search Bar Atas
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        color: const Color(0xFFF7F3EE),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [BoxShadow(color: Colors.brown.withOpacity(0.03), blurRadius: 6, offset: const Offset(0, 2))],
                                ),
                                child: TextField(
                                  onChanged: (val) => setState(() => searchQuery = val),
                                  style: GoogleFonts.montserrat(fontSize: 13),
                                  decoration: InputDecoration(
                                    hintText: 'Cari menu makanan atau minuman...',
                                    hintStyle: GoogleFonts.montserrat(color: Colors.grey, fontSize: 13),
                                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Grid Menu & Kategori
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Daftar Menu Pilihan 🍲', style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold, color: const Color(0xFF3E2723))),
                              const SizedBox(height: 16),
                              
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    _buildCategoryChip('Semua Menu'),
                                    _buildCategoryChip('Makanan Berat'),
                                    _buildCategoryChip('Snack / Jajanan'),
                                    _buildCategoryChip('Minuman Segar'),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),

                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: isDesktop ? 4 : 2,
                                  childAspectRatio: 0.72,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                ),
                                itemCount: filteredMenus.length,
                                itemBuilder: (context, index) {
                                  final menu = filteredMenus[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OrderPage(menuItem: menu),
                                        ),
                                      ).then((_) => setState(() {}));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [BoxShadow(color: Colors.brown.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))],
                                      ),
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(14),
                                              child: Image.network(menu['image'], fit: BoxFit.cover, width: double.infinity),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(menu['name'], style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 13, color: const Color(0xFF3E2723)), maxLines: 1, overflow: TextOverflow.ellipsis),
                                          const SizedBox(height: 4),
                                          Text(menu['desc'], style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 10), maxLines: 2, overflow: TextOverflow.ellipsis),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(menu['priceStr'], style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 12, color: const Color(0xFF6D4C41))),
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                                decoration: BoxDecoration(color: const Color(0xFF4A3B32), borderRadius: BorderRadius.circular(10)),
                                                child: Text('Pesan', style: GoogleFonts.montserrat(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyOrdersView() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Orders (Keranjang Belanja)', style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF3E2723))),
          const SizedBox(height: 20),
          Expanded(
            child: CartManager.items.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.shopping_bag_outlined, size: 60, color: Colors.grey),
                        const SizedBox(height: 12),
                        Text('Belum ada pesanan di keranjang.', style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: CartManager.items.length,
                    itemBuilder: (context, index) {
                      final item = CartManager.items[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.namaMenu, style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 16)),
                                  const SizedBox(height: 4),
                                  Text('Catatan: ${item.catatan.isEmpty ? "-" : item.catatan}', style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 12)),
                                  const SizedBox(height: 8),
                                  Text('Rp ${item.hargaSatuan} x ${item.jumlah} = Rp ${item.totalHarga}', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: const Color(0xFF6D4C41), fontSize: 13)),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline, color: Colors.red),
                              onPressed: () => setState(() => CartManager.items.removeAt(index)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          if (CartManager.items.isNotEmpty) ...[
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Keseluruhan:', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 18)),
                Text('Rp ${CartManager.grandTotal}', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 20, color: const Color(0xFF6D4C41))),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A3B32),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => _showCheckoutDialog(context),
                child: Text('Checkout Sekarang', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String title, bool isActive, {String? badge}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFE6B89C).withOpacity(0.4) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: isActive ? const Color(0xFF3E2723) : Colors.brown.shade300, size: 20),
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            fontSize: 13,
            color: isActive ? const Color(0xFF3E2723) : Colors.brown.shade400,
          ),
        ),
        trailing: badge != null
            ? Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(color: Color(0xFFE6B89C), shape: BoxShape.circle),
                child: Text(badge, style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.bold, color: const Color(0xFF3E2723))),
              )
            : null,
      ),
    );
  }

  Widget _buildCategoryChip(String categoryName) {
    bool isSelected = selectedCategory == categoryName;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(categoryName, style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 12, color: isSelected ? Colors.white : const Color(0xFF4A3B32))),
        selected: isSelected,
        selectedColor: const Color(0xFF4A3B32),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onSelected: (bool selected) {
          setState(() {
            selectedCategory = categoryName;
          });
        },
      ),
    );
  }
}