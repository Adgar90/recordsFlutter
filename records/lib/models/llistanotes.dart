import "package:flutter/material.dart";

class LlistaNotes extends ChangeNotifier {
  final List<Nota> _notes = Nota.creaNotes();

  void afegeix(Nota nota) {
    _notes.add(nota);
    notifyListeners();
  }

  void treu(Nota nota) {
    _notes.remove(nota);
    notifyListeners();
  }

  Nota notaAt(int index) {
    return _notes[index];
  }
}

class Nota {
  //static info per variables
  int? id;
  String titol = "";
  String text = "";

  Nota({
    required this.id,
    required this.titol,
    required this.text,
  });

  Nota.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titol = json['titol'];
    text = json['text'];
  }

  String toJson() {
    String data = "{";
    if (id != null) {
      data += '"id": $id,';
    }
    data += '"titol":"$titol", "text": "$text"}';
    return data;
  }

  static List<Nota> creaNotes() {
    List<Nota> list = List.empty(growable: true);
    for (int i = 0; i < 5; i++) {
      Nota nota = Nota(
          id: i, titol: 'titol $i', text: 'aquest es el text de la nota $i');
      list.add(nota);
    }
    return list;
  }
}
