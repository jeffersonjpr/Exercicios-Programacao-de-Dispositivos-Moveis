import 'package:flutter/material.dart';
import '../models/items.dart';
import 'package:fluttuando/models/passive.dart';
import '../models/passive.dart';
import 'add_passive_page.dart';

class ItemPage extends StatefulWidget {
  Item item;
  ItemPage({Key key, this.item}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  passivepage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddPassivePage(
            item: widget.item,
            onSave:
                this.addPassive), //onSave é a referencia do metodo addPassive
      ),
    );
  }

  addPassive(Passive pasive) {
    //metodo que salva a passiva
    setState(() {
      widget.item.pasives.add(pasive);
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
          backgroundColor: widget.item.cor,
          title: Text(widget.item.nome),
          actions: [IconButton(icon: Icon(Icons.add), onPressed: passivepage)],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_line_chart),
                text: "Estatísticas",
              ),
              Tab(
                icon: Icon(Icons.stars_sharp),
                text: "Passiva",
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
                        widget.item.icone,
                        height: 300,
                      ),
                    )),
                Text(
                  widget.item.nome,
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
            Passivas()
          ],
        ),
      ),
    );
  }

  Widget Passivas() {
    final quantidade = widget.item.pasives.length;

    return quantidade == 0
        ? Container(
            child: Center(
              child: Text('Nenhuma Passiva.'),
            ),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.emoji_emotions),
                title: Text(widget.item.pasives[index].nome),
                trailing: Text(widget.item.pasives[index].incremento),
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: quantidade);
  }
}
