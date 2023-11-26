import 'package:get/get.dart';
import 'package:hadith_app_test/database/app_database.dart';
import 'package:hadith_app_test/repository/database_repository.dart';

enum PageName{
  homePage,chaptersPage
}

class DatabaseController extends GetxController{

  PageName _pageName = PageName.homePage;
  List<Book> _bookList = <Book>[];
  final _success = false.obs;
  final _storeHexaColor =  " ".obs;
  List<Chapter> _chapterList = <Chapter>[];
  final _selectedBookId = 0.obs;


  PageName get pageName => _pageName;
  set pageName(PageName value) {
    _pageName = value;
    update();
  }

  List<Book> get bookList => _bookList;
  set bookList(List<Book> value) {
    _bookList = value;
    update();
  }


  get success => _success.value;
  set success(value) {
    _success.value = value;
  }


  String get storeHexaColor => _storeHexaColor.value;
  set storeHexaColor(String value) {
    _storeHexaColor.value = value;
  }


  List<Chapter> get chapterList => _chapterList;
  set chapterList(List<Chapter> value) {
    _chapterList = value;
    update();
  }

  get selectedBookId => _selectedBookId.value;
  set selectedBookId(value) {
    _selectedBookId.value = value;
  }

  @override
  void onReady() {
    super.onReady();
    fetchBooks();
  }



  //Fetch from Books Table
  Future<void> fetchBooks()async{
    success = false;
    bookList = await DatabaseRepository().fetchBooks();
    if(bookList.isNotEmpty){
      success = true;
    }else{
      success = false;
    }
  }


  //Fetch from Chapters Table
  Future<void> fetchChapters()async{
    success = false;
    chapterList = await DatabaseRepository().fetchChapters(selectedBookId);
    if(chapterList.isNotEmpty){
      success = true;
    }else{
      success = false;
    }
  }




}