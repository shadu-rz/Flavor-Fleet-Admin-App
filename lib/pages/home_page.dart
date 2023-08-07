
import 'package:flavor_fleet_admin_app/pages/product_add_page.dart';
import 'package:flavor_fleet_admin_app/widgets/popular_product_list_widget.dart';
import 'package:flavor_fleet_admin_app/widgets/recommended_product_list_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Center(
            child: Text(
          'Admin',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        )),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProductAddPage(),
              ));
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: const  Column(
        children: [
          Text('Popular' ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18)),
          Expanded(child:  PopulaProductListWidget()),
          Text('Recomended', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18)),
          Expanded(child:  RecommendedProductListWidget())
        ],
      ),
    );
  }
}

