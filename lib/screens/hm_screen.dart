import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/controllers/cart_controller.dart';
import 'package:getx_sample/screens/cart_screen.dart';
import 'package:getx_sample/screens/product_list_screen.dart';
import 'package:responsive_grid/responsive_grid.dart';

// ignore: must_be_immutable
class HomeScreen1212 extends StatelessWidget {
  IconData favIcon = Icons.favorite;
  IconData shoppingIcon = Icons.shopping_cart_sharp;
  IconData threePoint = Icons.more_vert_rounded;
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
    return ListView(
      children: [
        SizedBox(
          height: 15.0,
        ),
        buildHeader(context),
        buildReklam(context),
      ],
    );
  }

  Widget buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.043),
      child: ResponsiveGridRow(
        children: [
          buildSearchBox(context),
          buildBadge(favIcon, 1, () => Get.to(ProductListScreen())),
          buildBadge(shoppingIcon, cartController.cartItems.length,
              () => Get.to(CartScreen())),
          buildBadge(threePoint, 1, () => Get.to(ProductListScreen())),
        ],
      ),
    );
  }

  Widget buildSearchBox(BuildContext context) {
    return ResponsiveGridCol(
      xs: 6,
      md: 6,
      lg: 6,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
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
    );
  }

  buildBadge(IconData badgeIcon, int count, Function goToScreen) {
    return ResponsiveGridCol(
      xs: 2,
      md: 2,
      lg: 2,

      child: Container(
        height: 46.0,
        width: 46.0,
        decoration:
            BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
        child: Badge(
          toAnimate: true,
          position: BadgePosition.topEnd(top: -1, end: 8),
          animationDuration: Duration(milliseconds: 300),
          animationType: BadgeAnimationType.slide,
          badgeContent: Text(
            "${cartController.cartItems.length}",
            style: TextStyle(color: Colors.white, fontSize: 10.0),
          ),
          child: IconButton(
              icon: Icon(
                badgeIcon,
                size: 30.0,
              ),
              onPressed: () => goToScreen()),
        ),
      ),
    );
  }

  buildReklam(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.043, vertical: 8.0),
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.all(23.0),
      child: Text.rich(TextSpan(
          text: "Aradiginiz hersey burada\n",
          style: TextStyle(
            color: Colors.black,
          ),
          children: [
            TextSpan(
                text: "Isteyin size gelsin",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          ])),
    );
  }
}
