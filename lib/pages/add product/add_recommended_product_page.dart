import 'package:flavor_fleet_admin_app/firebase/firestore_methods.dart';
import 'package:flavor_fleet_admin_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class RecommendedProduct extends StatefulWidget {
  const RecommendedProduct({super.key});

  @override
  State<RecommendedProduct> createState() => _RecommendedProductState();
}

class _RecommendedProductState extends State<RecommendedProduct> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController starController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: const Text(
          'Recommeded Product',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              FirestoreMethods().addToRecommendedProduct(
                  titleController.text,
                  descriptionController.text,
                  ratingController.text,
                  starController.text,
                  imageController.text,
                  distanceController.text,
                  priceController.text);
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.check),
          )
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
              keyboardType: TextInputType.name,
            ),
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
                textController: priceController,
                hintText: 'price',
                keyboardType: TextInputType.number),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
              child: Text(
                'Rating of the product',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextFieldWidget(
              textController: ratingController,
              hintText: 'rating',
              keyboardType: TextInputType.number,
            ),
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
              keyboardType: TextInputType.number,
            ),
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
            // Center(
            //   child: InkWell(
            //     onTap: () {
                 
            //     },
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: Colors.blue,
            //         borderRadius: BorderRadius.circular(10)
            //       ),
            //       height: 40,
            //       width: 100,
                  
            //       child: const Center(
            //           child: Text(
            //         'Image',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       )),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
