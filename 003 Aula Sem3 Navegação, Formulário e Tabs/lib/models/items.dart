import 'package:flutter/material.dart';
import 'stats.dart';

class Item {
  String nome;
  String icone;
  int dano;
  Color cor;
  List<Stats> stats = [];

  Item({this.icone, this.nome, this.dano, this.cor});
}
