import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth >= 800; // Tablet/Desktop

    Widget imageSection = Stack(
      children: [
        Image.asset(
          widget.product.image,
          width: double.infinity,
          height: isWideScreen ? double.infinity : 300,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 40,
          left: 16,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset("assets/Icon/BackIcon.png", width: 28),
          ),
        ),
      ],
    );

    Widget detailSection = Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(widget.product.name,
                    style: TextStyle(
                        fontSize: isWideScreen ? 26 : 22,
                        fontWeight: FontWeight.bold)),
              ),
              Text("\$${widget.product.price.toInt()}",
                  style: TextStyle(
                      fontSize: isWideScreen ? 24 : 20, color: Colors.blue)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 20),
              const SizedBox(width: 4),
              Text(
                "${widget.product.rating} (${widget.product.reviews} Review)",
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text("Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(widget.product.description,
              style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text("Quantity",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const Spacer(),
              IconButton(
                onPressed: () {
                  if (quantity > 1) {
                    setState(() => quantity--);
                  }
                },
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text(quantity.toString(),
                  style: const TextStyle(fontSize: 18)),
              IconButton(
                onPressed: () => setState(() => quantity++),
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {},
              child: const Text("Buy Now",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      body: isWideScreen
          ? Row(
              children: [
                Expanded(flex: 1, child: imageSection),
                Expanded(flex: 1, child: detailSection),
              ],
            )
          : Column(
              children: [
                imageSection,
                Expanded(child: detailSection),
              ],
            ),
    );
  }
}
