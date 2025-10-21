//Umesh Dhakal
//MSCS533
//Assignmnet 1: Construct Your First Flutter App using Dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ConverterApp());
}

class ConverterApp extends StatelessWidget {
  const ConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title in the App when App open
      title: 'Measurement Converter',
      debugShowCheckedModeBanner: false,
      //background color for title
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ConverterHomePage(),
    );
  }
}

class ConverterHomePage extends StatefulWidget {
  const ConverterHomePage({super.key});

  @override
  State<ConverterHomePage> createState() => _ConverterHomePageState();
}

class _ConverterHomePageState extends State<ConverterHomePage> {
  //  Controller for reading input from the user
  final TextEditingController _controller = TextEditingController();

  // dropdown values and result text
  String From = 'Miles';
  String To = 'Kilometers';
  String Result = '';

  //  Unit for conversion
  final List<String> _units = [
    'Miles',
    'Kilometers',
    'Kilograms',
    'Pounds',
  ];

  //   switch cases for conversion
  void _convert() {
    double? input = double.tryParse(_controller.text);
    if (input == null) {
      setState(() => Result = 'Please enter a valid number');
      return;
    }

    double output;

    switch ('$From to $To') {
      case 'Miles to Kilometers':
        output = input * 1.609;
        break;
      case 'Kilometers to Miles':
        output = input / 1.609;
        break;
      case 'Kilograms to Pounds':
        output = input * 2.205;
        break;
      case 'Pounds to Kilograms':
        output = input / 2.205;
        break;
      default:
        setState(() {
          Result = 'Invalid conversion selection';
        });
        return;
    }

    setState(() {
      Result =
      '${input.toStringAsFixed(2)} $From are ${output.toStringAsFixed(3)} $To';
    });
  }

  @override
  Widget build(BuildContext context) {
    //  main screen layout with AppBar and body
    return Scaffold(
      appBar: AppBar(
        title: const Text('Measurement Converter'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        // Column widget for arrangeing all components vertically
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Value', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Enter a number that you wanna convert',
              ),
            ),
            const SizedBox(height: 20),
            const Text('From', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: From,
              isExpanded: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: _units
                  .map((unit) => DropdownMenuItem(
                value: unit,
                child: Text(unit),
              ))
                  .toList(),
              onChanged: (value) => setState(() => From = value!),
            ),
            const SizedBox(height: 20),
            const Text('To', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: To,
              isExpanded: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: _units
                  .map((unit) => DropdownMenuItem(
                value: unit,
                child: Text(unit),
              ))
                  .toList(),
              onChanged: (value) => setState(() => To = value!),
            ),
            const SizedBox(height: 25),
            Center(
              child: ElevatedButton(
                onPressed: _convert,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Convert',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Text(
                Result,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


