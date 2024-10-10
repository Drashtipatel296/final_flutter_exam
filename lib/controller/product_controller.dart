import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../helper/product_helper.dart';
import '../model/data_model.dart';

class HomeController extends GetxController {
  var products = <ProductModel>[].obs;
  var cartProducts = <ProductModel>[].obs;

  final DatabaseService _databaseService = DatabaseService();

  @override
  void onInit() {
    fetchProducts();
    fetchCartProducts();
    super.onInit();
  }

  void fetchProducts() async {
    var querySnapshot = await FirebaseFirestore.instance.collection('products').get();
    products.value = querySnapshot.docs.map((doc) => ProductModel.fromJson(doc.data())).toList();
  }

  void fetchCartProducts() async {
    cartProducts.value = await _databaseService.getCartProducts();
  }

  void addProduct(String name, double price) async {
    var newProduct = ProductModel(id: DateTime.now().toString(), name: name, price: price);
    await FirebaseFirestore.instance.collection('products').doc(newProduct.id).set(newProduct.toJson());
    fetchProducts();
  }

  void deleteProduct(String id) async {
    await FirebaseFirestore.instance.collection('products').doc(id).delete();
    fetchProducts();
  }

  void editProduct(String id, String name, double price) async {
    var updatedProduct = ProductModel(id: id, name: name, price: price);
    await FirebaseFirestore.instance.collection('products').doc(id).update(updatedProduct.toJson());
    fetchProducts();
  }

  void addToCart(ProductModel product) async {
    await _databaseService.insertProduct(product);
    fetchCartProducts();
  }

  void deleteFromCart(String id) async {
    await _databaseService.deleteProduct(id);
    fetchCartProducts();
  }
}