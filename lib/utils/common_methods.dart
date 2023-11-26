import 'package:intl/intl.dart';

class CommonMethods{

  static String englishToBangla(int englishWord){
    return NumberFormat("#########", "bn").format(englishWord);
  }

  static String colorModification(String colorCode){
    return colorCode.replaceAll('#', '0xff');
  }






}
