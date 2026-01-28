import 'package:flutter/material.dart';
import 'package:homework6/screens/detales.dart';
import 'package:homework6/services/api.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Products")),
      body: FutureBuilder(
        future: Api().getItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == null) {
            return Center(child: Text('No Data Found'));
          }
          return GridView.builder(
            itemCount: snapshot.data!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              var item = snapshot.data![index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      snapshot.data![index].thumbnail ?? 'No Image',
                      height: 85,
                      width: 85,
                      fit: BoxFit.cover,
                    ),
                    Text(snapshot.data![index].title ?? 'No Title'),
                    Text('\$${item.price.toString()}'),
                    ElevatedButton(
                      onPressed: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Detales(itemsdata: snapshot.data![index])),
                        );
                      },
                      child: Text("info"),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
