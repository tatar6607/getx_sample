
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var product = Get.arguments;
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.white,
        title: Text("Urun Detaylari"),
      ),
      body: Center(
        child: product.length < 0 ? Text("Data yok"):Text(
          '${product[0].name}',
        ),
      )
    );
  }
}