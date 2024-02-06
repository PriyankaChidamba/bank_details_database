import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper{
  static const _DataBaseName='Bank db.db';
  static const _databaseVersion=4;
  static const BankDetailsTable='BankDetails_Table';

static const columnID= '_id';
static const columnbankName= '_BankName';
static const columnbranchName= '_BranchName';
static const columnAccountNo='_AccountNo';
static const columnIFSCCode='_IFSCCode';

late Database _db;

Future<void>initialization()async{
  final documentDirectory= await getApplicationDocumentsDirectory();
  final path =join(documentDirectory.path,_DataBaseName);

  _db=await openDatabase(
    path,
    version: _databaseVersion,
    onCreate: _onCreate,
    onUpgrade: _onUpgrade
  );
}
Future _onCreate(Database database,int version)async{
  await database.execute(
    '''CREATE TABLE $BankDetailsTable(
          $columnID INTEGER PRIMARY KEY,
          $columnbankName TEXT,
          $columnbranchName TEXT,
          $columnAccountNo TEXT,
          $columnIFSCCode TEXT

  )''');
}
_onUpgrade(Database database ,int oldVersion,int newVersion)async{
  await database.execute(
    'drop table $BankDetailsTable'
  );
  _onCreate(database, newVersion);
}
Future <int>insert(Map<String,dynamic>row,String tableName)async{
  return await _db.insert(tableName, row);
}
  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async{
    // select * from banik_details_table;
    return await _db.query(tableName);
  }

}