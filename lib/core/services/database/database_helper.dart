import 'package:eshtery/constants.dart';
import 'package:eshtery/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDb();

    return _database;
  }

  String priceItemInsert="0.0";
  //this method to create database
  initDb() async {
    String path = join(await getDatabasesPath(), 'cartProduct.db');
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      db.execute('''
      CREATE TABLE $KTableCartProduct (
      $KColumnProductId TEXT NOT NULL,
      $KColumnName TEXT NOT NULL,
      $KColumnImage TEXT NOT NULL,
      $KColumnPrice TEXT NOT NULL,
      $KColumnQuantity INTEGER NOT NULL)
      ''');
    });
  }

  //this method to solve problem when insert many item from ths same type
  insertToDatabase(CartProductModel model) async {
    var dbClient = await database;
    //first search in database item is find or not in database
     await dbClient.query(KTableCartProduct, where: '$KColumnProductId =?', whereArgs: [model.productId]).then((value) {

       //where value is empty insert item of not empty not insert item
      if (value.isEmpty) {
        print("Empty done ");
        dbClient
            .insert(
          KTableCartProduct,
          model.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        ).then((value) {
          priceItemInsert=model.price;
          print("Database Id = " +model.productId);

        });
      }else{
        print(value[0]['price']);
        priceItemInsert="0.0";
        print("Item inserted in data base before not add anther ");

      }
    });


  }

//this to insert into database by not used it have problem
  insertToDatabases(CartProductModel model) async {
    var dbClient = await database;

    dbClient
        .insert(
      KTableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    )
        .then((value) => print("Database Id = " +model.productId));
  }

  //this get products
  Future<List<CartProductModel>> getDataFromDatabase() async {
    var dbClient = await database;

    List<Map> map = await dbClient.query(KTableCartProduct);
    List<CartProductModel> model = map.isNotEmpty
        ? map.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return model;
  }

  //this to  update products
  updateProduct(CartProductModel model) async {
    var dbClient = await database;

    return await dbClient.update(KTableCartProduct, model.toJson(),
        where: '$KColumnProductId =?', whereArgs: [model.productId]);
  }

  //this for delete item from database
  deleteProduct(CartProductModel model) async {
    var dbClient = await database;

    return await dbClient.delete(KTableCartProduct,
        where: '$KColumnProductId =?',
        whereArgs: [
          model.productId
        ]).then((value) => print("Item Deleted" + value.toString()));
  }
}
