import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/controllers/cart_controller.dart';
import 'package:getx_sample/controllers/product_list_controller.dart';
import 'package:getx_sample/models/cart.dart';
import 'package:getx_sample/screens/cart_screen.dart';
import 'package:getx_sample/screens/home_screen.dart';
import 'package:getx_sample/screens/product_detail_screen.dart';
import 'package:getx_sample/widgets/custom_text.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ProductListScreen extends StatelessWidget {
  final ProductListController productListController =
      Get.put(ProductListController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alisveris",
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
        leading: IconButton(
          icon: Icon(Icons.home),
          iconSize: 26.0,
          color: Colors.black,
          onPressed: () => Get.to(HomeScreen()), // Icon => 
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: () {
                Get.to(CartScreen());
              })
        ],
      ),
      body: buildProductList(),
      drawer: Drawer(),
    );
  }

  buildProductList() {
    return Obx(
      () => SafeArea(
          child: productListController.productsList.length > 0
              ? buildProductListItems(productListController.productsList)
              : Center(child: Text("Data yok"))),
    );
  }

  Widget buildProductListItems(var list) {
    RxList listProduct = list;
    return ResponsiveGridList(
        desiredItemWidth: 180,
        minSpacing: 5.0,
        children: listProduct.map<Widget>((product) {
          return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          offset: Offset(3, 2),
                          blurRadius: 7)
                    ]),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(ProductDetailScreen(), arguments: [product]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.network(
                              "https://netrinoimages.s3.eu-west-2.amazonaws.com/2018/11/01/558437/216189/laptop_3d_model_c4d_max_obj_fbx_ma_lwo_3ds_3dm_stl_2277616_o.jpg",
                              width: double.infinity,
                              height: 100.0,
                            )),
                      ),
                    ),
                    CustomText(
                      text: product.name,
                      size: 16,
                      weight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: CustomText(
                            text: "${product.price} €",
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        IconButton(
                            icon: Icon(Icons.add_shopping_cart),
                            onPressed: () {
                              cartController.addToCart(CartItem(product, 1));
                              Get.snackbar("Urun eklendi",
                                  "${product.name} sepete eklendi",
                                  dismissDirection:
                                      SnackDismissDirection.HORIZONTAL);
                            })
                      ],
                    ),
                  ],
                ),
              ));
        }).toList());
  }
}
