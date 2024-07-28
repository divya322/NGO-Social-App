import 'package:flutter/material.dart';
import 'package:ngo_selling_app/DetailedProductPage.dart';
import 'package:ngo_selling_app/cart_page.dart';
import 'package:ngo_selling_app/product_data.dart';
import 'package:ngo_selling_app/cart_manager.dart'; // Import the CartManager

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  // Use the CartManager to manage the cart data
  final CartManager cartManager = CartManager();

  // Function to add items to the cart
  void addToCart(Product product, int quantity) {
    setState(() {
      // Check if the product is already in the cart
      final existingProduct = cartManager.selectedProducts.firstWhere(
            (p) => p.name == product.name,
        orElse: () => null as Product,
      );

      if (existingProduct == null) {
        // Product is not in the cart, add it with the given quantity
        product.quantity = quantity;
        cartManager.selectedProducts.add(product);
      } else {
        // Product is already in the cart, update the quantity
        existingProduct.quantity += quantity;
      }
    });

    // Show the "Added to Cart" snackbar
    _showAddedToCartSnackbar();
  }

  void _showAddedToCartSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added to Cart'),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardHeight = screenWidth * 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: screenWidth / (cardHeight + 100.0),
          ),
          itemCount: products.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final product = products[index];
            final productQuantityInCart = cartManager.getProductQuantity(product);

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailedProductPage(products: product),
                  ),
                );
              },
              child: Card(
                elevation: 7.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: cardHeight / 3.5,
                      width: double.infinity,
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Rs.${product.price.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: QuantitySelector(
                            height: 30.0,
                            product: product,
                            onAddToCart: addToCart,
                            quantityInCart: productQuantityInCart,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: AddToCartButton(
                        height: 40.0,
                        product: product,
                        onAddToCart: addToCart,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class QuantitySelector extends StatefulWidget {
  final double height;
  final Product product;
  final Function(Product product, int quantity) onAddToCart;
  final int quantityInCart;


  QuantitySelector({
    required this.height,
    required this.product,
    required this.onAddToCart,
    required this.quantityInCart,
  });

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState(height: height);
}

class _QuantitySelectorState extends State<QuantitySelector> {
  final double height;
  int quantity;

  _QuantitySelectorState({required this.height}): quantity = 0;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantityInCart; // Initialize quantity from the quantityInCart parameter
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (quantity > 1) {
                setState(() {
                  quantity-=1;
                });
                widget.onAddToCart(widget.product, 1);
              }
            },
            child: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.deepOrangeAccent,
              ),
              child: Icon(Icons.remove, color: Colors.white, size: 10.0),
            ),
          ),
          SizedBox(width: 10.0),
          Text(
            quantity.toString(),
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10.0),
          GestureDetector(
            onTap: () {
              setState(() {
                quantity+=1;
              });
              widget.onAddToCart(widget.product, 1);
            },
            child: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.deepOrangeAccent,
              ),
              child: Icon(Icons.add, color: Colors.white, size: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final double height;
  final Product product;
  final Function(Product product, int quantity) onAddToCart;

  AddToCartButton({
    required this.height,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 1.8,
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          // Implement the logic to add the product to the cart
          onAddToCart(product, 1); // Default quantity is 1
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(5.0),
          primary: Colors.blue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.shopping_cart, size: 15.0),
            SizedBox(width: 8.0),
            Text('Add to Cart', style: TextStyle(fontSize: 10.0)),
          ],
        ),
      ),
    );
  }
}
