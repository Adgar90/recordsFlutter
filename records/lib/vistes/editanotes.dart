import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:records/models/llistanotes.dart';

// ignore: must_be_immutable
class EditaNotes extends StatelessWidget {
  EditaNotes({super.key, required this.nota, required this.index});
  TextEditingController titolController = TextEditingController();
  TextEditingController textController = TextEditingController();
  final Nota nota;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Edita nota'),
      ),
      body: Consumer<LlistaNotes>(builder: (context, model, _) {
        titolController.text = nota.titol;
        textController.text = nota.text;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: titolController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Títol',
                  filled: true,
                  fillColor: Colors.white38,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                    labelText: 'Text',
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
                      model.editaNota(
                          Nota(
                              titol: titolController.text,
                              text: textController.text),
                          index);
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
