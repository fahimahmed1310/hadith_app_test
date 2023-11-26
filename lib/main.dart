import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hadith_app_test/helper/init_dependency.dart';
import 'package:hadith_app_test/pages/home_page.dart';


void main() {
  runApp(const HadithAppTest());
}


class HadithAppTest extends StatelessWidget {
  const HadithAppTest({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialBinding: InitDependency(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

