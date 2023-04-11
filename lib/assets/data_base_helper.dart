import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBManager {
  static const tableName = 'Reminders';
  static const Patient = 'Patient';
  static const Person = 'Person';
  static const Doctor = 'Doctor';
  static const Notification = 'Notification';
  static const Examinations_Type = 'Examinations_Type';
  static const Medicine = 'Medicine';
  static const Medical_Reading = 'Medical_Reading';
  static const Disease = 'Disease';
  static const Messages = 'Messages';
  static const Companion = 'Companion';
  static const Medical_Examination = 'Medical_Examination';
  static const Date = 'Date';
  static const Patient_Medicine = 'Patient_Medicine';



  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'db_Manager.db'),
      onCreate: (db, version) {
        db.execute(
            // 'CREATE TABLE IF NOT EXISTS $tableName(id integer primary key autoincrement,'
            //     ' Reminder_Name TEXT,'
            //     ' Simi_Reminders TEXT,'
            //     ' Reminder_Date TEXT,'
            //     ' Reminder_Type TEXT,'
            //     ' Reminder_Completed INTEGER)'

                'CREATE TABLE IF NOT EXISTS $Person(id integer primary key autoincrement,'
                'ID INT,'
                ' First_Name TEXT,'
                ' Last_Name TEXT,'
                ' Gender TEXT,'
                ' DateOfBirth DateTime ,'
                'Phone_Number int ,'
                'Email Text ,'
                'Password Text ,'
                'Image_Link Text )'

                'CREATE TABLE IF NOT EXISTS $Doctor(id integer primary key autoincrement,'
                'Clinic_Address TEXT  '
                'Hospital_Name TEXT,'
                'Hospital_Address TEXT,'
                'Hospital_WorkingHour Double,'
                ' clinic_working_Hour  Double )'

                'CREATE TABLE IF NOT EXISTS $Patient(id integer primary key autoincrement,'
                'height Double'
                'Weight  Double'
                'Diseases TEXT)'

                'CREATE TABLE IF NOT EXISTS $Medicine(id integer primary key autoincrement,'
                'ID INT'
                'Name TEXT)'


                'CREATE TABLE IF NOT EXISTS $Medical_Reading(id integer primary key autoincrement,'
                'Reading_ID Int'
                'Result Float'
                'Date DateTime'
                'Reading_type TEXT)'

                'CREATE TABLE IF NOT EXISTS $Disease(id integer primary key autoincrement,'
                'ID INT'
                'Name TEXT)'

                'CREATE TABLE IF NOT EXISTS $Messages(id integer primary key autoincrement,'
                'ID Int'
                'Body TEXT'
                'Date DateTime'
                'Resever_ID Int'
                'Sender_ID Int)'


                  'CREATE TABLE IF NOT EXISTS $Companion(id integer primary key autoincrement,'
                'Companion_Relation TEXT)'


                'CREATE TABLE IF NOT EXISTS $Medical_Examination(id integer primary key autoincrement,'
                'image_link TEXT'
                'Date DateTime'
                'Comment TEXT)'

                'CREATE TABLE IF NOT EXISTS $Examinations_Type(id integer primary key autoincrement,'
                'ID INT'
                'Name TEXT)'

                'CREATE TABLE IF NOT EXISTS $Date(id integer primary key autoincrement,'
                'Dday Int'
                'DMonth Int'
                'DYear Int)'

                'CREATE TABLE IF NOT EXISTS $Patient_Medicine(id integer primary key autoincrement,'
                'Med_Type TEXT'
                 'Dose Int'
                 'Repeat Bool'
                 'Date DateTime'
                 'Med_Stock Int'
                 'Remaining_Quantity Int'
                'Status TEXT)'
        );



      },
      version: 2,
    );
  }

  // static Future addReminder(Map<String, Object> data) async {
  //   final db = await DBManager.database();
  //   return db.insert(tableName, data,
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  // }
  //
  // static Future<List<Map<String, dynamic>>> loadReminders() async {
  //   final data = await DBManager.database();
  //   var result = await data.query(tableName);
  //   return result;
  // }

  static Future addReminder(Map<String, Object> data) async {
    final db = await DBManager.database();
    return db.insert(Patient, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> loadReminders() async {
    final data = await DBManager.database();
    var result = await data.query(Patient);
    return result;
  }


  static Future<void> deleteReminder(
      String table,
      int id,
      ) async {
    final data = await DBManager.database();
    await data.delete(
      table,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
