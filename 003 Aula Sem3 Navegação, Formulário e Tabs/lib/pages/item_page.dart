import 'package:flutter/material.dart';
import 'package:fluttuando/models/items.dart';

class ItemPage extends StatefulWidget {
  Item item;
  ItemPage({Key key, this.item}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.item.cor,
          title: Text(widget.item.nome),
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
            Scaffold()
          ],
        ),
      ),
    );
  }
}
