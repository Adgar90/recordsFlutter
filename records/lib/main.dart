import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
      ),
      home: const MyHomePage(title: 'Llista Hola/Adeu'),
    );
  }
}

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
                  ElevatedButton(
                    onPressed: () {
                      afegeixText('Hola');
                    },
                    child: const Text('Hola'),
                  ),
                  SizedBox(width: 10, height: 10), //Espai entre botons
                  ElevatedButton(
                    onPressed: () {
                      afegeixText('Adeu');
                    },
                    child: const Text('Adeu'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
