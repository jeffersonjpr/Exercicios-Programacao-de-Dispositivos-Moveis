import 'package:flutter/material.dart';
import 'package:flutterapp1/pages/home_controller.dart';
import 'home_controller.dart';

class Homepage extends StatelessWidget {
  var controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Damage'),
      ),
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: (BuildContext contexto, int i) {
          final tabela = controller.tabela;
          return ListTile(
            leading: Image.network(tabela[i].icone),
            title: Text(tabela[i].nome),
            trailing: Text(tabela[i].dano.toString()),
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
