import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/screens/product_detail_screen.dart';

// ignore: must_be_immutable
class ProductCarosel extends StatelessWidget {
  RxList products;
  ProductCarosel(this.products);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Kampanyali urunler",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text(
                    "Tumunu goster",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 130,
       //     color: Colors.blue,  
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                   Get.to(ProductDetailScreen(), arguments: [products[index]]);
                  },
                  child: Container(
         //           color: Colors.red,
                    width: 105.0,
                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          bottom: 7.0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.0, vertical: 10.0),
                            height: 50.0,
                            width: 103.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  products[index].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 15.0),
                                  //spreadRadius: 2.0
                                )
                              ]),
                          child: Hero(
                            tag: products[index].name,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image(
                                image: NetworkImage(
                                    "https://netrinoimages.s3.eu-west-2.amazonaws.com/2018/11/01/558437/216189/laptop_3d_model_c4d_max_obj_fbx_ma_lwo_3ds_3dm_stl_2277616_o.jpg"),
                                height: 90.0,
                                width: 98,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
