import 'package:flavor_fleet_admin_app/pages/product_list.dart';
import 'package:flavor_fleet_admin_app/pages/users/users_list_page.dart';
import 'package:flavor_fleet_admin_app/widgets/big_text.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        centerTitle: true,
        title: const BigText(
          text: 'FlavoFleet Admin App',
          color: Colors.black,
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
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.teal,
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
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
              ),
              height: MediaQuery.of(context).size.width / 2,
              child: const Center(
                child: BigText(
                  text: 'Users',
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
