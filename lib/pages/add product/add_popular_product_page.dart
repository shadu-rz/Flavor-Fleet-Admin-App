import 'package:flavor_fleet_admin_app/firebase/firestore_methods.dart';
import 'package:flavor_fleet_admin_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class PopularProduct extends StatefulWidget {
  const PopularProduct({super.key});

  @override
  State<PopularProduct> createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController starController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController distanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: const Text(
          'Popular Product',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await FirestoreMethods().addToPopularProduct(
                    titleController.text,
                    priceController.text,
                    descriptionController.text,
                    ratingController.text,
                    starController.text,
                    timeController.text,
                    imageController.text,
                    distanceController.text);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
              child: Text(
                'Product name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextFieldWidget(
                textController: titleController,
                hintText: 'title',
                keyboardType: TextInputType.name),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
              child: Text(
                'Description about the product',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextFieldWidget(
                textController: descriptionController,
                hintText: 'description',
                keyboardType: TextInputType.name),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
              child: Text(
                'Product Price',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextFieldWidget(
              keyboardType: TextInputType.number,
              textController: priceController,
              hintText: 'price',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
              child: Text(
                'Rating of the product',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextFieldWidget(
                keyboardType: TextInputType.number,
                textController: ratingController,
                hintText: 'rating'),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
              child: Text(
                'Number of stars ( based on the rating )',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextFieldWidget(
                textController: starController,
                hintText: 'star',
                keyboardType: TextInputType.number),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
              child: Text(
                'Time',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextFieldWidget(
                textController: timeController,
                hintText: 'time',
                keyboardType: TextInputType.number),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
              child: Text(
                'Distance',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextFieldWidget(
              textController: distanceController,
              hintText: 'distance',
              keyboardType: TextInputType.number,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
              child: Text(
                'Product Image Url',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextFieldWidget(
              textController: imageController,
              hintText: 'image',
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
