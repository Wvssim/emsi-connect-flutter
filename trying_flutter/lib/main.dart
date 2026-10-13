import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'EMSI Flutter',
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
    home: const MyHomePage(),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title = 'EMSI Flutter'});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 5;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        // Une valeur de 1 revient à zéro plutôt que de devenir négative.
        if (_counter >= 2) {
          _counter -= 2;
        } else {
          _counter = 0;
        }
      });
    }
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      title: const Text('EMSI Flutter'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Hatim'),
          Text(
            '$_counter',
            key: const Key('counter'),
            style: const TextStyle(color: Colors.blue, fontSize: 40),
          ),
          Text(_counter == 0 ? 'Compteur à zéro' : 'Compteur positif'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _resetCounter,
            child: const Text('Réinitialiser'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: const Text('Incrémenter'),
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _decrementCounter,
      tooltip: 'Décrémenter',
      child: const Icon(Icons.remove),
    ),
  );
}
