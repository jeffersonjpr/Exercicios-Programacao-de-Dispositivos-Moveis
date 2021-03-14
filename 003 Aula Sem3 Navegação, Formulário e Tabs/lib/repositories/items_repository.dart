import 'package:flutter/material.dart';
import 'package:fluttuando/models/items.dart';
import 'package:fluttuando/models/stats.dart';

class ItemsRepository {
  final List<Item> _items = [];

  get items => this._items;

  void addStats({Item item, Stats stats}) {
    item.stats.add(stats);
  }

  ItemsRepository() {
    _items.addAll([
      Item(
          icone:
              'https://static.wikia.nocookie.net/leagueoflegends/images/0/00/Black_Cleaver_item_HD.png',
          dano: 40,
          nome: 'Black Cleaver',
          cor: Colors.red[900]),
      Item(
          icone:
              'https://static.wikia.nocookie.net/leagueoflegends/images/9/9d/Blade_of_the_Ruined_King_item_HD.png',
          dano: 40,
          nome: 'Blade of the Ruined King',
          cor: Colors.indigo[800]),
      Item(
          icone:
              'https://static.wikia.nocookie.net/leagueoflegends/images/5/5e/Phantom_Dancer_item_HD.png',
          dano: 20,
          nome: 'Phantom Dancer',
          cor: Colors.tealAccent[700]),
      Item(
          icone:
              'https://static.wikia.nocookie.net/leagueoflegends/images/b/b9/Bloodthirster_item_HD.png',
          dano: 55,
          nome: 'Bloodthirsteredit',
          cor: Colors.redAccent[700]),
      Item(
          icone:
              'https://static.wikia.nocookie.net/leagueoflegends/images/9/90/Ravenous_Hydra_item_HD.png',
          dano: 65,
          nome: 'Ravenous Hydra',
          cor: Colors.deepOrangeAccent[700]),
    ]);
  }
}
