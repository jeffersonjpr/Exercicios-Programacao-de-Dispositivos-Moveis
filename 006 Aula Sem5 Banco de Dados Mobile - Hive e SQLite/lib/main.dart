import 'package:cbloiro/controllers/theme_controller.dart';
import 'package:cbloiro/repositories/times_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

void main(List<String> args) {
  //iniciando a dependencia do ThemeController gerenciamento de estados
  //lazyput é pra inicializar a dependencia antes do app
  Get.lazyPut<ThemeController>(() => ThemeController());

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
    ThemeController.to.loadThemeMode();

    return GetMaterialApp(
      //chaves globais de estado de navegação get e provider
      title: 'Cbloiro',
      debugShowCheckedModeBanner: false,

      ///DEFININDO OS TEMAS
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.grey,
        accentColor: Colors.white,
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black45,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
        ),
      ),
      themeMode: ThemeMode.system,

      home: HomePage(),
    );
  }
}
