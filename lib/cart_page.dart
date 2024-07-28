import 'package:flutter/material.dart';
import 'package:ngo_selling_app/product_data.dart';
import 'package:ngo_selling_app/cart_manager.dart'; // Import the CartManager

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartManager cartManager = CartManager();

  // Function to update the UI when an item is removed from the cart
  void _updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the total amount
    double totalAmount = 0;
    for (final cartItem in cartManager.selectedProducts) {
      totalAmount += cartItem.price * cartItem.quantity;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartManager.selectedProducts.length,
        itemBuilder: (context, index) {
          final cartItem = cartManager.selectedProducts[index];

          // Only display items with quantity greater than zero
          if (cartItem.quantity > 0) {
            return Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 10),
              child: ListTile(
                leading: Image.asset(
                  cartItem.image,
                  width: 100,
                  height: 60,
                ),
                title: Text(cartItem.name),
                subtitle: Text(
                  'Rs.${cartItem.price.toStringAsFixed(2)} x ${cartItem.quantity} = Rs.${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
                ),
                trailing: IconButton(
                  icon: Icon(Icons.remove_shopping_cart),
                  onPressed: () {
                    // Remove the item from the cart or decrease its quantity
                    cartManager.remove(cartItem);
                    // Update the UI to reflect the change
                    _updateUI();
                  },
                ),
              ),
            );
          } else {
            // If quantity is zero, don't display the item
            return SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total Amount: Rs.${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Implement checkout logic here
                  // You can navigate to a checkout page or show a dialog, etc.
                },
                child: Text('Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

