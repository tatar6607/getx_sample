import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var product = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('${product[0].name} - Detaylari',
              style: TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Center(
          child: product.length < 0
              ? Text("Data yok")
              : Text(
                  '${product[0].name}',
                ),
        ));
  }
}
