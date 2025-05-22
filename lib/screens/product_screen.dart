import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk Kopi'),
        backgroundColor: Colors.brown[700],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3, // ganti sesuai jumlah produk
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          // Contoh produk dummy
          final products = [
            {'name': 'Kopi Hitam', 'image': 'assets/kopi1.jpg'},
            {'name': 'Cappuccino', 'image': 'assets/kopi2.jpg'},
            {'name': 'Latte', 'image': 'assets/kopi3.jpg'},
          ];
          final product = products[index];
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      product['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product['name']!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
