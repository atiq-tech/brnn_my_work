import 'package:ecommerceshope/SQFlite_Database/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


  class DBHelper{
  static Future<Database> initDB()async{
  var dbpath=await getDatabasesPath();
  String path=await join(dbpath, 'database.db');
  return await openDatabase(path,version: 1,onCreate: _onCreate);
  }

  static Future _onCreate(Database db,int version) async{
  final sql = '''CREATE TABLE contacts(id INTEGER PRIMARY KEY, productname  TEXT, number TEXT) ''';
  db.execute(sql);
  }

  static Future <int> createContact(Contact contact)async{
  Database db=await DBHelper.initDB();
  return await db.insert('contacts', contact.toJson());
  }

  static Future <List<Contact>> readContact()async{
  Database db=await DBHelper.initDB();
  var contact=await db.query('contacts', orderBy: 'productname');
  List<Contact> contactList = contact.isNotEmpty ? contact.map((details) => Contact.fromJson(details)).toList() : [];
  return contactList;
  }
}