import 'package:flutter/material.dart';
import 'package:fluttuando/pages/home_controller.dart';
import 'package:fluttuando/pages/item_page.dart';
import 'home_controller.dart';
import 'package:fluttuando/models/items.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Damage'),
      ),
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: (BuildContext contexto, int i) {
          final List<Item> tabela = controller.tabela;
          return ListTile(
            leading: Image.network(tabela[i].icone),
            title: Text(tabela[i].nome),
            trailing: Text(tabela[i].dano.toString()),
            onTap: () {
              Navigator.push(
                  contexto,
                  MaterialPageRoute(
                      builder: (_) => ItemPage(
                            key: Key(tabela[i].nome),
                            item: tabela[i],
                          )));
            },
          );
        },
        separatorBuilder: (_, __) {
          return Divider();
        },
        padding: EdgeInsets.all(16),
      ),
    );
  }
}
