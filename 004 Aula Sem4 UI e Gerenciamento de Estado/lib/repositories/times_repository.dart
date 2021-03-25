import 'dart:collection';

import 'package:flutter/material.dart';
import '../models/times.dart';
import '../models/titulos.dart';

class TimesRepository extends ChangeNotifier {
  //ChangeNotifier Classe que notifica as widgets que estão usando esse repositório
  final List<Time> _times = [];

  UnmodifiableListView<Time> get times => UnmodifiableListView(
      _times); //UnmodifiableListView garante que a lista não é modificada, melhorando perfomance

  void addTitulo({Time time, Titulo titulos}) {
    time.titulos.add(
        titulos); //mudando um objeto do tipo time mas não notifica as widgets que precisão de atualização
    notifyListeners(); //Quando uma mudança é feita, notifica as widgets que precisão de atualização
  }

  TimesRepository() {
    _times.addAll([
      Time(
          icone: 'https://i.imgur.com/4pZ1Tgj.png',
          porctVitoria: 72,
          nome: 'Flamengo'),
      Time(
          icone: 'https://i.imgur.com/4FJlcIi.png',
          porctVitoria: 72,
          nome: 'Vorax'),
      Time(
          icone: 'https://i.imgur.com/E5SIQbv.png',
          porctVitoria: 66,
          nome: 'RED Canids'),
      Time(
          icone: 'https://i.imgur.com/usl3TaA.png',
          porctVitoria: 61,
          nome: 'Loud'),
      Time(
          icone: 'https://i.imgur.com/G8OHG4P.png',
          porctVitoria: 61,
          nome: 'Pain'),
      Time(
          icone: 'https://i.imgur.com/NCyE6He.png',
          porctVitoria: 50,
          nome: 'KaBuM!'),
      Time(
          icone: 'https://i.imgur.com/ZdK8fNR.png',
          porctVitoria: 33,
          nome: 'Cruzeiro'),
      Time(
          icone: 'https://i.imgur.com/uYeNjTo.png',
          porctVitoria: 33,
          nome: 'INTZ'),
      Time(
          icone: 'https://i.imgur.com/0XzW32c.png',
          porctVitoria: 27,
          nome: 'FURIA'),
      Time(
          icone: 'https://i.imgur.com/A9YHSvg.png',
          porctVitoria: 22,
          nome: 'Rensga'),
    ]);
  }

  void editTitulo({Titulo titulo, String nome, String ano}) {
    titulo.ano = ano;
    titulo.nome = nome;
    notifyListeners(); //avisa todos que usam o repositório p/ atualizar
  }
}
