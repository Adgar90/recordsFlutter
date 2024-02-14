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
                child: ListView(
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        title: Text(texts[0]),
                        trailing: Wrap(
                          spacing: 15,
                          children: <Widget>[
                            ElevatedButton(
                                onPressed: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AfegirNotes()))
                                    },
                                child: Icon(Icons.edit)),
                            ElevatedButton(
                                onPressed: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AfegirNotes()))
                                    },
                                child: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AfegirNotes()))
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
