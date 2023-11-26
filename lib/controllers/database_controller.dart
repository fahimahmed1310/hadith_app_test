import 'package:get/get.dart';
import 'package:hadith_app_test/database/app_database.dart';
import 'package:hadith_app_test/repository/database_repository.dart';

class DatabaseController extends GetxController{

  List<Book> _bookList = <Book>[];
  final _success = false.obs;



  List<Book> get bookList => _bookList;
  set bookList(List<Book> value) {
    _bookList = value;
    update();
  }


  get success => _success.value;
  set success(value) {
    _success.value = value;
  }



  @override
  void onReady() {
    super.onReady();
    fetchBooks();
  }



  //Fetch from Books Table
  Future<void> fetchBooks()async{
    bookList = await DatabaseRepository().fetchBooks();
    if(bookList.isNotEmpty){
      success = true;
    }else{
      success = false;
    }
  }





}