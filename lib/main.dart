import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    ));

//Set State

class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  //Buld Calcultor Functionalities
  String Output = "0";
  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  PressedButton(String val) {
    print(val);

    //Interactive conditions
    if (val == "C") {
      _out = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (val == "+" || val == "-" || val == "*" || val == "/") {
      num1 = double.parse(Output);
      operand = val;
      _out = "0";
      Output = Output + val;
    } else if (val == ".") {
      if (_out.contains(".")) {
        return;
      } else {
        _out = _out + val;
      }
    }
  }

  //  Button Widget
  Widget CalBtn(String Btnval) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey.shade300,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500,
                offset: Offset(2.0, 2.0),
                blurRadius: 8.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-2.0, -2.0),
                blurRadius: 8.0,
                spreadRadius: 1.0),
          ]),
      child: MaterialButton(
        padding: EdgeInsets.all(30.0),
        child: Text(
          Btnval,
          style: TextStyle(fontSize: 22.0),
        ),
        onPressed: () => PressedButton(Btnval),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
                child: Text(
                  Output,
                  style: TextStyle(fontSize: 60.0),
                ),
              ),
              Expanded(
                child: Divider(),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      // Custom Buttons
                      CalBtn("."),
                      CalBtn("C"),
                      CalBtn("<-"),
                      CalBtn("*"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      // Custom Buttons
                      CalBtn("7"),
                      CalBtn("8"),
                      CalBtn("9"),
                      CalBtn("/"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      // Custom Buttons
                      CalBtn("4"),
                      CalBtn("5"),
                      CalBtn("6"),
                      CalBtn("+"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      // Custom Buttons
                      CalBtn("0"),
                      CalBtn("="),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
