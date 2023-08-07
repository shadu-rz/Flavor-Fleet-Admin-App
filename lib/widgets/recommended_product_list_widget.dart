import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecommendedProductListWidget extends StatelessWidget {
  const RecommendedProductListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('recommendedProducts')
          .snapshots(),
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

        return ListView.separated(
          itemBuilder: (context, index) {
            var snap = snapshot.data!.docs[index].data();
            return SizedBox(
              height: 70,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(snap['image']),
                      ),
                    ),
                    margin: const EdgeInsets.only(left: 20),
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    snap['title'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () async{
                       await _showMyDialog(context,snap);
                    },
                    icon: const Icon(Icons.delete_outline_rounded),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Container(
            height: 1,
            color: Colors.black,
          ),
          itemCount: snapshot.data!.docs.length,
        );
      },
    );
  }
}

  
  Future<void> _showMyDialog(context,Map<String,dynamic> snap) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Are you sure want to delete?',
              style:  TextStyle(
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
                  
                },
              ),
            ],
          );
        });
  }