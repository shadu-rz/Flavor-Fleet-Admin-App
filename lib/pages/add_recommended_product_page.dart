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
  TextEditingController priceController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Center(
            child: Text(
          'Recommeded Product',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Padding(
              padding: EdgeInsets.only(left:30,top: 10,bottom: 10),
              child: Text('Product name',style:TextStyle(fontWeight: FontWeight.bold) ,),
            ),
            TextFieldWidget(textController: titleController, hintText: 'title'),
            const Padding(
              padding: EdgeInsets.only(left:30,top: 10,bottom: 10),
              child: Text('Description about the product',style:TextStyle(fontWeight: FontWeight.bold) ,),
            ),
            TextFieldWidget(
                textController: descriptionController, hintText: 'description'),
            const Padding(
              padding: EdgeInsets.only(left:30,top: 10,bottom: 10),
              child: Text('Product Price',style:TextStyle(fontWeight: FontWeight.bold) ,),
            ),
            TextFieldWidget(
                textController: priceController, hintText: 'price',),
           const Padding(
              padding: EdgeInsets.only(left:30,top: 10,bottom: 10),
              child: Text('Rating of the product',style:TextStyle(fontWeight: FontWeight.bold) ,),
            ),
            TextFieldWidget(
                textController: ratingController, hintText: 'rating'),
            const Padding(
              padding: EdgeInsets.only(left:30,top: 10,bottom: 10),
              child: Text('Number of stars ( based on the rating )',style:TextStyle(fontWeight: FontWeight.bold) ,),
            ),
            TextFieldWidget(textController: starController, hintText: 'star'),
            const Padding(
              padding: EdgeInsets.only(left:30,top: 10,bottom: 10),
              child: Text('Product Image Url',style:TextStyle(fontWeight: FontWeight.bold) ,),
            ),
            TextFieldWidget(textController: imageController, hintText: 'image'),
           const Padding(
              padding: EdgeInsets.only(left:30,top: 10,bottom: 10),
              child: Text('Distance',style:TextStyle(fontWeight: FontWeight.bold) ,),
            ),
            TextFieldWidget(
                textController: distanceController, hintText: 'distance',),
            const SizedBox(height: 10),
            
            GestureDetector(
              onTap: () async {
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
              child: Container(
                height: 50,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20, right: 20,bottom: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: const Offset(1, 10),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: const Center(
                    child: Text(
                  'done',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
