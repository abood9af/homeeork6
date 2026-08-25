import 'package:flutter/material.dart';
import 'package:homework6/constants/color.dart';
import 'package:homework6/models/items_model.dart';

class ProductFeatures extends StatelessWidget {
  const ProductFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.border),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
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
    );
  }
}
