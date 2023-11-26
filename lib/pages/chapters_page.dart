import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith_app_test/controllers/database_controller.dart';
import 'package:hadith_app_test/utils/app_constants.dart';
import 'package:hadith_app_test/utils/common_widgets/card_list_ui.dart';

class ChaptersPage extends StatelessWidget {
  final String? title;
  final String? numberOfHadis;



  ChaptersPage({
    required this.title,
    required this.numberOfHadis,
  });

  @override
  Widget build(BuildContext context) {

    DatabaseController databaseController = Get.find();

    return GetBuilder<DatabaseController>(
      builder: (_){
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: AppConstants.cardColor,
            leading: InkWell(
                onTap: () {
                  databaseController.pageName = PageName.homePage;
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title!, style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Bangla",
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
                ),
                Text("$numberOfHadis টি হাদিস",style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Bangla",
                  fontSize: 15,
                ),)
              ],
            ),
          ),
          body:   SafeArea(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              child:   Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        hintText: AppConstants.searchHintText,
                        hintStyle: TextStyle(
                          color: Colors.white54,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        ),
                        fillColor: AppConstants.cardColor,
                        filled: true,
                        suffixIcon: Icon(Icons.search_sharp, color: Colors.white54)
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height:
                            MediaQuery.of(context).size.height * 0.01,
                          );
                        },
                        itemCount: databaseController.chapterList.length,
                        itemBuilder: (context, index) {
                          final chapter = databaseController.chapterList[index];

                          return CardListUi(
                            title: chapter.title,
                            numberOfHadis: chapter.hadisRange,
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
