import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:homework6/constants/color.dart';
import 'package:homework6/models/items_model.dart';

class Rating extends StatelessWidget {
  final ItemsModel itemsdata;

  const Rating({Key? key, required this.itemsdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 10),
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.border),

        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(08.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 55,
                      width: 90,
                      margin: EdgeInsets.only(left: 20, top: 30),

                      child: Text(
                        itemsdata.rating.toString(),

                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: EasyStarsDisplay(
                        initialRating: itemsdata.rating ?? 0.0,
                        readOnly: true,
                        filledColor: Colors.cyan,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        " (${itemsdata.reviews?.length.toString() ?? '0'} reviews)",
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  width: 1.5,
                  color: AppColor.border,
                  margin: EdgeInsets.only(left: 20, right: 20),
                ),
                Container(),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
