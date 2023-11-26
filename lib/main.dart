import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const HadithAppTest());
}


class HadithAppTest extends StatelessWidget {
  const HadithAppTest({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

