import 'package:flutter/material.dart';
import 'package:homework6/models/items_model.dart';
import 'package:homework6/screens/reviwes.dart';

class Detales extends StatelessWidget {
  final ItemsModel itemsdata;
  const Detales({super.key, required this.itemsdata});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(itemsdata.title ?? 'No Title'), titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
      

      body : Container(
        
      child:  Padding(padding:   EdgeInsets.all(16.0),
      
      child: Column(
        
        
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            height: 200,
            width: double.infinity,
            
            child: Image.network(itemsdata.thumbnail ?? 'No Image'),
          ),
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: [
                Text("Category :${itemsdata.category ?? ''}"),
                SizedBox(height: 10,width: 10,),
                Text(itemsdata.description ?? ''),
                SizedBox(height: 10,width: 10,),  
                Text('Rating: ${itemsdata.rating.toString()}'),
              ],

            ),
          ),
          SizedBox(height: 50,width: 20,),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Reviwes(itemsdata: itemsdata)),
              );
            },
            child: Text("Reviwes")
            )
        ],
      ),
      ),
      ),
    );
  }
}