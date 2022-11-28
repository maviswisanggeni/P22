import 'package:erigo/screen/cart-page/models/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDatabase {
  static final CartDatabase instance = CartDatabase.init();
  static Database? _database;

  CartDatabase.init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('cart.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''CREATE TABLE $tableCart (
    ${Cart.id} $idType,
    ${Cart.title} $textType,
    ${Cart.price} $textType,
    ${Cart.image} $textType,
    ${Cart.quantity} $textType
    )''');
  }

  Future<int> create(CartModel news) async {
    final db = await instance.database;
    final query = await db.insert(tableCart, news.toMap());

    return query;
  }

  Future<bool> read(String? name) async {
    final db = await instance.database;

    final maps = await db.query(
      tableCart,
      columns: Cart.values,
      where: '${Cart.title} = ?',
      whereArgs: [name],
    );

    if (maps.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<CartModel>> readAll() async {
    Database db = await instance.database;

    final data = await db.query(tableCart);
    List<CartModel> result = data.map((e) => CartModel.fromMap(e)).toList();

    return result;
  }

  delete(String? name) async {
    final db = await instance.database;
    try {
      await db.delete(
        tableCart,
        where: '${Cart.title} = ?',
        whereArgs: [name],
      );
    } catch (e) {
      print(e);
    }
  }

  //close
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
