import 'dart:io';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
part 'app_database.g.dart';


class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get titleAr => text()();
  IntColumn get numberOfHadis => integer()();
  TextColumn get abvrCode => text()();
  TextColumn get bookName => text()();
  TextColumn get bookDescr => text()();
  TextColumn get colorCode => text()();
}


class Chapters extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get chapterId => integer()();
  IntColumn get bookId => integer()();
  TextColumn get title => text()();
  IntColumn get number => integer()();
  TextColumn get hadisRange => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'hadith.db'));

    if (!await file.exists()) {
      // Extract the pre-populated database file from assets
      final blob = await rootBundle.load('assets/database/hadith_bn_test.db');
      final buffer = blob.buffer;
      await file.writeAsBytes(buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
    }

    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Books,Chapters])

class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  int get schemaVersion => 2;


  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1) {
          // we added the dueDate property in the change from version 1 to
          // version 2
          await m.createTable(chapters);
        }
        if (from ==2 ) {
          // we added the priority property in the change from version 1 or 2
          // to version 3
        }
      },
    );
  }




  // Fetch from Books Table
  Future<List<Book>> fetchBooks()async{
    return await select(books).get();
  }



  //Fetch from Chapters using id
  Future<List<Chapter>>fetchChapters(int id)async{
    return await (select(chapters)..where((value){
      return value.bookId.equals(id);
    })).get();
  }



}



