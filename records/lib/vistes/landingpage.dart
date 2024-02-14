import 'package:flutter/material.dart';
import 'package:records/vistes/afegirnotes.dart';
import 'package:records/models/llistanotes.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // void afegeixText(String text) {
  //   setState(() {
  //     canvia el text afegint un
  //     texts.add(text);
  //   });
  //   comptador++;
  // }

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
                child: Consumer<LlistaNotes>(builder: (context, value, child) {
                  return FutureBuilder(
                    future: value.fetchNotes(),
                    builder: ((context, snapshot) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(snapshot.data![index].titol),
                              subtitle: Text(snapshot.data![index].text),
                              trailing: Wrap(
                                spacing: 15,
                                children: <Widget>[
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 7.0,
                                          shadowColor: Colors.amber),
                                      onPressed: () => {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AfegirNotes()))
                                          },
                                      child: Icon(Icons.edit)),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 7.0,
                                          shadowColor: Colors.amber),
                                      onPressed: () =>
                                          {print(snapshot.data![index])},
                                      child: Icon(Icons.delete)),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  );
                }

                    // child: ListView.builder(
                    //   itemCount: 5,
                    //   itemBuilder: (context, index) {
                    //     return Card(
                    //       child: ListTile(
                    //         title: Text(notes.notaAt(index).titol),
                    //         subtitle: Text(notes.notaAt(index).text),
                    //         trailing: Wrap(
                    //           spacing: 15,
                    //           children: <Widget>[
                    //             ElevatedButton(
                    //                 style: ElevatedButton.styleFrom(
                    //                     elevation: 7.0, shadowColor: Colors.amber),
                    //                 onPressed: () => {
                    //                       Navigator.push(
                    //                           context,
                    //                           MaterialPageRoute(
                    //                               builder: (context) =>
                    //                                   AfegirNotes()))
                    //                     },
                    //                 child: Icon(Icons.edit)),
                    //             ElevatedButton(
                    //                 style: ElevatedButton.styleFrom(
                    //                     elevation: 7.0, shadowColor: Colors.amber),
                    //                 onPressed: () => notes.treuNota(notes[index]),
                    //                 child: Icon(Icons.delete)),
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
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
