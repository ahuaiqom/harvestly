import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';
import '../data/product_data.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = ProductData.products; // ✅ pakai data terpisah
  Set<String> favorites = {};

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ✅ Tentukan jumlah kolom berdasarkan ukuran layar
    int crossAxisCount = 2;
    if (screenWidth >= 1200) {
      crossAxisCount = 4; // Desktop
    } else if (screenWidth >= 800) {
      crossAxisCount = 3; // Tablet
    } else {
      crossAxisCount = 2; // Mobile
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fruit"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset("assets/Icon/FilterIcon.png", width: 24),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            isFavorite: favorites.contains(product.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(product: product),
                ),
              );
            },
            onFavoriteTap: () {
              setState(() {
                if (favorites.contains(product.name)) {
                  favorites.remove(product.name);
                } else {
                  favorites.add(product.name);
                }
              });
            },
          );
        },
      ),
    );
  }
}
