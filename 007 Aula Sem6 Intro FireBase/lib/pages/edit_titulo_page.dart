import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../repositories/times_repository.dart';
import '../models/titulos.dart';

class EditTituloPage extends StatefulWidget {
  //criei stw
  Titulo titulo; //add titulo
  EditTituloPage({Key key, this.titulo})
      : super(key: key); //add titulo no construtor

  @override
  _EditTituloPageState createState() => _EditTituloPageState();
}

class _EditTituloPageState extends State<EditTituloPage> {
  final _nome = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //Precisamos recuperar da widget os valores que queremos editar
  @override
  void initState() {
    super.initState();
    _ano.text = widget.titulo.ano;
    _nome.text = widget.titulo.nome;
    //Criamos os campos com o nome/ano que vieram da widget
  }

  editar() {
    Provider.of<TimesRepository>(context, listen: false).editTitulo(
      titulo: widget.titulo,
      nome: _nome.text,
      ano: _ano.text,
    );

    Get.back();

    Get.snackbar("Sucesso", "Tiutlo editado !",
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Título'),
        backgroundColor: Colors.grey[500],
        actions: [IconButton(onPressed: editar, icon: Icon(Icons.check))],
      ),
      body: Form(
        key: _formKey,
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
          ],
        ),
      ),
    );
  }
}
