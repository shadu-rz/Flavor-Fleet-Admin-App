import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavor_fleet_admin_app/pages/orders_page.dart';
import 'package:flavor_fleet_admin_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users'),
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
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Container(
                  height: 1,
                  color: Colors.grey,
                );
              },
              itemCount: snapshot.data!.docs.length,
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
                  child: SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.amber,
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        SmallText(
                          text: snap['username'].isEmpty
                              ? snap['email']
                              : snap['username'],
                          size: 18,
                          color: Colors.black,
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_right_alt_outlined),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
