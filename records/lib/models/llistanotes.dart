import "package:flutter/material.dart";

class LlistaNotes extends ChangeNotifier {}

class Nota {
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
}
