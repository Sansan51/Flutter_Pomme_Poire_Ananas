import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomme, poire et ananas',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<int> _itemList = [];

  bool isPrime(int number) {
    if (number <= 1) return false;
    if (number <= 3) return true;
    if (number % 2 == 0 || number % 3 == 0) return false;
    int i = 5;
    while (i * i <= number) {
      if (number % i == 0 || number % (i + 2) == 0) return false;
      i += 6;
    }
    return true;
  }

  Widget getItemImage(int value) {
    if (isPrime(value)) {
      return Image.asset(
        'images/ananas.png',
        width: 24,
        height: 24,
      );
    } else if (value % 2 == 0) {
      return Image.asset(
        'images/poire.png',
        width: 24,
        height: 24,
      );
    } else {
      return Image.asset(
        'images/pomme.png',
        width: 24,
        height: 24,
      );
    }
  }

  String getItemType(int value) {
    if (isPrime(value)) {
      return 'Nombre premier';
    } else if (value % 2 == 0) {
      return 'Pair';
    } else {
      return 'Impair';
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _itemList.add(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    final String counterType = getItemType(_counter);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _counter.toString(),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              counterType,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _itemList.length,
        itemBuilder: (BuildContext context, int index) {
          final int value = _itemList[index];
          final bool isEven = value % 2 == 0;
          final Color backgroundColor = isEven ? Colors.cyan : Colors.indigo;

          return ListTile(
            tileColor: backgroundColor,
            title: Row(
              children: [
                getItemImage(value),
                const SizedBox(width: 8),
                Text(
                  value.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
