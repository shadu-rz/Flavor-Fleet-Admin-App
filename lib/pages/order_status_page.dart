
import 'package:flavor_fleet_admin_app/firebase/firestore_methods.dart';
import 'package:flavor_fleet_admin_app/widgets/big_text.dart';
import 'package:flavor_fleet_admin_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderStatusPage extends StatelessWidget {
  final Map<String, dynamic> snap;
  const OrderStatusPage({
    super.key,
    required this.snap,
  });

  @override
  Widget build(BuildContext context) {
    RxBool orderRecieved = RxBool(snap['orderRecived']);
    RxBool preparing = RxBool(snap['preparing']);
    RxBool outOfDelivery = RxBool(snap['outOfDelivery']);
    RxBool delivered = RxBool(snap['delivered']);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const BigText(text: 'Order Details'),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45 * 2,
            // color: Colors.grey,
            child: Row(
              children: [
                const SizedBox(width: 25),
                BigText(text: snap['title'].toString().toUpperCase()),
                const Spacer(),
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        snap['image'],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: Row(
              children: [
                const SizedBox(width: 10),
                Obx(
                  () => Checkbox(
                    value: orderRecieved.value,
                    onChanged: (value) {
                      orderRecieved.value = !orderRecieved.value;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SmallText(
                  text: 'Order recived ',
                  size: 17,
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: Row(
              children: [
                const SizedBox(width: 10),
                Obx(
                  () => Checkbox(
                    value: preparing.value,
                    onChanged: (value) {
                      preparing.value = !preparing.value;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SmallText(
                  text: 'preparing ',
                  size: 17,
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: Row(
              children: [
                const SizedBox(width: 10),
                Obx(
                  () => Checkbox(
                    value: outOfDelivery.value,
                    onChanged: (value) {
                      outOfDelivery.value = !outOfDelivery.value;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SmallText(
                  text: 'out of delivery ',
                  size: 17,
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: Row(
              children: [
                const SizedBox(width: 10),
                Obx(
                  () => Checkbox(
                    value: delivered.value,
                    onChanged: (value) {
                      delivered.value = !delivered.value;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SmallText(
                  text: 'Delivered ',
                  size: 17,
                )
              ],
            ),
          ),
          
         const Spacer(),
          GestureDetector(
            onTap: () async {
               await FirestoreMethods().updateOrderDetails(
                snap['productId'],
                orderRecieved.value,
                preparing.value,
                outOfDelivery.value,
                delivered.value,
              );
            
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Center(
                child: SmallText(
                  text: 'Save',
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
