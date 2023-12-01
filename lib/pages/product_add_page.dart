import 'package:flavor_fleet_admin_app/pages/add_popular_product_page.dart';
import 'package:flavor_fleet_admin_app/pages/add_recommended_product_page.dart';
import 'package:flutter/material.dart';

class ProductAddPage extends StatelessWidget {
  const ProductAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Product Add',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 150,
              color: Colors.black54,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PopularProduct(),
                  ));
                },
                child: const Text(
                  'Popular Product',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 200,
              color: Colors.blueGrey,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RecommendedProduct(),
                  ));
                },
                child: const Text(
                  'Recommended Product',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
