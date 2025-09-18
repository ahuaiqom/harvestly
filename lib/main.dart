import 'package:flutter/material.dart';
import 'screens/product_list_screen.dart';

void main() {
  runApp(const FruitShopApp());
}

class FruitShopApp extends StatelessWidget {
  const FruitShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins"),
      home: const ProductListScreen(),
    );
  }
}
