import 'package:flutter/material.dart';
import 'package:homework6/constants/color.dart';

class AboutProduct extends StatelessWidget {
  final String productDescription;
  final int proudctRating;
  const AboutProduct({
    super.key,
    required this.productDescription,
    required this.proudctRating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.border),

        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About the product:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10, width: 10),
            Text(productDescription),
            SizedBox(height: 10, width: 10),
            Text(
              'Rating: ${proudctRating.toString()}',
              style: TextStyle(color: Colors.cyan),
            ),
          ],
        ),
      ),
    );
  }
}
