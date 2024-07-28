import 'package:ngo_selling_app/product_data.dart'; // Import the product data file

class CartManager {
  // Create a singleton instance of CartManager
  static final CartManager _instance = CartManager._internal();

  factory CartManager() {
    return _instance;
  }

  CartManager._internal();

  // List to store the selected products
  final List<Product> selectedProducts = [];

  // Function to add items to the cart
  void addToCart(Product product, int quantity) {
    final existingProduct = selectedProducts.firstWhere(
          (p) => p.name == product.name,
      orElse: () => null as Product, // Specify the return type as Product
    );

    if (existingProduct == null) {
      // Product is not in the cart, add it with the given quantity
      product.quantity = quantity;
      selectedProducts.add(product);
    } else {
      // Product is already in the cart, update the quantity
      existingProduct.quantity += quantity;
    }
  }

  // Method to get the quantity of a specific product in the cart
  int getProductQuantity(Product product) {
    final cartProduct = selectedProducts.firstWhere(
          (p) => p.name == product.name,
      orElse: () => null as Product, // Specify the return type as Product
    );

    return cartProduct?.quantity ?? 0;
  }

  // Method to remove one quantity of a specific product from the cart
  void remove(Product product) {
    final cartProduct = selectedProducts.firstWhere(
          (p) => p.name == product.name,
      orElse: () => null as Product, // Specify the return type as Product
    );

    if (cartProduct != null && cartProduct.quantity > 0) {
      cartProduct.quantity -= 1;
    }
  }
}
