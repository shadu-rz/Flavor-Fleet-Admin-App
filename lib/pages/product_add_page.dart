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
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
        )),
        actions: [
          IconButton(onPressed: (){

          }, icon: const Icon(Icons.add,color: Colors.white,))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PopularProduct(),
                  ));
                },
                child: const Text('Popular Product'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RecommendedProduct(),
                  ));
                },
                child: const Text('Recommended Product'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}