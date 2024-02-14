import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "dart:convert";

class LlistaNotes extends ChangeNotifier {
  final List<Nota> _notes = [];

  Future<List<Nota>> fetchNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final List result = json.decode(prefs.getString("notes").toString());
    if ('null' == result) {
      return List.empty();
    }
    return result.map((e) => Nota.fromJson(e)).toList();
  }

  Future<void> afegeixNota(Nota nota) async {
    _notes.add(nota);
    notifyListeners();
  }

  Future<void> treuNota(Nota nota) async {
    _notes.remove(nota);
    notifyListeners();
  }

  Future<Nota> notaAt(int index) async {
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
