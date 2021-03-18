import 'package:flutter/material.dart';
import 'home_controller.dart';
import 'time_page.dart';
import 'home_controller.dart';
import '../models/times.dart';

class HomePage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
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
        title: Text('Cbloiro'),
      ),
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: (BuildContext contexto, int i) {
          final List<Time> tabela = controller.tabela;
          return ListTile(
            leading: Image.network(tabela[i].icone),
            title: Text(tabela[i].nome),
            trailing: Text(tabela[i].porctVitoria.toString()),
            onTap: () {
              Navigator.push(
                  contexto,
                  MaterialPageRoute(
                      builder: (_) => TimePage(
                            key: Key(tabela[i].nome),
                            time: tabela[i],
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
