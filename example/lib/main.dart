import 'package:flutter/material.dart';

import 'package:country_picker/country_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Country Picker example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WidgetTest());
  }
}

class WidgetTest extends StatefulWidget {
  const WidgetTest({Key key}) : super(key: key);

  @override
  _WidgetTestState createState() => _WidgetTestState();
}

class _WidgetTestState extends State<WidgetTest> {

  String dialCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Code Picker'),
        elevation: 0.0,
      ),
      body: Center(
          child: TextButton(
            child: Text('Click Here: $dialCode'),
            onPressed: (){
              CountryPicker.showCountryPicker(context: context, title: 'Hello', willDisplayWidget: Icon(Icons.ac_unit),
                  onSelected: (code){
                setState(() {
                  dialCode = code.dialCode;
                });
              });
            },
          )
      ),
    );
  }
}
