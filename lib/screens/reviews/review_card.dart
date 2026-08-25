import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:homework6/constants/color.dart';
import 'package:homework6/models/items_model.dart';

class ReviewCard extends StatelessWidget {
  final ItemsModel itemsdata;
  final int index;
  const ReviewCard({Key? key, required this.itemsdata, required this.index})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 10),
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.border),

        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(itemsdata.reviews![index]["reviewerName"] ?? ''),
                ),
                Container(
                  width: 70,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 216, 224, 225),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Verified ",
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ),
                ),
                SizedBox(width: 70),
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: EasyStarsDisplay(
                    initialRating: itemsdata.rating ?? 0.0,
                    readOnly: true,
                    filledColor: Colors.cyan,
                  ),
                ),
                SizedBox(width: 165),
                SizedBox(
                  child: Text("${itemsdata.reviews![index]["rating"] ?? ''}/5"),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(itemsdata.reviews![index]["comment"] ?? ''),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(itemsdata.reviews![index]["reviewerEmail"] ?? ''),
                  Text(itemsdata.reviews![index]["date"] ?? ''),
                ],
              ),
            ),
            Container(height: 1.5, color: AppColor.border, width: 380),
            Row(
              children: [
                SizedBox(child: Text("Was this review helpful?")),
                SizedBox(width: 100),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.thumb_up_alt_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.thumb_down_alt_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
