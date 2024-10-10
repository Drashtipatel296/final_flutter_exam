import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_screen.dart';

void showAddProductDialog(BuildContext context) {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'Add Product',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: 'Product Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Product Price', border: OutlineInputBorder()),
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
                controller.addProduct(nameController.text, price);
                Get.back();
              }
            },
            child: Text(
              'Add',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      );
    },
  );
}
