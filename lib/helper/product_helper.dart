import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/data_model.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  DatabaseService._internal();

  static Database? _database;

  factory DatabaseService() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('cart.db');
    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE product(id TEXT PRIMARY KEY, name TEXT, price REAL)');
      },
    );
  }

  Future<void> insertProduct(ProductModel product) async {
    final db = await database;
    await db.insert('product', product.toJson());
  }

  Future<List<ProductModel>> getCartProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('product');
    return List.generate(maps.length, (i) {
      return ProductModel.fromJson(maps[i]);
    });
  }

  Future<void> deleteProduct(String id) async {
    final db = await database;
    await db.delete('product', where: 'id = ?', whereArgs: [id]);
  }
}