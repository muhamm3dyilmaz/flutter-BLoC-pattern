import 'package:bloc_demo/models/product.dart';

class Cart {
  Product? product;
  int? quantity;

  Cart(
    this.product,
    this.quantity,
  );
}
