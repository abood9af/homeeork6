import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:homework6/models/items_model.dart';

class Reviwes extends StatelessWidget {
  final ItemsModel itemsdata;
  const Reviwes({super.key, required this.itemsdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Reviwes")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: ListView.builder(
            itemCount: itemsdata.reviews?.length ?? 0,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    margin: EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Text(" Comment: ${itemsdata.reviews![index]["comment"] ?? ''}"),
                        Text(" Rating: ${itemsdata.reviews![index]["rating"] ?? 0}"),
                         Row( children: [ 
                          SizedBox(width: 121,),
                          EasyStarsDisplay(
                         initialRating: itemsdata.reviews![index]["rating"]?.toDouble() ?? 0.0,
                         readOnly: true,
                         filledColor: Colors.green,
                       ),]
                         ),
                       
                        Text(" Reviewer Name: ${itemsdata.reviews![index]["reviewerName"] ?? ''}"),
                        Text(" Reviewer Email: ${itemsdata.reviews![index]["reviewerEmail"] ?? ''}"),
                        Text(" Date and time: ${itemsdata.reviews![index]["date"] ?? ''}"),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
