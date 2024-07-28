import 'package:flutter/material.dart';
import 'package:ngo_selling_app/product_data.dart'; // Import product data

class DetailedProductPage extends StatelessWidget {
  final Product products;

  DetailedProductPage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              products.image,
              width: 120,
              height: 120,
            ),
            SizedBox(height: 16.0),
            Text(
              products.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${products.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              products.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
