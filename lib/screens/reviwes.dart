import 'dart:math';

import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:homework6/constants/color.dart';
import 'package:homework6/models/items_model.dart';

class Reviwes extends StatelessWidget {
  final ItemsModel itemsdata;
  const Reviwes({super.key, required this.itemsdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        title: Text("Reviwes"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt))],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
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
                        Container()
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: itemsdata.reviews?.length ?? 0,
                  itemBuilder: (context, index) {
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
                                  child: Text(
                                    itemsdata.reviews![index]["reviewerName"] ??
                                        '',
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    
                                    color: const Color.fromARGB(255, 216, 224, 225),
                                    borderRadius: BorderRadius.circular(10),
                                    
                                  ),
                                  child :Center(
                                    child: Text("Verified ", style: TextStyle(color: Colors.cyan),),
                                    
                                  ),
                                ),
                                SizedBox(width: 70),
                                 IconButton(
                                    
                                    icon: Icon(Icons.more_vert),
                                    onPressed: (){},
                                  ),
                                
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
                              child: Text(
                                itemsdata.reviews![index]["comment"] ?? '',
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemsdata
                                            .reviews![index]["reviewerEmail"] ??
                                        '',
                                  ),
                                  Text(itemsdata.reviews![index]["date"] ?? ''),
                                ],
                              ),
                            ),
                            Container(
                              height: 1.5,
                              color: AppColor.border,
                              width: 380,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  child: Text("Was this review helpful?"),
                                ),
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
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                padding: EdgeInsets.symmetric(horizontal: 130, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Write a Review"),
            ),
          ],
        ),
      ),
    );
  }
}
