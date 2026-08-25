import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:homework6/constants/images.dart';

class ProductInfo extends StatelessWidget {
  final String title;
  final String description;
  final String thumbnail;
  final double? rating;
  final List? reviews;

  ProductInfo({
    required this.title,
    required this.description,
    required this.thumbnail,
    this.rating,
    this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 0),
            height: 200,
            width: double.infinity,

            child: imageUrl(this.thumbnail),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),

            child: Text(
              this.title!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EasyStarsDisplay(
                  initialRating: this.rating ?? 0.0,
                  readOnly: true,
                  filledColor: Colors.cyan,
                ),
                Text(" ${this.rating.toString()}"),
                Text(" (${this.reviews?.length.toString() ?? '0'} reviews)"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
