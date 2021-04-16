import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var isDark = false
      .obs; // o .obs torna a propriedade reativa, gerenciamento de estado: getx

  Map<String, ThemeMode> themeModes = {
    'light': ThemeMode.light,
    "dark": ThemeMode.dark,
  };

  SharedPreferences prefs; //salva a instancia do sharedpreferences

  // metodo to: recupera a instancia do theme controler
  static ThemeController get to => Get.find();

  loadThemeMode() async {
    //async app não "para" para processar a requisição da função
    prefs = await SharedPreferences
        .getInstance(); //recupera a instancia do SharedPreferences
    String themeText = prefs.getString('theme') ??
        'dark'; //pega o texto do tema ou coloca o padrão dark (se não houver nenhuma)
    isDark.value = themeText == "dark"
        ? true
        : false; //se o themetext for dark retorna verdadeiro
    setMode(themeText);
  }

  Future setMode(String themeText) async {
    ThemeMode themeMode = themeModes[
        themeText]; //pelo mapemaento retorna ThemeMode.dark ou .light
    Get.changeThemeMode(themeMode); // altera o tema

    //grava a nova escolha
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeText);
  }

  changeTheme() {
    setMode(isDark.value
        ? 'light'
        : 'dark'); //se o isdark for verdadeiro muda pra light
    isDark.value = !isDark.value;
  }
}
