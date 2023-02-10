import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Square',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Square'),
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
  // the result which will be displayed on the screen
  double? _result;

  // Create a text controller  to retrieve the value
  final _textController = TextEditingController();

  // the function which calculates square
  void _calculate() {
    // textController.text is a string and we have to convert it to double
    final double? enteredNumber = double.tryParse(_textController.text);
    setState(() {
      _result = enteredNumber != null ? enteredNumber * enteredNumber : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Enter a number', style: const TextStyle(fontSize: 22)),
            TextField(
              controller: _textController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 30),
            Text(
              _result == null ? 'Error ⚠️' : _result!.toStringAsFixed(2),
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calculate,
        tooltip: 'Submit',
        child: const Icon(Icons.auto_awesome),
      ),
    );
  }
}
