import 'dart:collection';
import 'package:cbloiro/database/db_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/times.dart';
import '../models/titulos.dart';

import 'package:cbloiro/database/db.dart';

class TimesRepository extends ChangeNotifier {
  //ChangeNotifier Classe que notifica as widgets que estão usando esse repositório
  final List<Time> _times = [];

  UnmodifiableListView<Time> get times => UnmodifiableListView(
      _times); //UnmodifiableListView garante que a lista não é modificada, melhorando perfomance

  void addTitulo({Time time, Titulo titulos}) async {
    // var db = await DB.get();

    // int id = await db.insert('titulos',
    //     {'nome': titulos.nome, 'ano': titulos.ano, 'time_id': time.id});
    // titulos.id = id;
    // time.titulos.add(
    //     titulos); //mudando um objeto do tipo time mas não notifica as widgets que precisão de atualização
    //
    // FIREBASE
    FirebaseFirestore db = await DBFirestore.get();
    var docRef = await db.collection('titulos').add({
      'nome': titulos.nome,
      'ano': titulos.ano,
      'time_id': time.id,
    });
    titulos.id = docRef.id;

    time.titulos.add(titulos);
    notifyListeners(); //Quando uma mudança é feita, notifica as widgets que precisão de atualização
  }

  static setupTimes() {
    return [
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
    ];
  }

  TimesRepository() {
    initRepository();
  }

  initRepository() async {
    var db = await DB.get();
    List times =
        await db.query('times'); // igual a db.rawQuery('SELECT * FROM times');
    for (var time in times) {
      _times.add(Time(
          id: time['id'],
          icone: time['icone'],
          nome: time['nome'],
          porctVitoria: time['porcVitoria'],
          titulos: await getTitulos(time['id'])));
    }

    notifyListeners();
  }

  getTitulos(timeID) async {
    // var db = await DB.get();
    // var results =
    //     await db.query('titulos', where: 'time_id = ?', whereArgs: [timeID]);
    // List<Titulo> titulos = [];
    // for (var titulo in results) {
    //   titulos.add(
    //       Titulo(ano: titulo['ano'], nome: titulo['nome'], id: titulo['id']));
    // }
    // FIREBASE
    FirebaseFirestore db = await DBFirestore.get();
    var snapshot = await db
        .collection('titulos')
        .where('time_id', isEqualTo: timeID)
        .get();
    List<Titulo> titulos = [];
    snapshot.docs.forEach((doc) {
      final data = doc.data();
      titulos.add(Titulo(
        id: doc.id,
        nome: data['nome'],
        ano: data['ano'],
      ));
    });
    return titulos;
  }

  void editTitulo({Titulo titulo, String nome, String ano}) async {
    // var db = await DB.get();

    // await db.update(
    //     'titulos',
    //     {
    //       'nome': nome,
    //       'ano': ano,
    //     },
    //     where: 'id = ?',
    //     whereArgs: [titulo.id]);
    // FIREBASE

    FirebaseFirestore db = await DBFirestore.get();
    await db.collection('titulos').doc(titulo.id).update({
      'nome': nome,
      'ano': ano,
    });

    titulo.nome = nome;
    titulo.ano = ano;
    notifyListeners(); //avisa todos que usam o repositório p/ atualizar
  }
}
