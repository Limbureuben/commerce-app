
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widget/product_card.dart';

class HomePage extends StatelessWidget {
  final List<Product> products;

  const HomePage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Shop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (ctx, i) => ProductCard(product: products[i]),
      ),
    );
  }
}
