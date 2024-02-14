import 'package:flutter/material.dart';
import 'package:records/vistes/afegirnotes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> texts = ['Text']; //té un text inicial
  int comptador = 0;

  void afegeixText(String text) {
    setState(() {
      //canvia el text afegint un
      texts.add(text);
    });
    comptador++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0), //ho centro una mica
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  //crea llista
                  //per veure la llista
                  itemCount: texts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      //pinta en cada fila de la llista
                      leading: Icon(Icons.shopping_cart), //Afegeixo icona
                      title: Text(texts[index]),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AfegirNotes()))
                          },
                      child: const Icon(Icons.add))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
