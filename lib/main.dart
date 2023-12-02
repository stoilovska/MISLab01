import 'package:flutter/material.dart';

// Teodora Stoilovska 201076

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textField = "";
  int counter = 5;
  List<String> subjects = [
    'Voved vo Nauka na Podatocite',
    'Mobilni Informaciski Sistemi',
    'Programiraje na Video Igri',
    'Timski Proekt',
    'Pravo na Drushtva'
  ]; // List of subjects

  void addSubject(String item) {
    setState(() {
      subjects.add(item);
    });
  }

  void deleteSubject(int index) {
    setState(() {
      subjects.removeAt(index);
    });
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '201076',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[50],
      ),
      backgroundColor: Colors.pink[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Vkupno imate $counter kursevi.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Lista od kuresevi koi gi imate:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(subjects[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteSubject(index);
                      decrementCounter();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Functionality to add a new item
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Dodadi kurs'),
                content: TextField(
                  onChanged: (value) {
                    textField = value;
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Otkazi'),
                  ),
                  TextButton(
                    onPressed: () {
                      addSubject(textField);
                      incrementCounter();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Dodadi'),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Dodadi kurs',
        child: const Icon(Icons.add),
      ),
    );
  }
}
