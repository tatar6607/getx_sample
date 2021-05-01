import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CompanyListCarosel extends StatelessWidget {
  RxList companies;
  CompanyListCarosel(this.companies);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "Magazalar",
            style: TextStyle(
              fontSize: 20.0,
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Container(
        height: 350.0,
          //      width: 500,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: companies.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                height: 120.0,
                width: 340.0,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: NetworkImage("https://www.retailtimes.co.uk/wp-content/uploads/2019/11/IMG_7722-600x400.jpg"),
                              fit: BoxFit.fill)),
                    ),
                    Positioned(
                      bottom: 0.0,
                      child: Container(
                        width: 340.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "${index + 1}. Sirket",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}
