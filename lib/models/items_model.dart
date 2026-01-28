class ItemsModel {
   int? id;
   String? title;
   String? description;
   double? rating;
   double? price;
   String? category;
   List? reviews;
   String? thumbnail;
   

  ItemsModel({
    this.id,
    this.title,
    this.description,
    this.rating,
    this.price,
    this.category,
    this.reviews,
    this.thumbnail,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      id: json['id']??'unknown',
      title: json['title']??'unknown',
      description: json['description']??'unknown',
      rating: json['rating']??'',
      price: json['price']??'',
      category: json['category']??'unknown',
      reviews: json['reviews']??'unknown',
      thumbnail: json['thumbnail']??'unknown',
    );
  }

  
   
  
}