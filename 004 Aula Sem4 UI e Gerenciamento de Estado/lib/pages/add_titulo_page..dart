import 'package:cbloiro/repositories/times_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../models/times.dart';
import '../models/titulos.dart';

class AddTituloPage extends StatefulWidget {
  Time time;

  AddTituloPage({Key key, this.time}) : super(key: key);

  @override
  _AddTituloPageState createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage> {
  final _nome = TextEditingController();
  final _ano = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  save() {
    Provider.of<TimesRepository>(context, listen: false).addTitulo(
        //recupera os dados da widget superior
        time: widget.time,
        titulos: Titulo(nome: _nome.text, ano: _ano.text));
    //listen é false pq so estamos adicionando ao repositório e não renderizando

    /* Navigator.pop(context); metodo antigo, novo get abaixo*/
    Get.back();

    /* ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Salvo com sucesso")));  SnackBar antiga, novo get abaixo*/
    Get.snackbar("Sucesso", "Titulo cadastrado !",
        backgroundColor: Colors.blue[300], snackPosition: SnackPosition.BOTTOM);
  }

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
                controller: _ano,
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
                    save();
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
