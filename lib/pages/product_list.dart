import 'package:flavor_fleet_admin_app/pages/add_popular_product_page.dart';
import 'package:flavor_fleet_admin_app/pages/add_recommended_product_page.dart';
import 'package:flavor_fleet_admin_app/widgets/popular_product_list_widget.dart';
import 'package:flavor_fleet_admin_app/widgets/recommended_product_list_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: const Text(
          'Food items',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.greenAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Food',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 24),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.green,
                    ),
                    height: 30,
                    width: 30,
                    child: IconButton(
                      iconSize: 15,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PopularProduct(),
                        ));
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: PopulaProductListWidget(),
          ),
          Container(
            color: Colors.greenAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recomended Food',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 24),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.green,
                    ),
                    height: 30,
                    width: 30,
                    child: IconButton(
                      iconSize: 15,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RecommendedProduct(),
                        ));
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(child: RecommendedProductListWidget())
        ],
      ),
    );
  }
}
