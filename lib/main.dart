import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFF000099)),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 0.0;
  double _weight = 0.0;
  int _bmi = 0;
  String _condition = 'Select Data';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: size.height * 0.40,
                width: double.infinity,
                decoration: new BoxDecoration(color: Color(0xFF000099)),
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'BMI',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 60.0),
                    ),
                    Text('Calculator',
                        style: TextStyle(color: Colors.white, fontSize: 40.0)),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          "$_bmi",
                          style: TextStyle(
                              color: Color(0xFFff0000),
                              fontWeight: FontWeight.bold,
                              fontSize: 50.0),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Condition : ",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                          children: <TextSpan>[
                            TextSpan(
                              text: "$_condition",
                              style: TextStyle(
                                  color: Color(0xFF1aff1a),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            )
                          ]),
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Choose Data',
                    style: TextStyle(
                        color: Color(0xFF00264d),
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Height : ",
                        style:
                            TextStyle(color: Color(0xFF403f3d), fontSize: 25.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_height cm",
                            style: TextStyle(
                                color: Color(0xFFe60000),
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: _height,
                    min: 0,
                    max: 250,
                    onChanged: (height) {
                      setState(() {
                        _height = height;
                      });
                    },
                    divisions: 250,
                    label: "$_height",
                    activeColor: Color(0xFF009999),
                    inactiveColor: Color(0xFFccccb3),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Weight : ",
                        style:
                            TextStyle(color: Color(0xFF403f3d), fontSize: 25.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_weight Kg",
                            style: TextStyle(
                                color: Color(0xFFe60000),
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: _weight,
                    min: 0,
                    max: 120,
                    onChanged: (weight) {
                      setState(() {
                        _weight = weight;
                      });
                    },
                    divisions: 120,
                    label: "$_weight",
                    activeColor: Color(0xFF009999),
                    inactiveColor: Color(0xFFccccb3),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width * 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _bmi =
                                (_weight / ((_height / 100) * (_height / 100)))
                                    .round()
                                    .toInt();
                            if (_bmi >= 18.5 && _bmi <= 24.9) {
                              _condition = "Normal";
                            } else if (_bmi >= 25 && _bmi <= 29.9) {
                              _condition = "Overweight";
                            } else if (_bmi >= 30.0) {
                              _condition = "Obacity";
                            } else {
                              _condition = "Underweight";
                            }
                          });
                        },
                        child: Text(
                          'Calculate',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        color: Color(0xFF005ce6),
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 15.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
