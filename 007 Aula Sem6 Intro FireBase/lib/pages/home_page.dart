import 'package:cbloiro/repositories/times_repository.dart';
import 'package:cbloiro/services/auth_services.dart';
import 'package:cbloiro/widgets/brasao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'time_page.dart';
import '../models/times.dart';
import '../controllers/theme_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  var controller = ThemeController.to; // temos a instacia do controller

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cbloiro'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: ListTile(
                  //ICONE DO DARKMODE/LIGHTMODE
                  leading: Obx(() => controller.isDark.value
                      ? Icon(Icons.brightness_7)
                      : Icon(Icons.brightness_2)),
                  title: Obx(() => controller.isDark.value
                      ? Text('Light Mode')
                      : Text('Dark Mode')),
                  onTap: () => controller.changeTheme(),
                ),
              ),
              PopupMenuItem(
                  child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sair'),
                onTap: () {
                  Navigator.pop(context);
                  AuthService.to.logout();
                },
              ))
            ], // função que retorna um array de aççoes
          )
        ],
      ),
      body: Consumer<TimesRepository>(builder: (context, repositorio, child) {
        //consumindo o timesrepository, deixando ele disponivel pro listview
        //use o consumer na widget que for utilizar, não deixa para usar dentro da widget, fica ineficiente igual
        return ListView.separated(
          itemCount: repositorio.times.length,
          itemBuilder: (BuildContext contexto, int i) {
            final List<Time> tabela = repositorio.times;
            return ListTile(
              leading: Brasao(
                  image: tabela[i].icone,
                  width: 40), //Primeira parte da ANIMAÇÃO,
              title: Text(tabela[i].nome),
              subtitle: Text(
                  "Titulos: ${tabela[i].titulos.length}"), //como tá usando o consumer ele já atualiza
              trailing: Text(tabela[i].porctVitoria.toString()),
              onTap: () {
                //forma muito mais compacta do Get
                Get.to(() => TimePage(
                      key: Key(tabela[i].nome),
                      time: tabela[i],
                    ));

                /* Jeito do MaterialApp 
                  Navigator.push(
                    contexto,
                    MaterialPageRoute(
                        builder: (_) => TimePage(
                              key: Key(tabela[i].nome),
                              time: tabela[i],
                            ))); */
              },
            );
          },
          separatorBuilder: (_, __) {
            return Divider();
          },
          padding: EdgeInsets.all(16),
        );
      }),
    );
  }
}
