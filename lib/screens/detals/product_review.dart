import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:homework6/components/button.dart';
import 'package:homework6/constants/color.dart';
import 'package:homework6/screens/reviews/reviews_page/reviwes.dart';
import 'package:rating_summary/rating_summary.dart';

class ProductReview extends StatelessWidget {
  final productRating;
  final productReviews;
  final item;
  const ProductReview({
    super.key,
    required this.productRating,
    required this.productReviews,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 4,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            productRating.toString(),
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: EasyStarsDisplay(
                              initialRating: productRating ?? 0.0,
                              readOnly: true,
                              filledColor: Colors.cyan,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(" (${productReviews ?? 0} reviews)"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  VerticalDivider(color: AppColor.border, thickness: 1),

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
            
            CustomButton(
              text: "See all reviews",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Reviwes(itemsdata: item),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
