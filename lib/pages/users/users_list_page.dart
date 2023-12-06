import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavor_fleet_admin_app/pages/orders/orders_page.dart';
import 'package:flavor_fleet_admin_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: const Text(
          'Users',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              log("some error");
            }

            if (!snapshot.hasData) {
              return const Center(
                child: Text('No data'),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  var snap = snapshot.data!.docs[index].data();
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OrderPage(
                          uId: snap['uId'],
                        ),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                      height: 100,
                      width: 100,
                      child: SizedBox(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.amber,
                        child: Center(
                          child: SmallText(
                            text: snap['username'].isEmpty
                                ? snap['email']
                                : snap['username'],
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.docs.length,
              ),
            );
          }),
    );
  }
}
