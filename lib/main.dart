import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Contador',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'App Contador'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int randomNumber = 0;
  var randomColor = [
    Colors.red,
    Colors.amber,
    Colors.white70,
    Colors.blue,
    Colors.amberAccent,
    Colors.redAccent
  ];
  Color selectedColor = Colors.orange;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _randomColor() {
    setState(() {
      Random random = new Random();
      randomNumber = random.nextInt(6);
      selectedColor = randomColor[randomNumber];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Número de pessoas contadas:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (_counter == 10)
              const Text(
                'Valor máximo Atingido, Não será possível adicionar mais!',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.red,
                ),
              )
          ],
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FloatingActionButton(
          onPressed: _counter != 0 ? _decrementCounter : null,
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: _counter != 10 ? _incrementCounter : null,
          tooltip: 'Increment',
          disabledElevation: 10,
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: _randomColor,
          tooltip: 'Random Color of Background',
          child: const Icon(Icons.autorenew),
        ),
      ]),
      backgroundColor: selectedColor,
    );
  }
}
