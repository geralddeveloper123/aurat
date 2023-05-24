import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:aurat/app/model/UserModel.dart';
import '../model/Pesanan.dart';
import '../model/UserModel.dart';

class DbHelper{
  Database? _db;

  static const String DB_Name = 'database.db';
  static const String Table_User = 'user';
  static const String Table_Pesan = 'pesan';
  static const int Version = 1;

  static const String C_Nama = 'nama';
  static const String C_KataSandi = 'katasandi';

  static const String C_Ruang = 'ruang';
  static const String C_NamaPemesan = 'nama_pemesan';
  static const String C_Pemesan = 'pemesan';
  static const String C_Jumlah = 'jumlah';
  static const String C_Kapasitas = 'kapasitas';
  static const String C_Status = 'status';

  Future<Database?> get db async{
    if(_db != null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async{
    String path = join(await getDatabasesPath(),DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        " $C_Nama TEXT, "
        " $C_KataSandi TEXT"
        ")");
    await db.execute("CREATE TABLE $Table_Pesan ("
        " $C_Ruang TEXT, "
        " $C_NamaPemesan TEXT"
        " $C_Pemesan TEXT"
        " $C_Jumlah TEXT"
        " $C_Kapasitas TEXT"
        " $C_Status TEXT"
        ")");
  }

  Future<int?> saveData(UserModel user) async{
    var dbClient = await db;
    var res = await dbClient?.insert(Table_User, user.toMap());
    return res;
  }

  Future<int?> saveDataPesan(Pesanan pesan) async{
    var dbClient = await db;
    var res = await dbClient?.insert(Table_Pesan, pesan.toMap());
    return res;
  }

  Future<UserModel?> getLoginUser(String nama, String katasandi) async {
    var dbClient = await db;
    var res = await dbClient?.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_Nama = '$nama' AND "
        "$C_KataSandi = '$katasandi'");

    if (res!.length > 0) {
      return UserModel.fromMap(res.first);
    }

    return null;
  }

}

