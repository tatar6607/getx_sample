import 'package:get/get.dart';
import 'package:getx_sample/data/cart_service.dart';
import 'package:getx_sample/models/cart.dart';

class CartController extends GetxController {
  var cartItems = [].obs;

  addToCart(CartItem cartItem) {
    CartService.addToCart(cartItem);
    cartItems.assignAll(CartService.getCart());
  }

  void getCart() {
    cartItems.assignAll(CartService.getCart());
  }

  void removeFromCart(CartItem cartItem) {
    CartService.removeFromCart(cartItem);
    cartItems.assignAll(CartService.getCart());
  }

  void removeAll() {
    CartService.removeAll();
    cartItems.assignAll(CartService.getCart());
  }

  double getCartTotal() {
    return CartService.getCartTotal();
  }
}
