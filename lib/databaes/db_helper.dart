import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:weight_diary/models/diary_model.dart';

// final String tableName = 'tasks';

class DatabaseHelper {
  var _db;

  String dbName = 'diary.db';
  String tableName = 'diary_table';
  String colId = 'id';
  String colDate = 'date';
  String colWeight = 'weight';
  String colNote = 'note';

  //DB 조회
  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(
      //DB 경로 지정 : path 패키지의 join 함수 사용
      join(await getDatabasesPath(), dbName),
      onCreate: (db, version) {
        // 데이터베이스에 CREATE TABLE 수행
        return db.execute(
          """
            CREATE TABLE $tableName(
              $colId INTEGER PRIMARY KEY,  
              $colDate TEXT, 
              $colWeight REAL, 
              $colNote TEXT
            )
          """,
        );
      },
      version: 1,
    );
    return _db;
  }

  //Diary 등록
  Future<void> insertDiary(DiaryModel diary) async {
    final Database db = await database;
    print(diary);
    await db.insert(
      tableName,
      diary.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<DiaryModel>> getDiary() async {
    final Database db = await database;
    final List<Map<dynamic, dynamic>> maps = await db.rawQuery(
        "SELECT $colId,date($colDate) as $colDate,$colWeight,$colNote FROM $tableName");
    // final List<Map<dynamic, dynamic>> maps = await db.query(
    //   tableName,
    //   columns: ['$colId','date($colDate)','$colWeight','$colNote'],
    //   orderBy: '$colDate DESC',
    // );

    return List.generate(maps.length, (i) {
      return DiaryModel(
          id: maps[i][colId],
          date: maps[i][colDate],
          weight: maps[i][colWeight],
          note: maps[i][colNote]);
    });
  }

  Future<void> updateTask(DiaryModel diary) async {
    final Database db = await database;

    await db.update(
      tableName,
      diary.toMap(),
      where: "id = ?",
      whereArgs: [diary.date],
    );
  }

  Future<void> deleteDiary(int id) async {
    final db = await database;

    await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> showTable() async {
    final db = await database;

    List result = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type = 'table' AND name NOT LIKE 'android_%'");
    print('show');
    print(result);
  }

  Future<void> readTable() async {
    final db = await database;
    dynamic result = await db
        .rawQuery("SELECT sql FROM sqlite_master WHERE tbl_name='$tableName'");
    print(result);
  }

  Future<void> dropTable() async {
    final db = await database;
    dynamic result = await db.rawQuery("DROP TABLE IF EXISTS '$tableName'");
    print(result);
  }

  Future<void> addTable() async {
    final db = await database;
    dynamic result = await db.rawQuery("""
            CREATE TABLE $tableName(
              $colId INTEGER PRIMARY KEY,  
              $colDate TEXT, 
              $colWeight REAL, 
              $colNote TEXT
            )
          """);
    print(result);
  }
}
