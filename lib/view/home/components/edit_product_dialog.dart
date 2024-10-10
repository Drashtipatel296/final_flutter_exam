import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../model/data_model.dart';
import '../home_screen.dart';

void showEditProductDialog(BuildContext context, ProductModel product) {
  TextEditingController nameController = TextEditingController(text: product.name);
  TextEditingController priceController = TextEditingController(text: product.price.toString());

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Edit Product',style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Product Name',border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(hintText: 'Product Price',border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  priceController.text.isNotEmpty) {
                double price = double.parse(priceController.text);
                controller.editProduct(
                    product.id, nameController.text, price);
                Get.back();
              }
            },
            child: Text(
              'Save',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      );
    },
  );
}