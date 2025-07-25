import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_card.dart';

class HomeProduct extends StatelessWidget {
  const HomeProduct({Key? key}) : super(key: key);

  final List<Product> products = const [
    Product(
        name: 'Hoodie Yellow',
        price: 69,
        image: 'https://via.placeholder.com/200',
        description: 'Cozy yellow hoodie.'),
    Product(
        name: 'iPhone 12',
        price: 765,
        image: 'https://via.placeholder.com/200',
        description: 'Apple iPhone 12.'),
    // add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('Online Shop')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
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
