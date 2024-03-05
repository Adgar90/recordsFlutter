import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:records/models/llistanotes.dart';

// ignore: must_be_immutable
class AfegirNotes extends StatelessWidget {
  AfegirNotes({super.key});
  TextEditingController titolController = TextEditingController();
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Afegeix nota'),
      ),
      body: Consumer<LlistaNotes>(builder: (context, model, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: titolController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: "Títol",
                    filled: true,
                    fillColor: Colors.white38),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                    labelText: 'Contingut',
                    filled: true,
                    fillColor: Colors.white38),
                maxLines: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      model.afegeixNota(Nota(
                          titol: titolController.text,
                          text: textController.text));
                      Navigator.pop(context);
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
