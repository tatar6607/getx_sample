import 'package:getx_sample/models/cart.dart';

class CartService {
  static List<CartItem> cartItems = [];

  // dart ta singleton yapma islemleri =>

  CartService._internal();

  static CartService _singleton = CartService._internal();

  factory CartService() {
    return _singleton;
  }

  // static void addToCart(CartItem item) {
  //   cartItems.add(item);
  // }

  static void addToCart(CartItem item) {
    bool isItemFound = false;
    int index = 0;

    // check cardList has item and find index
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].product.name == item.product.name) {
        isItemFound = true;
        index = i;
        break;
      }
    }
    //  if cardList contains item increase that quantity
    if (isItemFound) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
  }

  static void removeFromCart(CartItem item) {
    cartItems.remove(item);
  }

  static void removeAll() {
    cartItems.clear();
  }

  static List<CartItem> getCart() {
    return cartItems;
  }

  static double getCartTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}
