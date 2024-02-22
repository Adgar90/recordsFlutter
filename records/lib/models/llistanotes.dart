import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "dart:convert";

class LlistaNotes extends ChangeNotifier {
  List<Nota> notes = [];

  Future<List<Nota>> fetchNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final String response = prefs.getString('notes').toString();
    if (response == 'null') {
      List<Nota> notesBuides = List.empty();
      return notesBuides;
    }
    final List result = json.decode(response);
    notes = result.map((e) => Nota.fromJson(e)).toList();
    return notes;
  }

  Future<void> setLlistaNotes(List notes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var notesString = [];
    for (var nota in notes) {
      notesString.add(nota.toMap());
    }
    await prefs.setString('notes', json.encode(notesString));
  }

  Future<void> afegeixNota(Nota nota) async {
    notes.add(nota);
    setLlistaNotes(notes);
    notifyListeners();
  }

  Future<void> treuNota(Nota nota) async {
    notes.remove(nota);
    notifyListeners();
  }

  Nota notaAt(int index) {
    return notes[index];
  }

  int count() {
    return notes.length;
  }
}

class Nota {
  //static info per variables
  //int? id;
  String titol = "";
  String text = "";

  Nota({
    //required this.id,
    required this.titol,
    required this.text,
  });

  Nota.fromJson(Map<String, dynamic> json) {
    //id = json['id'];
    titol = json['titol'];
    text = json['text'];
  }

  String toJson() {
    String data = "{";
    // if (id != null) {
    //   data += '"id":$id,';
    // }
    data += '"titol":"$titol","text":"$text"}';
    return data;
  }

  Map<String, dynamic> toMap() {
    return {'titol': titol, 'text': text};
  }

  static List<Nota> creaNotes() {
    List<Nota> list = List.empty(growable: true);
    for (int i = 0; i < 5; i++) {
      Nota nota =
          Nota(titol: 'titol $i', text: 'aquest es el text de la nota $i');
      list.add(nota);
    }
    return list;
  }
}
