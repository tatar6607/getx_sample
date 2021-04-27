import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/controllers/cart_controller.dart';
import 'package:getx_sample/screens/product_detail_creen.dart';

class CartScreen extends StatelessWidget {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Sepetim",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Obx(() => SafeArea(
            child: cartController.cartItems.length > 0
                ? buildCart(cartController.cartItems)
                : emptyCartWarning())));
  }

  Widget buildCart(var list) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(ProductDetailScreen(),
                        arguments: [list[index].product]);
                  },
                  child: Card(
                    child: Dismissible(
                      key: Key(list[index].product.name),
                      direction: DismissDirection.endToStart,
                      background: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.clear,
                                color: Colors.grey,
                                size: 40.0,
                              ),
                              SizedBox(width: 20.0)
                            ],
                          ),
                          color: Colors.red[100]),
                      onDismissed: (direction) {
                        cartController.removeFromCart(list[index]);
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://netrinoimages.s3.eu-west-2.amazonaws.com/2018/11/01/558437/216189/laptop_3d_model_c4d_max_obj_fbx_ma_lwo_3ds_3dm_stl_2277616_o.jpg"),
                          radius: 30.0,
                        ),
                        title: Text(
                          list[index].product.name,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          "${list[index].quantity} x ${list[index].product.price.toString()} €",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          "${list[index].product.price * list[index].quantity} €",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        SizedBox(height: 10.0),
        buildCartBottom(),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget emptyCartWarning() {
    return Center(
      child: Text("Sepetinizde urun bulunmamaktadir."),
    );
  }

  Widget buildCartBottom() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "${cartController.getCartTotal().toString()} €",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 200,
            height: 35.0,
            child: ElevatedButton(
                onPressed: () {},
                child: Text("Satin al", style: TextStyle(fontSize: 17.0)),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xfffb5607),
                )),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: 200,
            height: 35.0,
            child: ElevatedButton(
                onPressed: () {
                  cartController.removeAll();
                },
                child:
                    Text("Sepeti Iptal Et", style: TextStyle(fontSize: 17.0)),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff8338ec), //
                )),
          ),
        ],
      ),
    );
  }
}
