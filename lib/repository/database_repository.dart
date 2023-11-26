import 'package:hadith_app_test/database/app_database.dart';

final AppDatabase _appDatabase = AppDatabase();

class DatabaseRepository{

  Future<List<Book>> fetchBooks()async{
    return await _appDatabase.fetchBooks();
  }

  Future<List<Chapter>> fetchChapters(int id)async{
    return await _appDatabase.fetchChapters(id);
  }

}