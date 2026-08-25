import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:homework6/components/button.dart';
import 'package:homework6/constants/color.dart';
import 'package:homework6/models/items_model.dart';
import 'package:homework6/screens/reviews/rating_card.dart';
import 'package:homework6/screens/reviews/review_card.dart';

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
            Rating(itemsdata: itemsdata),
            Center(
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: itemsdata.reviews?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ReviewCard(itemsdata: itemsdata, index: index);
                  },
                ),
              ),
            ),

            CustomButton(text: "Write a Review", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
