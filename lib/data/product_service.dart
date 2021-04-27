import 'package:getx_sample/models/product.dart';

class ProductService {
  static List<Product> products = [];

  // Singleton yapma isi
  static ProductService _singleton = ProductService._internal();

  factory ProductService() {
    return _singleton;
  }

  ProductService._internal();

  static List<Product> getAll() {
    products.add(new Product(1, "Acer Laptop", 10.0));
    products.add(new Product(2, "Samsung Laptop", 20.0));
    products.add(new Product(3, "Lenovo Laptop", 30.0));
    products.add(new Product(1, "Hp Laptop", 10.0));
    products.add(new Product(2, "Monster Laptop", 20.0));
    products.add(new Product(3, "Sony Laptop", 30.0));
    products.add(new Product(3, "Toshiba Laptop", 30.0));
    products.add(new Product(1, "Casper Laptop", 10.0));
    products.add(new Product(2, "Lg Laptop", 20.0));
    products.add(new Product(3, "Asus Laptop", 30.0));

    return products;
  }

  static Product getProductDetail(Product product) {
    return product;
  }
}
