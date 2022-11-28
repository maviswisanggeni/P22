import 'package:erigo/screen/wishlist-page/models/wishlist_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class WishlistDatabase {
  static final WishlistDatabase instance = WishlistDatabase.init();
  static Database? _database;

  WishlistDatabase.init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('wishlist.db');
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

    await db.execute('''CREATE TABLE $tableWishlist (
    ${Wishlist.id} $idType,
    ${Wishlist.title} $textType,
    ${Wishlist.price} $textType,
    ${Wishlist.image} $textType
    )''');
  }

  Future<int> create(WishlistModel news) async {
    final db = await instance.database;
    final query = await db.insert(tableWishlist, news.toMap());

    return query;
  }

  Future<bool> read(String? name) async {
    final db = await instance.database;

    final maps = await db.query(
      tableWishlist,
      columns: Wishlist.values,
      where: '${Wishlist.title} = ?',
      whereArgs: [name],
    );

    if (maps.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<WishlistModel>> readAll() async {
    Database db = await instance.database;

    final data = await db.query(tableWishlist);
    List<WishlistModel> result =
    data.map((e) => WishlistModel.fromMap(e)).toList();

    return result;
  }

  delete(String? name) async {
    final db = await instance.database;
    try {
      await db.delete(
        tableWishlist,
        where: '${Wishlist.title} = ?',
        whereArgs: [name],
      );
    } catch (e) {
      print(e);
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}