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
        body:
        buildDetailpage(product, context)
        
        );
  }

  ListView buildDetailpage(product, BuildContext context) {
    return ListView(children: [
        Column(
          children: [
            Center(
              child: Container(
                height: 200.0,
                //   padding: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 5.0),
                        color: Colors.black45,
                        blurRadius: 30.0,
                      )
                    ]),
                //    margin: EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
                child: Hero(
                  tag: "123",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: NetworkImage(
                        "https://netrinoimages.s3.eu-west-2.amazonaws.com/2018/11/01/558437/216189/laptop_3d_model_c4d_max_obj_fbx_ma_lwo_3ds_3dm_stl_2277616_o.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(height: 15.0),
            Text(
              "${product[0].name}",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Text(
                "${product[0].name}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              height: 60.0,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reading",
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Row(children: [
      
                    Text(
                      "+3",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ])
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "4.7",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "LemonMILK",
                            color: Theme.of(context).primaryColor,
                            letterSpacing: 1.2),
                      ),
                      Text("Rating",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Theme.of(context).accentColor,
                          ))
                    ],
                  ),
                  // RatingBarIndicator(
                  //   rating: 3,
                  //   itemBuilder: (context, index) => Icon(
                  //     Icons.star,
                  //     color: Colors.amber,
                  //   ),
                  //   itemCount: 5,
                  //   itemSize: 30.0,
                  //   direction: Axis.horizontal,
                  // ),
                  InkWell(
                    onTap: () {
                      print("Hello world");
                    },
                    child: Container(
                      height: 40.0,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5.0),
                              color: Colors.black26,
                              blurRadius: 20.0)
                        ],
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              height: 55.0,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BUY     |     \$20.10",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ]);
  }}