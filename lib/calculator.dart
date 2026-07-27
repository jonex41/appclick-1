import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String calculatorValue = '';

  void backSpace() {
    calculatorValue = calculatorValue.substring(0, calculatorValue.length - 1);

    setState(() {});

    //subtring()
    //home

    //home.substring(1)  = ome
    //home.substring(1, 2) = o
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.history),
        elevation: 4,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                calculatorValue,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 100),
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    calculatorValue = "";
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFDAB9),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "AC",
                        style: TextStyle(fontSize: 40, color: Colors.grey),
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "( )",
                      style: TextStyle(fontSize: 40, color: Colors.white70),
                    ),
                  ),
                ),

                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "%",
                      style: TextStyle(fontSize: 40, color: Colors.white70),
                    ),
                  ),
                ),

                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "d",
                      style: TextStyle(fontSize: 40, color: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),

                    onTap: () {
                      calculatorValue = "${calculatorValue}7";
                      setState(() {});
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "7",
                          style: TextStyle(fontSize: 40, color: Colors.white60),
                        ),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    calculatorValue = "${calculatorValue}8";
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "8",
                        style: TextStyle(fontSize: 40, color: Colors.white60),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    calculatorValue = "${calculatorValue}9";
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "9",
                        style: TextStyle(fontSize: 40, color: Colors.white60),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "X",
                      style: TextStyle(fontSize: 40, color: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    calculatorValue = "${calculatorValue}4";
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "4",
                        style: TextStyle(fontSize: 40, color: Colors.white60),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    calculatorValue = "${calculatorValue}5";
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "5",
                        style: TextStyle(fontSize: 40, color: Colors.white60),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    calculatorValue = "${calculatorValue}6";
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "6",
                        style: TextStyle(fontSize: 40, color: Colors.white60),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 40, color: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    calculatorValue = "${calculatorValue}1";
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(fontSize: 40, color: Colors.white60),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    calculatorValue = "${calculatorValue}2";
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(fontSize: 40, color: Colors.white60),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    calculatorValue = "${calculatorValue}3";
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "3",
                        style: TextStyle(fontSize: 40, color: Colors.white60),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 40, color: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    calculatorValue = "${calculatorValue}0";
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "0",
                        style: TextStyle(fontSize: 40, color: Colors.white60),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    calculatorValue = "${calculatorValue}.";
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          ".",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40,

                            fontWeight: FontWeight.bold,
                            color: Colors.white60,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    backSpace();
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(Icons.backspace, color: Colors.white60),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "=",
                      style: TextStyle(fontSize: 40, color: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


//create an app displaying your name, gender, 
//location, best color and nationality