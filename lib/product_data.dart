// product_data.dart

class Product {
  final String name;
  final String image;
  final double price;
  final String description;
  int quantity; // Add quantity property

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    this.quantity = 0, // Initialize quantity to 0
  });
}

List<Product> products = [
  Product(
    name: 'Diya -Orange',
    image: 'assets/images/prod1.jpg',
    price: 10.99,
    description: 'Description of Product 1.',
  ),
  Product(
    name: 'Diya -Purple',
    image: 'assets/images/prod2.jpg',
    price: 15.99,
    description: 'Description of Product 2.',
  ),
  Product(
    name: 'Diya -Red',
    image: 'assets/images/prod3.jpg',
    price: 9.99,
    description: 'Description of Product 3.',
  ),
  Product(
    name: 'Incense Sticks',
    image: 'assets/images/prod5.jpg',
    price: 11.99,
    description: 'Description of Product 5.',
  ),
  Product(
    name: 'Scented Candles',
    image: 'assets/images/prod6.jpg',
    price: 14.99,
    description: 'Description of Product 6.',
  ),
  Product(
    name: 'Flower Diya',
    image: 'assets/images/prod7.jpg',
    price: 14.99,
    description: 'Description of Product 6.',
  )
  // Add more products here with the same images
];
