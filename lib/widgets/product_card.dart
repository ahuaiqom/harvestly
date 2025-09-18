import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onFavoriteTap,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Ambil lebar layar
        final screenWidth = MediaQuery.of(context).size.width;

        // Ukuran font dan icon otomatis menyesuaikan lebar
        final nameFontSize = screenWidth < 400 ? 14.0 : 16.0;
        final priceFontSize = screenWidth < 400 ? 12.0 : 14.0;
        final iconSize = screenWidth < 400 ? 22.0 : 28.0;

        return GestureDetector(
          onTap: onTap,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: nameFontSize,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "\$${product.price.toInt()}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: priceFontSize,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    child: Image.asset(
                      isFavorite
                          ? "assets/Icon/HeartFullIcon.png"
                          : "assets/Icon/HeartLessIcon.png",
                      width: iconSize,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Image.asset(
                    "assets/Icon/AddIcon.png",
                    width: iconSize,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
