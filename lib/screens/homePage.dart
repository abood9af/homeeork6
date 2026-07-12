
import 'package:flutter/material.dart';
import 'package:homework6/constants/images.dart';
import 'package:homework6/screens/detales.dart';
import 'package:homework6/services/api.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List names = ["mohamed", "abdullah", "khalid", "nour", "ground", "phone"];
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Products")),
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.2,
            width: screenWidth,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: names.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: screenWidth * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        names[index],
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
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
                    return Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Hero(
                        tag: item.title!,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                imageUrl(snapshot.data![index].thumbnail ?? ''),
                                Text(snapshot.data![index].title ?? 'No Title'),
                                Text('\$${item.price.toString()}'),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Detales(
                                          item: snapshot.data![index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("info"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
