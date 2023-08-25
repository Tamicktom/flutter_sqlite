import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

class MyDb {
  late Database db;
  Future open() async {
    // Get a location using getDatabasesPath
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    //join is from path package
    print(path);
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(''' 
                  CREATE TABLE IF NOT EXISTS products (  
                        id primary key, 
                        name varchar(255) not null,
                        roll_no int not null,
                        price int not null,
                        quantity int not null,
                    ); 
                    //create more table here 
                ''');
      //table students will be created if there is no table 'students'
      print("Tabela Criada com Sucesso!");
    });
  }

  Future<Map<dynamic, dynamic>?> getProduct(int rollno) async {
    List<Map> maps =
        await db.query('products', where: 'roll_no = ?', whereArgs: [rollno]);
    //getting student data with roll no.
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }
}
