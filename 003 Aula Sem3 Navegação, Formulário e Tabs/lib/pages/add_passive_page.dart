import 'package:flutter/material.dart';
import '../models/items.dart';
import '../models/passive.dart';
import './add_passive_page.dart';

class AddPassivePage extends StatefulWidget {
  Item item;
  ValueChanged<Passive> onSave;

  AddPassivePage({Key key, this.item, this.onSave}) : super(key: key);

  @override
  _AddPassivePageState createState() => _AddPassivePageState();
}

class _AddPassivePageState extends State<AddPassivePage> {
  final _nome = TextEditingController();
  final _incremento = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar passiva'),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: TextFormField(
                controller: _nome,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome',
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Informe o nome !";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: TextFormField(
                controller: _incremento,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Incremento',
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Informe o incremento !";
                  }
                  return null;
                },
              ),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(24),
              child: ElevatedButton(
                //botão de salvar as passivas
                onPressed: () {
                  //oque acontece quando o botão salvar é clicado
                  if (_formkey.currentState.validate()) {
                    //veirifca se o formlário esta preenchido (validado)
                    widget.onSave(Passive(
                        //metodo que foi passado como referencia para adicionar
                        nome: _nome.text,
                        incremento: _incremento.text));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check), //icone de check,
                    Padding(
                      padding: EdgeInsets.all(16.0), // p/ deixar o botão maior
                      child: Text(
                        'Salvar',
                        style: TextStyle(
                            fontSize:
                                20.0), //aumenta o tamanho do botão (tamanho do texto)
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
