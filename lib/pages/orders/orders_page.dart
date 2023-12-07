import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavor_fleet_admin_app/firebase/firestore_methods.dart';

import 'package:flavor_fleet_admin_app/pages/orders/order_status_page.dart';
import 'package:flavor_fleet_admin_app/widgets/big_text.dart';

import 'package:flavor_fleet_admin_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class OrderPage extends StatelessWidget {
  final String uId;
  const OrderPage({
    super.key,
    required this.uId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.limeAccent,
        title: const BigText(
          text: 'Orders',
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 120,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('orders')
                      .where('uId', isEqualTo: uId)
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
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
                        child: Text('No items'),
                      );
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: BigText(text: 'No items found'),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> snap =
                            snapshot.data!.docs[index].data();
                        DateTime date = (snap['date'] as Timestamp).toDate();

                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => OrderStatusPage(
                                  snap: snap,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.lime,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      Container(
                                        width: 20 * 3,
                                        height: 20 * 3,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  NetworkImage(snap['image']),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SmallText(
                                            text: snap['title']
                                                .toString()
                                                .toUpperCase(),
                                            color: Colors.black,
                                            size: 16,
                                          ),
                                          SmallText(
                                            text:
                                                "${DateFormat.yMEd().format(date)} \n ${DateFormat.jm().format(date)}",
                                            color: Colors.black,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      SmallText(
                                        text: "₹ ${snap['price']}",
                                        size: 18,
                                        color: Colors.blueGrey,
                                      ),
                                      // const Spacer(),
                                      // SmallText(text: "2 items",size: 16,color: Colors.black45),
                                      const Spacer(),
                                      SizedBox(
                                        height: 100,
                                        child: IconButton(
                                          color: Colors.red,
                                          icon:
                                              const Icon(Icons.delete_outline),
                                          onPressed: () async {
                                            await _showMyDialog(context, snap);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

Future<void> _showMyDialog(context, Map<String, dynamic> snap) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you sure want to delete ${snap['title']}',
            style: const TextStyle(
              fontSize: 20 - 3,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () async {
                Navigator.of(context).pop();
                String id = snap['productId'];
                await FirestoreMethods().deleteOrderedItem(id);
              },
            ),
          ],
        );
      });
}
