import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/controllers/cart_controller.dart';
import 'package:getx_sample/screens/cart_screen.dart';
import 'package:getx_sample/screens/product_list_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  IconData favIcon = Icons.favorite;
  IconData shoppingIcon = Icons.shopping_cart_sharp;
  CartController cartController = Get.find();  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      // ),
      body: SafeArea(
        child: buildHome(context),
      ),
    );
  }

  Widget buildHome(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 15.0,
          ),
          buildHeader(context)
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 46.0,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15)),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Urun ara...",
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.only(top: 13.0),
              ),
              onChanged: (value) {
                // TO DO
              },
            ),
          ),

          buildBadge(favIcon,1, () => Get.to(ProductListScreen()) ),
          buildBadge(shoppingIcon, cartController.cartItems.length, () => Get.to(CartScreen())),
        ],
      ),
    );
  }

  buildBadge(IconData badgeIcon, int count, Function goToScreen) {
    return Container(
      height: 46.0,
      width: 46.0,
      decoration:
          BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
      child: Badge(
        position: BadgePosition.topEnd(top: -1, end: 0),
        animationDuration: Duration(milliseconds: 300),
        animationType: BadgeAnimationType.slide,
        badgeContent: Text(
          "$count",
          style: TextStyle(color: Colors.white, fontSize: 10.0),
        ),
        child: IconButton(
            icon: Icon(
              badgeIcon,
              size: 30.0,
            ),
            onPressed: () => goToScreen()),
      ),
    );
  }
}
