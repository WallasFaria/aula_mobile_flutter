import 'package:cloud_firestore/cloud_firestore.dart';

class Tarefa {
  DocumentReference reference;
  String titulo;
  bool feita;

  Tarefa({this.reference, this.titulo, this.feita = false});

  Tarefa.fromFirebae(DocumentReference docReference, data) {
    reference = docReference;
    titulo = data['titulo'];
    feita = data['feita'] ?? false;
  }

  toMap() => {'titulo': titulo, 'feita': feita};
}
