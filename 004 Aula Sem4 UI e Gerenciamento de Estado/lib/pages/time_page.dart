import 'package:cbloiro/repositories/times_repository.dart';
import 'package:cbloiro/widgets/brasao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../models/times.dart';
import 'add_titulo_page..dart';
import 'edit_titulo_page.dart';

class TimePage extends StatefulWidget {
  Time time;
  TimePage({Key key, this.time}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  passivepage() {
    Get.to(() => AddTituloPage(time: widget.time));

    /* Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddTituloPage(time: widget.time),
      ),
    ); */
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.time.nome),
          actions: [IconButton(icon: Icon(Icons.add), onPressed: passivepage)],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.bar_chart_outlined),
                text: "Estatísticas",
              ),
              Tab(
                icon: Icon(Icons.star_border),
                text: "Títulos",
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(24),
                    child: Brasao(
                      image: widget.time.icone,
                      width: 250.0,
                    )),
                Text(
                  widget.time.nome,
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "Títulos: " + widget.time.titulos.length.toString(),
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            Titulos()
          ],
        ),
      ),
    );
  }

  Widget Titulos() {
    final time = Provider.of<TimesRepository>(
            context) //instancia do provider litening true pq queremos rebuildar
        //assim ele consome o estado dinamico timesrepository
        .times
        .firstWhere((t) => t.nome == widget.time.nome);
    final quantidade = time.titulos.length;
    return quantidade == 0
        ? Container(
            child: Center(
              child: Text('Nenhum Título.'),
            ),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.sports_esports_rounded),
                title: Text(time.titulos[index].nome),
                trailing: Text(time.titulos[index].ano),
                onTap: () {
                  Get.to(
                    EditTituloPage(titulo: time.titulos[index]),
                    fullscreenDialog: true,
                  );
                },
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: quantidade);
  }
}
