import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../helper/product_helper.dart';
import '../../model/data_model.dart';

class CartPage extends StatelessWidget {
  final DatabaseService dbService = DatabaseService();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.red.shade400,
        title: Text(
          'Cart',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: dbService.getCartProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final products = snapshot.data ?? [];
          if (products.isEmpty) {
            return const Center(child: Text('Your cart is empty.'));
          }
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text(
                      product.name,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red.shade400,
                      ),
                      onPressed: () async {
                        await dbService.deleteProduct(product.id);
                        Get.snackbar(
                            'Removed', '${product.name} removed from cart');
                        Get.forceAppUpdate();
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
