import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CompanyCard extends StatelessWidget {
  RxList companies;
  CompanyCard(this.companies);

  Text _buildStars(int rate) {
    String stars = "";
    for (var i = 0; i < rate; i++) {
      stars += "⭐ ";
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 10.0),
            itemCount: companies.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(80.0, 5.0, 20.0, 7.0),
                    height: 125.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.grey[300]),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(70.0, 15.0, 20.0, 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 180.0,
                                child: Text(
                                  companies[index].name,
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            companies[index].name,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          _buildStars(3),
                          SizedBox(
                            height: 7.0,
                          ),
                          Row(
                            children: [
                              buildSchedule(context, "Acilis"),
                              SizedBox(
                                width: 8.0,
                              ),
                              buildSchedule(context, "Kapanis"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20.0,
                    top: 15.0,
                    bottom: 15.0,
                    child: buildCartImage(),
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Container buildSchedule(BuildContext context, String schedule) {
    return Container(
      padding: EdgeInsets.all(5.0),
      alignment: Alignment.center,
      width: 80.0,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(schedule),
    );
  }

  Widget buildCartImage() {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20.0), boxShadow: [
        BoxShadow(
          offset: Offset(0.0, 2.0),
          color: Colors.black12,
          blurRadius: 10.0,
        )
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          // decoration:
          // BoxDecoration(boxShadow: [
          //   BoxShadow(
          //       color: Colors.grey.withOpacity(.5),
          //       offset: Offset(3, 2),
          //       blurRadius: 7)
          // ]),
          child: Image(
            image: NetworkImage(
                "https://cdn.vox-cdn.com/thumbor/ZSnfvglNBdSGBc-ST4GnBybsPqM=/0x0:5000x3486/920x613/filters:focal(2303x650:3103x1450):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/66369293/Amazon_Go_Grocery_3.0.jpg"),
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
