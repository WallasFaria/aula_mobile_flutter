import 'dart:math';

class Tarefa {
  int id;
  String titulo;
  bool feita;
  Tarefa({this.titulo, this.feita = false}) {
    id = Random().nextInt(100000);
  }
}
