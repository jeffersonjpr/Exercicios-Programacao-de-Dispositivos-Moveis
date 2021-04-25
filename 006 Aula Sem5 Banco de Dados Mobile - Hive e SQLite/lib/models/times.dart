import 'titulos.dart';

class Time {
  int id;
  String nome;
  String icone;
  int porctVitoria;
  List<Titulo> titulos = [];
  Time({this.id, this.icone, this.nome, this.porctVitoria, this.titulos});
}
