import 'package:cbloiro/repositories/times_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          TimesRepository(), //isso carrega a dependencia do TimesRepository e fica disponivel  pro app
      child: AppCbloiro2021(),
    ),
  );
}

class AppCbloiro2021 extends StatelessWidget {
  const AppCbloiro2021({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //chaves globais de estado de navegação get e provider
      title: 'Cbloiro',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
