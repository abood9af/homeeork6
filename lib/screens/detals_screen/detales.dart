import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:homework6/constants/color.dart';
import 'package:homework6/constants/images.dart';
import 'package:homework6/models/items_model.dart';
import 'package:homework6/screens/reviwes.dart';
import 'package:rating_summary/rating_summary.dart';

class Detales extends StatelessWidget {
  final ItemsModel item;
  const Detales({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String intro = "about the product";
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.04,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
      ),

      body: ListView(
        children: [
          SizedBox(
            child: Padding(
              padding: EdgeInsets.all(16.0),

              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 0),
                    height: 200,
                    width: double.infinity,

                    child: Hero(
                      tag: item.title!,
                      child: imageUrl(item.thumbnail ?? ''),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: screenWidth,
                    child: Text(
                      item.title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    width: screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EasyStarsDisplay(
                          initialRating: item.rating ?? 0.0,
                          readOnly: true,
                          filledColor: Colors.cyan,
                        ),
                        Text(" ${item.rating.toString()}"),
                        Text(
                          " (${item.reviews?.length.toString() ?? '0'} reviews)",
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    //height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.border),

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "About the product:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10, width: 10),
                          Text(item.description ?? ''),
                          SizedBox(height: 10, width: 10),
                          Text(
                            'Rating: ${item.rating.toString()}',
                            style: TextStyle(color: Colors.cyan),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.border),

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(08.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Reviews Summary",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            child: Row(
                              
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 4 ,
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item.rating.toString(),
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: EasyStarsDisplay(
                                            initialRating: item.rating ?? 0.0,
                                            readOnly: true,
                                            filledColor: Colors.cyan,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text(
                                            " (${item.reviews?.length.toString() ?? '0'} reviews)",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: AppColor.border,
                                  thickness: 1,
                             
                            ),
                            
                                Flexible(
                                  flex: 4,
                                  child: RatingSummary(
                                    counter: 13,
                                    average: 3.846,
                                    showAverage: false,
                                    counterFiveStars: 5,
                                    counterFourStars: 4,
                                    counterThreeStars: 2,
                                    counterTwoStars: 1,
                                    counterOneStars: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 5),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Reviwes(itemsdata: item),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 100,
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text("See all reviews"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.border),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(child: Icon(Icons.local_shipping)),
                          Container(
                            height: 80,
                            width: 1.5,
                            color: AppColor.border,
                            margin: EdgeInsets.only(left: 20, right: 20),
                          ),
                          SizedBox(child: Icon(Icons.local_shipping)),
                          Container(
                            height: 80,
                            width: 1.5,
                            color: AppColor.border,
                            margin: EdgeInsets.only(left: 20, right: 20),
                          ),
                          SizedBox(child: Icon(Icons.local_shipping)),
                          Container(
                            height: 80,
                            width: 1.5,
                            color: AppColor.border,
                            margin: EdgeInsets.only(left: 20, right: 20),
                          ),
                          SizedBox(child: Icon(Icons.local_shipping)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.border),

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RatingSummary(
                      counter: 13,
                      average: 3.846,
                      showAverage: false,
                      counterFiveStars: 5,
                      counterFourStars: 4,
                      counterThreeStars: 2,
                      counterTwoStars: 1,
                      counterOneStars: 1,
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      padding: EdgeInsets.symmetric(
                        horizontal: 130,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Add to cart"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
