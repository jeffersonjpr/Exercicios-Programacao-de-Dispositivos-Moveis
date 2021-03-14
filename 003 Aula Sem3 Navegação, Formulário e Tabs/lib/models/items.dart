import 'package:flutter/material.dart';
import 'stats.dart';
import 'passive.dart';

class Item {
  String nome;
  String icone;
  int dano;
  Color cor;
  List<Stats> stats = [];
  List<Passive> pasives = [];
  Item({this.icone, this.nome, this.dano, this.cor});
}
