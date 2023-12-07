import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavor_fleet_admin_app/models/popular_product_model.dart';
import 'package:flavor_fleet_admin_app/models/recommended_product_mode.dart';
import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  addToPopularProduct(
    String title,
    String price,
    String description,
    String rating,
    String star,
    String time,
    String image,
    String distance,
  ) {
    String id = const Uuid().v1();
    try {
      if (title.isNotEmpty &&
          price.isNotEmpty &&
          description.isNotEmpty &&
          rating.isNotEmpty &&
          star.isNotEmpty &&
          time.isNotEmpty &&
          image.isNotEmpty &&
          distance.isNotEmpty) {
        PopularProductModel popularModel = PopularProductModel(
          title: title,
          price: price,
          image: image,
          description: description,
          distance: distance,
          rating: rating,
          star: star,
          time: time,
          productId: id,
        );

        firestore
            .collection('popularProducts')
            .doc(id)
            .set(popularModel.toJson());
        log('success');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  addToRecommendedProduct(
    String title,
    String description,
    String rating,
    String star,
    String image,
    String distance,
    String price,
  ) {
    String id = const Uuid().v1();
    try {
      if (title.isNotEmpty &&
          description.isNotEmpty &&
          rating.isNotEmpty &&
          star.isNotEmpty &&
          image.isNotEmpty &&
          distance.isNotEmpty &&
          price.isNotEmpty) {
        RecommendedProductModel recommendedModel = RecommendedProductModel(
          title: title,
          price: price,
          image: image,
          description: description,
          distance: distance,
          rating: rating,
          star: star,
          productId: id,
        );
        firestore
            .collection('recommendedProducts')
            .doc(id)
            .set(recommendedModel.toJson());

        log('success');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('popularProducts')
          .doc(productId)
          .get();
      await doc.reference.delete();
    } catch (e) {
      log(e.toString());
    }
  }
  Future<void> deleteRecProduct(String productId) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('recommendedProducts')
          .doc(productId)
          .get();
      await doc.reference.delete();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateOrderDetails(
    String productId,
    bool orderRecieved,
    bool preparing,
    bool outOfDelivery,
    bool delivered,
  ) async {
    try {
      await firestore.collection('orders').doc(productId).update({
        'orderRecived': orderRecieved,
        'preparing': preparing,
        'outOfDelivery': outOfDelivery,
        'delivered': delivered,
      });
      
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteOrderedItem(String id) async {
    try {
      await firestore.collection('orders').doc(id).delete();
      
    } catch (e) {
      log('Error deleting document: $e');
    }
  }
}
