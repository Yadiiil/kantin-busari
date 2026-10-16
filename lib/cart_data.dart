class CartItem {
  final String namaMenu;
  final int hargaSatuan;
  final int jumlah;
  final String catatan;

  CartItem({
    required this.namaMenu,
    required this.hargaSatuan,
    required this.jumlah,
    required this.catatan,
  });

  int get totalHarga => hargaSatuan * jumlah;
}

class CartManager {
  static final List<CartItem> items = [];

  static void addItem(CartItem item) {
    items.add(item);
  }

  static void clear() {
    items.clear();
  }

  static int get grandTotal {
    int total = 0;
    for (var item in items) {
      total += item.totalHarga;
    }
    return total;
  }
}