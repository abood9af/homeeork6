
import 'package:homework6/models/items_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  String link = "https://dummyjson.com/products";

  Future<List<ItemsModel>> getItems() async {
    var uri = Uri.parse(link);
    var response = await http.get(uri);
    var resualte = jsonDecode(response.body);
    //print(response.body);

    List<ItemsModel> itemsList = [];

    for (var element in resualte['products']) {
      ItemsModel item = ItemsModel.fromJson(element);
      itemsList.add(item);
    }

    return itemsList;
  }
}

