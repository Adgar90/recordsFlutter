import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:records/models/llistanotes.dart';

class AfegirNotes extends StatelessWidget {
  AfegirNotes({super.key});
  TextEditingController titolController = TextEditingController();
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Afegir notes'),
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
                  border: OutlineInputBorder(),
                  labelText: 'Títol',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                  labelText: 'Contingut',
                ),
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
                      model.setLlistaNotes([
                        Nota(
                            titol: titolController.text,
                            text: textController.text)
                      ]);
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
