import 'package:flutter/material.dart';

void main() => runApp(TemperatureConverterApp());

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature Converter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemperatureConverterScreen(),
    );
  }
}

class TemperatureConverterScreen extends StatefulWidget {
  @override
  _TemperatureConverterScreenState createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  TextEditingController _celsiusController = TextEditingController();
  TextEditingController _fahrenheitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Temperature Converter App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _celsiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Celsius',
                labelStyle: TextStyle(fontSize: 25,color: Colors.lightGreen,fontWeight: FontWeight.bold)
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _fahrenheitController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Fahrenheit',
                  labelStyle: TextStyle(fontSize: 25,color: Colors.redAccent,fontWeight: FontWeight.bold)
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Convert'),
              onPressed: _handleConversion,
            ),
          ],
        ),
      ),
    );
  }

  void _handleConversion() {
    double celsius = double.parse(_celsiusController.text);
    double fahrenheit = (celsius * 9 / 5) + 32;
    _fahrenheitController.text = fahrenheit.toStringAsFixed(2);
  }
}
