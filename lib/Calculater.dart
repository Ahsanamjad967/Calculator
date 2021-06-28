import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

var result = "";

class _HomeState extends State<Home> {
  @override
  clear() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  Widget btn(var textt) {
    return TextButton(
        onPressed: () {
          setState(() {
            result += textt;
          });
        },
        child: Text(
          textt,
          style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w100,
              color: Colors.grey[350]),
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Calculator")),
        backgroundColor: Colors.red[600],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            child: Text(result,
                style: TextStyle(fontSize: 80, color: Colors.grey)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              btn("7"),
              btn("8"),
              btn("9"),
              TextButton(
                  onPressed: () {
                    output();
                  },
                  child: Text("=",
                      style: TextStyle(fontSize: 38, color: Colors.blue)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              btn("4"),
              btn("5"),
              btn("6"),
              TextButton(
                  onPressed: () {
                    clear();
                  },
                  child: (Text("clear",
                      style: TextStyle(fontSize: 26, color: Colors.red))))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [btn("1"), btn("2"), btn("3"), btn("*")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              btn("0"),
              btn("+"),
              btn("-"),
              btn("/"),
            ],
          ),
        ],
      ),
    );
  }
}
