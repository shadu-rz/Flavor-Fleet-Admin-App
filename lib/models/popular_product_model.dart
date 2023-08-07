import 'package:cloud_firestore/cloud_firestore.dart';

class PopularProductModel {
  final String title;
  final String description;
  final String price;
  final String image;
  final String distance;
  final String rating;
  final String star;
  final String time;
  final String productId;


  PopularProductModel({
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.distance,
    required this.rating,
    required this.star,
    required this.time,
    required this.productId
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "price": price,
        "image": image,
        "distance": distance,
        "rating": rating,
        "star": star,
        "time": time,
        "productId":productId
      };

  static PopularProductModel fromSnapshot(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return PopularProductModel(
      title: snapShot['title'],
      price: snapShot['price'],
      image: snapShot['image'],
      description: snapShot['description'],
      distance: snapShot['distance'],
      rating: snapShot['rating'],
      star: snapShot['star'],
      time: snapShot['time'],
      productId: snapShot['productId'],
    );
  }
}
