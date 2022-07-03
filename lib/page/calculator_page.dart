import 'package:flutter/material.dart';

class CalculatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();

}

class _CalculatorState extends State<Calculator> {
  // the controller for the text field associated with "height"
  final _heightController = TextEditingController();

  // the controller for the text field associated with "weight"
  final _weightController = TextEditingController();

  // ID for the Database // The BMI  // the message at the beginning
  int? id;
  double? _bmi;
  String _message = 'Please enter your height an weight';

  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    // Check if the inputs are valid
    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height);
      if (_bmi! < 18.5) {
        _message = "You are underweight";
      } else if (_bmi! < 25) {
        _message = 'You body is fine';
      } else if (_bmi! < 30) {
        _message = 'You are overweight';
      } else {
        _message = 'You are obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(50, 75, 205, 1)
        ),
       backgroundColor: Colors.tealAccent,
        body: Center(
          child: Container(
            width: 320,
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'Height (m)'),
                      controller: _heightController,
                    ),
                    TextField(
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Weight (kg)',
                      ),
                      controller: _weightController,
                    ),
                    ElevatedButton(
                      onPressed: _calculate,
                      child: Text('Calculate'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Text(
                        _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
                        style: TextStyle(fontSize: 50),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        _message,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }




}