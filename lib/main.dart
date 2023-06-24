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

  String? _convertedMeasure;
  String? _startMeasures;
  @override
  Widget build(BuildContext context) {
    final TextStyle inputStyle = TextStyle(
      fontSize: 24,
      color: Colors.blue[900],
    );
    final TextStyle labelStyle = TextStyle(
      fontSize: 24,
      color: Colors.grey[700],
    );
    final List<String> measures = [
      'meters',
      'kilometers',
      'grams',
      'kilograms',
      'feet',
      'miles',
      'pounds (lbs)',
      'ounces',
    ];
    return MaterialApp(
      title: 'Measure Converter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Measures Converter'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Spacer(),
              Text(
                'Value',
                style: labelStyle,
              ),
              Spacer(),
              TextField(
                style: inputStyle,
                decoration: InputDecoration(
                  hintText: "Please insert the measure to be converted",
                ),
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  if (rv != null) {
                    setState(() {
                      _numberFrom = rv;
                    });
                  }
                },
              ),
              // DropdownButton(
              //   isExpanded: true,
              //   style: inputStyle,
              //   items: measures.map((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(
              //         value,
              //         style: inputStyle,
              //       ),
              //     );
              //   }).toList(),
              //   onChanged: (value) {
              //     setState(() {
              //       _convertedMeasure = value;
              //     });
              //   },
              //   value: _convertedMeasure,
              // ),
              Spacer(),
              Spacer(
                flex: 2,
              ),

              Spacer(),
              Text(
                'From',
                style: labelStyle,
              ),
              DropdownButton(
                isExpanded: true,
                items: measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _startMeasures = value;
                  });
                },
                value: _startMeasures,
              ),
              Spacer(),
              Spacer(),
              Text(
                'To',
                style: labelStyle,
              ),
              Spacer(),
              DropdownButton(
                isExpanded: true,
                style: inputStyle,
                items: measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: inputStyle,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _convertedMeasure = value;
                  });
                },
                value: _convertedMeasure,
              ),
              Spacer(),
              Spacer(),
              ElevatedButton(
                child: Text('Convert', style: inputStyle),
                onPressed: () => true,
              ),

              Text((_numberFrom == null) ? '' : _numberFrom.toString(),
                  style: labelStyle),
            ],
          ),
        ),
      ),
    );
  }
}
