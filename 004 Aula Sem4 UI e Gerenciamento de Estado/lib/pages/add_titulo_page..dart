import 'package:flutter/material.dart';
import '../models/times.dart';
import '../models/titulos.dart';

class AddTituloPage extends StatefulWidget {
  Time time;
  ValueChanged<Titulo> onSave;

  AddTituloPage({Key key, this.time, this.onSave}) : super(key: key);

  @override
  _AddTituloPageState createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage> {
  final _nome = TextEditingController();
  final _incremento = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Título'),
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
                  labelText: 'Título',
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Informe o nome do título !";
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
                  labelText: 'Ano',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Informe o ano !";
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
                    widget.onSave(Titulo(
                        //metodo que foi passado como referencia para adicionar
                        nome: _nome.text,
                        ano: _incremento.text));
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
