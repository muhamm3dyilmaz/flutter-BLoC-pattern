import 'package:bloc_demo/models/product.dart';

//Similar logic with .net core web api Repositories Layer
class ProductService {
  static List<Product> products = <Product>[];

  static final ProductService _singleton = ProductService._internal();

  factory ProductService() {
    return _singleton;
  }

  ProductService._internal();

  static List<Product> getAllProducts() {
    //API can call here (but dummy datas for practise BLoC)
    products.add(Product(1, "MacBook Pro", 1299));
    products.add(Product(2, "MacBook Air", 999));
    products.add(Product(3, "Iphone 15 Pro", 1100));
    products.add(Product(1, "Apple Watch", 450));
    return products;
  }
}
