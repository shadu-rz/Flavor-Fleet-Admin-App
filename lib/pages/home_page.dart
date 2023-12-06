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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        title: const Center(
          child: Text(
            'Food items',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
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
                    color: Colors.grey,
                  ),
                  height: 50,
                  width: 50,
                  child: IconButton(
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
          const Expanded(child: PopulaProductListWidget()),
          Padding(
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
                    color: Colors.grey,
                  ),
                  height: 50,
                  width: 50,
                  child: IconButton(
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
          const Expanded(child: RecommendedProductListWidget())
        ],
      ),
    );
  }
}
