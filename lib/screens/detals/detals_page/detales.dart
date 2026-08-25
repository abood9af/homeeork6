import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:homework6/components/button.dart';
import 'package:homework6/constants/color.dart';
import 'package:homework6/constants/images.dart';
import 'package:homework6/models/items_model.dart';
import 'package:homework6/screens/detals/product_features.dart';
import 'package:homework6/screens/detals/product_info.dart';
import 'package:homework6/screens/detals/product_review.dart';
import 'package:homework6/screens/reviews/reviews_page/reviwes.dart';
import 'package:rating_summary/rating_summary.dart';
import 'package:homework6/screens/detals/about_product.dart';

class Detales extends StatelessWidget {
  final ItemsModel item;
  const Detales({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    //String intro = "about the product";
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
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: item.title!,
                    child: ProductInfo(
                      title: item.title ?? '',
                      description: item.description ?? '',
                      thumbnail: item.thumbnail ?? '',
                      rating: item.rating,
                      reviews: item.reviews,
                    ),
                  ),

                  AboutProduct(
                    productDescription: item.description ?? '',
                    proudctRating: item.rating?.toInt() ?? 0,
                  ),
                  ProductReview(
                    productRating: item.rating,
                    productReviews: item.reviews?.length,
                    item: item,
                  ),
                  ProductFeatures(),
                  
                  SizedBox(height: 50),
                  /*ElevatedButton(
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
                  ),*/
                  CustomButton(
                    text: "Add to cart",
                    onPressed: () {
                      // Handle button press
                    },
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
