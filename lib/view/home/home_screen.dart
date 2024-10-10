import 'package:final_flutter_exam/view/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/product_controller.dart';
import 'components/add_product_dialoug.dart';
import 'components/edit_product_dialog.dart';

final HomeController controller = Get.put(HomeController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text(
          'Products',
          style: GoogleFonts.poppins(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(CartPage());
            },
            icon: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () => controller.addToCart(product),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () =>
                            showEditProductDialog(context, product),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red.shade400,
                        ),
                        onPressed: () => controller.deleteProduct(product.id),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade400,
        onPressed: () => showAddProductDialog(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
