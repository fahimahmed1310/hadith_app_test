import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith_app_test/controllers/database_controller.dart';
import 'package:hadith_app_test/pages/chapters_page.dart';
import 'package:hadith_app_test/utils/app_constants.dart';
import 'package:hexagon/hexagon.dart';

class CardListUi extends StatelessWidget {
  final String? modifiedColor;
  final String? abvrCode;
  final String? title;
  final String? numberOfHadis;
  final String? chapterId;

  CardListUi({
    this.modifiedColor,
    this.abvrCode,
    this.title,
    this.numberOfHadis,
    this.chapterId
  });

  @override
  Widget build(BuildContext context) {

    DatabaseController databaseController = Get.find();

    return InkWell(
      onTap: (){
        if(databaseController.pageName == PageName.homePage){
          databaseController.pageName = PageName.chaptersPage;
          databaseController.storeHexaColor = modifiedColor!;
          databaseController.chapterList = [];
          databaseController.fetchChapters();
          if(databaseController.success == true){
            Get.to(
                  () => ChaptersPage(
                title: title,
                numberOfHadis: numberOfHadis,
              ),
            );
          }
        }

      },
      child: Card(
          elevation: 0,
          color: AppConstants.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            child: Row(
              children: [
                HexagonWidget.pointy(
                  cornerRadius: 10,
                  width: 50,
                  color: databaseController.pageName == PageName.chaptersPage ? Color(int.parse(databaseController.storeHexaColor))
                      : Color(int.parse(modifiedColor!)),
                  child: Text(
                    databaseController.pageName == PageName.chaptersPage ? chapterId! : abvrCode!,style: const TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Bangla",
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                          databaseController.pageName == PageName.homePage ? const Text("ইমাম",style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Bangla",
                            fontSize: 15,
                          ),):Row(
                            children: [
                              const Text("হাদিসের রেঞ্জঃ ", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Bangla",
                                fontSize: 15,
                              ),),
                              Text("$numberOfHadis", style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Bangla",
                                fontSize: 15,
                              ),),
                            ],
                          )
                        ],
                      ),
                      databaseController.pageName == PageName.homePage ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(numberOfHadis.toString(),style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Bangla",
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                            const Text("হাদিস",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Bangla",
                              ),),
                          ],
                        ),
                      ): Container(),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
