import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widget/product_card.dart';

class HomePage extends StatelessWidget {
  final List<Product> products;

  const HomePage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Curved colored header with title
        Stack(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF06923E),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: Text(
                'Online Shop',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),

        // Search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search products...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        // Product grid
        Expanded(
          child: GridView.builder(
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
        ),
      ],
    );
  }
}
