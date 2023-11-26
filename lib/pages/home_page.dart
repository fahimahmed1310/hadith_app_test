import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith_app_test/controllers/database_controller.dart';
import 'package:hadith_app_test/utils/app_constants.dart';
import 'package:hadith_app_test/utils/common_methods.dart';
import 'package:hadith_app_test/utils/common_widgets/card_list_ui.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseController databaseController = Get.find();

    return GetBuilder<DatabaseController>(builder: (_) {
      return databaseController.success == true
          ? Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  AppConstants.appBarTitle,
                  style: TextStyle(
                      fontFamily: "Sultan",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                centerTitle: true,
              ),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03,
                      right: MediaQuery.of(context).size.width * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.01),
                        child: const Text(
                          "সব হাদিসের বই",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Sultan",
                              fontSize: 15,
                              color: Colors.white),
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
                            itemCount: databaseController.bookList.length,
                            itemBuilder: (context, index) {
                              final book = databaseController.bookList[index];

                              String modifiedColor = CommonMethods.colorModification(book.colorCode);
                              String numberOfHadith = CommonMethods.englishToBangla(book.numberOfHadis);

                              return CardListUi(
                                modifiedColor: modifiedColor,
                                abvrCode: book.abvrCode,
                                title: book.title,
                                numberOfHadis: numberOfHadith,
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
    });
    //:
  }
}
