import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/controllers/cart_controller.dart';
import 'package:getx_sample/controllers/product_list_controller.dart';
import 'package:getx_sample/screens/product_list_screen.dart';
import 'package:getx_sample/widgets/company_list.dart';
import 'package:getx_sample/widgets/product_catalog.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  IconData favIcon = Icons.favorite;
  IconData shoppingIcon = Icons.shopping_cart_sharp;
  IconData threePoint = Icons.more_vert_rounded;
  CartController cartController = Get.find();
  ProductListController productListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Anasayfa",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
          size: 28.0,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 28.0,
              ),
              onPressed: () {}),
          buildBadge(threePoint, 1, () => Get.to(ProductListScreen())),
          SizedBox(
            width: 5.0,
          )
        ],
      ),
      body: SafeArea(
        child: buildHome(context),
      ),
    );
  }

  Badge buildBadge(IconData icon, int notCount, Future Function() navigator) {
    return Badge(
      toAnimate: true,
      position: BadgePosition.topEnd(top: 7, end: 5),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      showBadge: cartController.cartItems.length > 0 ? true : false,
      badgeContent: Text(
        "${cartController.cartItems.length}",
        style: TextStyle(color: Colors.white, fontSize: 7.0),
      ),
      child: IconButton(
          icon: Icon(
            icon,
            color: Colors.black,
            size: 28.0,
          ),
          onPressed: () => navigator()),
    );
  }



  Widget buildHome(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 15.0,
        ),
        //    buildHeader(context),
   //     buildReklam(context),
        ProductCarosel(productListController.productsList),
        CompanyListCarosel(productListController.productsList),
      ],
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
