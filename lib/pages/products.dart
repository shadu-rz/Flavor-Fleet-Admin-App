import 'package:flavor_fleet_admin_app/pages/home_page.dart';
import 'package:flavor_fleet_admin_app/pages/users_list_page.dart';
import 'package:flavor_fleet_admin_app/widgets/big_text.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: const BigText(
          text: 'Flavor Fleet Admin',
          color: Colors.white,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomePage(),
            )),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.width / 2,
              child: const Center(
                child: BigText(
                  text: 'Products',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const UsersList(),
            )),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                 color: Colors.cyan,
              ),
             
              height: MediaQuery.of(context).size.width / 2,
              child: const Center(
                child: BigText(
                  text: 'Orders',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
