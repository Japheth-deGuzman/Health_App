import 'dart:io';
import 'package:health_app/db/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstrutor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstrutor();

  static Database? _database;
  Future<Database> get database async => _database ?? await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'healthapp.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
   CREATE TABLE tblbmi(
     id INTEGER PRIMARY KEY,
     bmi TEXT,
     weight TEXT,
     height TEXT,
     result TEXT,
     date TEXT
    )
    ''');

    await db.execute('''
   CREATE TABLE exercise(
     id INTEGER PRIMARY KEY,
     exercise TEXT,
     time TEXT,
     secs TEXT,
     level TEXT,
     date TEXT
    )
    ''');

    await db.execute('''
   CREATE TABLE summary(
     id INTEGER PRIMARY KEY,
     summary TEXT
    )
    ''');

    await db.execute('''
   CREATE TABLE tblbp(
     id INTEGER PRIMARY KEY,
     systolic TEXT,
     diastolic TEXT,
     result TEXT,
     date TEXT
    )
    ''');

    await db.execute('''
   CREATE TABLE tblprofile(
     id INTEGER PRIMARY KEY,
     name TEXT,
     age TEXT
    )
    ''');

    await db.execute('''
   CREATE TABLE tblglucoseac1(
     id INTEGER PRIMARY KEY,
     result TEXT,
     ac1 TEXT,
     date TEXT
    )
    ''');

    await db.execute('''
   CREATE TABLE tblglucosefbst(
     id INTEGER PRIMARY KEY,
     result TEXT,
     fbst TEXT,
     date TEXT
    )
    ''');

    await db.execute('''
   CREATE TABLE tblglucosegtt(
     id INTEGER PRIMARY KEY,
     result TEXT,
     gtt TEXT,
     date TEXT
    )
    ''');
    await db.execute('''
   CREATE TABLE tblglucoserbst(
     id INTEGER PRIMARY KEY,
     result TEXT,
     rbst TEXT,
     date TEXT
    )
    ''');
  }

  // BMI CRUD operation
  Future<List<Bmi>> getBMI() async {
    Database db = await instance.database;
    var bmis = await db.query('tblbmi', orderBy: 'id DESC');
    List<Bmi> bmiList =
        bmis.isNotEmpty ? bmis.map((c) => Bmi.fromMap(c)).toList() : [];
    return bmiList;
  }

  Future<int> addbmi(Bmi bMI) async {
    Database db = await instance.database;
    return await db.insert('tblbmi', bMI.toMap());
  }

  Future<int> deletebmi(int id) async {
    Database db = await instance.database;
    return await db.delete('tblbmi', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updatebmi(Bmi bMI) async {
    Database db = await instance.database;
    return await db
        .update('tblbmi', bMI.toMap(), where: 'id = ?', whereArgs: [bMI.id]);
  }

  Future<List<Bmi>> getBMIonly() async {
    Database db = await instance.database;
    var bmis = await db.query('tblbmi', orderBy: 'id DESC', limit: 1);
    List<Bmi> bmiList =
        bmis.isNotEmpty ? bmis.map((c) => Bmi.fromMap(c)).toList() : [];
    return bmiList;
  }
  // BMI CRUD operation

  //  Exercise Crud Operatio
  Future<List<Exercise>> getEx() async {
    Database db = await instance.database;
    var exercise = await db.query(
      'exercise',
      orderBy: 'id DESC',
    );
    List<Exercise> exerciseList = exercise.isNotEmpty
        ? exercise.map((c) => Exercise.fromMap(c)).toList()
        : [];
    return exerciseList;
  }

  Future<List<Exercise>> getExonly() async {
    Database db = await instance.database;
    var exercise = await db.query('exercise', orderBy: 'id DESC', limit: 1);
    List<Exercise> exerciseList = exercise.isNotEmpty
        ? exercise.map((c) => Exercise.fromMap(c)).toList()
        : [];
    return exerciseList;
  }

  Future<int> addexe(Exercise eXE) async {
    Database db = await instance.database;
    return await db.insert('exercise', eXE.toMap());
  }

  Future<int> deleteexe(int id) async {
    Database db = await instance.database;
    return await db.delete('exercise', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateexe(Exercise eXE) async {
    Database db = await instance.database;
    return await db
        .update('exercise', eXE.toMap(), where: 'id = ?', whereArgs: [eXE.id]);
  }
  // Exercise CRUD operation

//  Exercise Crud Operation___________________________________________________________________________________________________
  Future<List<Summary>> getSumm() async {
    Database db = await instance.database;
    var summary = await db.query(
      'summary',
      orderBy: 'id DESC',
    );
    List<Summary> summList = summary.isNotEmpty
        ? summary.map((c) => Summary.fromMap(c)).toList()
        : [];
    return summList;
  }

  Future<int> addsumm(Summary eXE) async {
    Database db = await instance.database;
    return await db.insert('summary', eXE.toMap());
  }

  Future<int> deletesumm(int id) async {
    Database db = await instance.database;
    return await db.delete('summary', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updatesumm(Summary summ) async {
    Database db = await instance.database;
    return await db
        .update('summary', summ.toMap(), where: 'id = ?', whereArgs: [summ.id]);
  }
  // Exercise CRUD operation_______________________________________________________________________________________________________________



  //  BP Crud Operation
  Future<List<BP>> getbp() async {
    Database db = await instance.database;
    var bp = await db.query(
      'tblbp',
      orderBy: 'id DESC',
    );
    List<BP> bpList =
        bp.isNotEmpty ? bp.map((c) => BP.fromMap(c)).toList() : [];
    return bpList;
  }

  Future<List<BP>> getbponly() async {
    Database db = await instance.database;
    var bp = await db.query(
      'tblbp',
      orderBy: 'id DESC',
      limit: 1,
    );
    List<BP> bpList =
        bp.isNotEmpty ? bp.map((c) => BP.fromMap(c)).toList() : [];
    return bpList;
  }

  Future<int> addbp(BP bp) async {
    Database db = await instance.database;
    return await db.insert('tblbp', bp.toMap());
  }

  Future<int> deletebp(int id) async {
    Database db = await instance.database;
    return await db.delete('tblbp', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updatebp(BP bp) async {
    Database db = await instance.database;
    return await db
        .update('tblbp', bp.toMap(), where: 'id = ?', whereArgs: [bp.id]);
  }

  // BP CRUD operation

  // Profile CRUD operation
  Future<List<Profile>> getprofile() async {
    Database db = await instance.database;
    var pro = await db.query('tblprofile');
    List<Profile> proList =
        pro.isNotEmpty ? pro.map((c) => Profile.fromMap(c)).toList() : [];
    return proList;
  }

  Future<int> addprofile(Profile pRO) async {
    Database db = await instance.database;
    return await db.insert('tblprofile', pRO.toMap());
  }

  Future<int> deleteprofile(int id) async {
    Database db = await instance.database;
    return await db.delete('tblprofile', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateprofile(Profile pRO) async {
    Database db = await instance.database;
    return await db.update('tblprofile', pRO.toMap(),
        where: 'id = ?', whereArgs: [pRO.id]);
  }
  // Profile CRUD operation

  // GlucoseAC1 CRUD operation
  Future<List<GAC1>> getGAC1() async {
    Database db = await instance.database;
    var pro = await db.query('tblglucoseac1', orderBy: 'id DESC');
    List<GAC1> gac1List =
        pro.isNotEmpty ? pro.map((c) => GAC1.fromMap(c)).toList() : [];
    return gac1List;
  }

  Future<List<GAC1>> getGAC1only() async {
    Database db = await instance.database;
    var pro = await db.query('tblglucoseac1', orderBy: 'id DESC', limit: 1);
    List<GAC1> gac1List =
        pro.isNotEmpty ? pro.map((c) => GAC1.fromMap(c)).toList() : [];
    return gac1List;
  }

  Future<int> addGAC1(GAC1 gC1) async {
    Database db = await instance.database;
    return await db.insert('tblglucoseac1', gC1.toMap());
  }

  Future<int> deleteGAC1(int id) async {
    Database db = await instance.database;
    return await db.delete('tblglucoseac1', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateGAC1(GAC1 gC1) async {
    Database db = await instance.database;
    return await db.update('tblglucoseac1', gC1.toMap(),
        where: 'id = ?', whereArgs: [gC1.id]);
  }
  // GlucoseAC1 CRUD operation

  // GlucoseFBST CRUD operation
  Future<List<FBST>> getFBST() async {
    Database db = await instance.database;
    var pro = await db.query('tblglucosefbst', orderBy: 'id DESC');
    List<FBST> fbstList =
        pro.isNotEmpty ? pro.map((c) => FBST.fromMap(c)).toList() : [];
    return fbstList;
  }

  Future<List<FBST>> getFBSTonly() async {
    Database db = await instance.database;
    var pro = await db.query('tblglucosefbst', orderBy: 'id DESC', limit: 1);
    List<FBST> fbstList =
        pro.isNotEmpty ? pro.map((c) => FBST.fromMap(c)).toList() : [];
    return fbstList;
  }

  Future<int> addFBST(FBST fBST) async {
    Database db = await instance.database;
    return await db.insert('tblglucosefbst', fBST.toMap());
  }

  Future<int> deleteFBST(int id) async {
    Database db = await instance.database;
    return await db.delete('tblglucosefbst', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateFBST(FBST fBST) async {
    Database db = await instance.database;
    return await db.update('tblglucosefbst', fBST.toMap(),
        where: 'id = ?', whereArgs: [fBST.id]);
  }
  // GlucoseFBST CRUD operation

  // GlucoseGTT CRUD operation
  Future<List<GTT>> getGTT() async {
    Database db = await instance.database;
    var pro = await db.query('tblglucosegtt', orderBy: 'id DESC');
    List<GTT> gttList =
        pro.isNotEmpty ? pro.map((c) => GTT.fromMap(c)).toList() : [];
    return gttList;
  }

  Future<List<GTT>> getGTTonly() async {
    Database db = await instance.database;
    var pro = await db.query('tblglucosegtt', orderBy: 'id DESC', limit: 1);
    List<GTT> gttList =
        pro.isNotEmpty ? pro.map((c) => GTT.fromMap(c)).toList() : [];
    return gttList;
  }

  Future<int> addGTT(GTT gTT) async {
    Database db = await instance.database;
    return await db.insert('tblglucosegtt', gTT.toMap());
  }

  Future<int> deleteGTT(int id) async {
    Database db = await instance.database;
    return await db.delete('tblglucosegtt', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateGTT(GTT gTT) async {
    Database db = await instance.database;
    return await db.update('tblglucosegtt', gTT.toMap(),
        where: 'id = ?', whereArgs: [gTT.id]);
  }
  // GlucoseGTT CRUD operation

  // GlucoseGTT CRUD operation
  Future<List<RBST>> getRBST() async {
    Database db = await instance.database;
    var pro = await db.query('tblglucoserbst', orderBy: 'id DESC');
    List<RBST> rbstList =
        pro.isNotEmpty ? pro.map((c) => RBST.fromMap(c)).toList() : [];
    return rbstList;
  }

  Future<List<RBST>> getRBSTonly() async {
    Database db = await instance.database;
    var pro = await db.query('tblglucoserbst', orderBy: 'id DESC', limit: 1);
    List<RBST> rbstList =
        pro.isNotEmpty ? pro.map((c) => RBST.fromMap(c)).toList() : [];
    return rbstList;
  }

  Future<int> addRBST(RBST rBST) async {
    Database db = await instance.database;
    return await db.insert('tblglucoserbst', rBST.toMap());
  }

  Future<int> deleteRBST(int id) async {
    Database db = await instance.database;
    return await db.delete('tblglucoserbst', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateRBST(RBST rBST) async {
    Database db = await instance.database;
    return await db.update('tblglucoserbst', rBST.toMap(),
        where: 'id = ?', whereArgs: [rBST.id]);
  }
  // GlucoseGTT CRUD operation
}
