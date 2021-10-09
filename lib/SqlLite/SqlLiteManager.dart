import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlLiteManager {

    static final _instance = SqlLiteManager._private();
    SqlLiteManager._private();
    factory SqlLiteManager() => _instance;

    Database? _database;
    Future<Database> get database async {

        if(_database == null) {
            final databasesPath = await getDatabasesPath();
            _database = await openDatabase(
                join(databasesPath, 'Todo.db'),
                onCreate: (db, version) {
                    return db.execute(
                        "create table todo("
                                "id text primary key,"
                                "title text, "
                                "note text, "
                                "completeBy integer, "
                                "priority text, "
                                "completed integer) without rowid",
                    );
                },
                version: 1,
            );
        }
        return _database!;
    }
}
