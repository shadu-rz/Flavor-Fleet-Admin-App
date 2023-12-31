import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavor_fleet_admin_app/firebase/firestore_methods.dart';
import 'package:flutter/material.dart';

class PopulaProductListWidget extends StatelessWidget {
  const PopulaProductListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('popularProducts').snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return const Center(child: Text('No Item'));
        }
        if (snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No Item'));
        }

        return Container(
          color: Colors.greenAccent,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            child: SizedBox(
              height: 500,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  var snap = snapshot.data!.docs[index].data();
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          snap['title'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(snap['image']),
                            ),
                          ),
                          height: 100,
                          width: 120,
                        ),
                        IconButton(
                          onPressed: () async {
                            await _showMyDialog(context, snap);
                          },
                          icon: const Icon(
                            Icons.delete_outline_rounded,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: snapshot.data!.docs.length,
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<void> _showMyDialog(context, Map<String, dynamic> snap) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Are you sure want to delete?',
            style: TextStyle(
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
                Navigator.pop(context);
                await FirestoreMethods().deleteProduct(snap['productId']);
              },
            ),
          ],
        );
      });
}
