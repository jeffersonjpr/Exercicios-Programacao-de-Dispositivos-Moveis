import 'package:flutter/material.dart';
import '../models/times.dart';
import '../models/titulos.dart';
import 'add_titulo_page..dart';

class TimePage extends StatefulWidget {
  Time time;
  TimePage({Key key, this.time}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  passivepage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddTituloPage(
            time: widget.time,
            onSave:
                this.addtitulo), //onSave é a referencia do metodo addPassive
      ),
    );
  }

  addtitulo(Titulo titulo) {
    //metodo que salva a passiva
    setState(() {
      widget.time.titulos.add(titulo);
    });

    Navigator.pop(context);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Salvo com sucesso")));
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        widget.time.icone,
                        height: 300,
                      ),
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
    final quantidade = widget.time.titulos.length;

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
                title: Text(widget.time.titulos[index].nome),
                trailing: Text(widget.time.titulos[index].ano),
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: quantidade);
  }
}
