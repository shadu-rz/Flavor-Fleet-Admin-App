import 'package:cloud_firestore/cloud_firestore.dart';

class RecommendedProductModel {
  final String title;
  final String description;
  final String price;
  final String image;
  final String distance;
  final String rating;
  final String star;
  final String productId;

  RecommendedProductModel({
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.distance,
    required this.rating,
    required this.star,
    required this.productId,
  });

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "price": price,
        "image": image,
        "distance": distance,
        "rating": rating,
        "star": star,
        'productId':productId
      };

  static RecommendedProductModel fromSnapshot(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return RecommendedProductModel(
      title: snapShot['title'],
      price: snapShot['price'],
      image: snapShot['image'],
      description: snapShot['description'],
      distance: snapShot['distance'],
      rating: snapShot['rating'],
      star: snapShot['star'],
      productId: snapShot['productId']
    );
  }


}
