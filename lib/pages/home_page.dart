import 'package:flutter/material.dart';
import 'package:hadith_app_test/database/app_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppDatabase _appDatabase;
  List<Book> bookList = [];

  @override
  void initState() {
    super.initState();
    _appDatabase = AppDatabase();
  }

  Future<void> getBookList() async {
    bookList = await _appDatabase.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar : AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("হাদিস",style: TextStyle(
          fontFamily: "Bangla",
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getBookList(),
        builder: (context,snapshot){
          if(snapshot.connectionState != ConnectionState.done){
            return Center(child: CircularProgressIndicator(color: Colors.black,));
          }
          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if(bookList.isNotEmpty){
            return ListView.builder(
                  itemCount: bookList.length,
                  itemBuilder: (context, index) {
                    final book = bookList[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text(book.title,style: TextStyle(
                            fontFamily: "Bangla",
                            fontWeight: FontWeight.bold
                        ),)),
                        Center(child: Text(book.abvrCode)),
                        Center(child: Text(book.id.toString())),
                        Center(child: Text(book.colorCode)),
                      ],
                    );
                  },
                );
          }
          return Center(child: Text("No data found"),);
        }
      ),
      // bookList.isNotEmpty? ListView.builder(
      //   itemCount: bookList.length,
      //   itemBuilder: (context, index) {
      //     final book = bookList[index];
      //     return Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Center(child: Text(book.title)),
      //         Center(child: Text(book.abvrCode)),
      //         Center(child: Text(book.id.toString())),
      //         Center(child: Text(book.colorCode)),
      //       ],
      //     );
      //   },
      // ): const Center(child: CircularProgressIndicator(color: Colors.black,),)
    );
}
}
