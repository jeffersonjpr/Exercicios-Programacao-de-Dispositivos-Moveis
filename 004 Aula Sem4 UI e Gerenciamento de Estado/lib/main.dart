import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main(List<String> args) {
  runApp(AppCbloiro2021());
}

class AppCbloiro2021 extends StatelessWidget {
  const AppCbloiro2021({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cbloiro',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
