import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double _numberFrom = 0;

  @override
  void initState() {
    _numberFrom = 0;
    super.initState();
  }

  var fruits = ['Apple', 'Orange', 'Grapes', 'Guava'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measure Converter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Measures Converter'),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  if (rv != null) {
                    setState(() {
                      _numberFrom = rv;
                    });
                  }
                },
                // ignore: unnecessary_null_comparison
              ),
              Text((_numberFrom == null) ? '' : _numberFrom.toString())

              // ignore: unnecessary_null_comparison
            ],
          ),
        ),
      ),
    );
  }
}
