import 'package:flutter/material.dart';
import 'package:hadith_app_test/utils/app_constants.dart';
import 'package:hexagon/hexagon.dart';

class HomePageCardList extends StatelessWidget {
  final String? modifiedColor;
  final String? abvrCode;
  final String? title;
  final String? numberOfHadis;

  HomePageCardList({
    required this.modifiedColor,
    required this.abvrCode,
    required this.title,
    required this.numberOfHadis,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

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
                  color: Color(int.parse(modifiedColor!)),
                  child: Text(abvrCode!,style: const TextStyle(
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
                          const Text("ইমাম",style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Bangla",
                            fontSize: 15,
                          ),),
                        ],
                      ),
                      Expanded(
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
