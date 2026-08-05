import 'dart:math';

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController controller = TextEditingController();
  String display = "";

  void doOperator() {
    if (display.contains(")") && display.contains("(")) {
      // (5*5)/5 = 5
      var list = display.split(')'); //[(5*5, /5]
      print("334  $list");
      //split   [(5*5, /5]

      var result = list[0].substring(1); // 5*5

      if (result.contains("X")) {
        var list2 = result.split("X");
        print("14 $result");
        print("23 $list2");

       

        int value = int.parse(list2[0]) * int.parse(list2[1]);
        var firstResult = value;

        if (list[1].contains("÷")) {
          var lastValue = list[1].substring(1);

          display = '${firstResult / int.parse(lastValue)}';
        }

        //do multiplication
      }

      //substring(1)  5*5
      //contains *-/% do the needful = a
      //result a /5 = result = display

      //true && false = false;
      //true | false = true;
      //true && true = true;
      //false && false = false;
    } else {
      if (display.contains("+")) {
        //6+6
        var list = display.split("+"); //["6", "6"]

        int value = int.parse(list[0]) + int.parse(list[1]);
        display = '$value';

        //do plus
      } else if (display.contains("-")) {
        var list = display.split("-"); //["6", "6"]

        int value = int.parse(list[0]) - int.parse(list[1]);
        display = '$value';
        //do minus
      } else if (display.contains("X")) {
        var list = display.split("X");
        int value = int.parse(list[0]) * int.parse(list[1]);
        display = '$value';

        //do multiplication
      } else if (display.contains("÷")) {
        var list = display.split("÷");
        double value = int.parse(list[0]) / int.parse(list[1]);
        display = '$value';
        //do devision
      } else if (display.contains("%")) {
        var list = display.split("%");
        double value = (int.parse(list[0]) / 100) * int.parse(list[1]);
        display = '$value';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B0904),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B0904),
        leading: Icon(Icons.history, color: Colors.white60),
        actions: [Icon(Icons.more_vert, color: Colors.white60)],
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            cursorColor: Colors.white70,
            textAlign: TextAlign.end,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
            style: TextStyle(color: Colors.white, fontSize: 60),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  display = "";
                  controller.text = display;
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF8B4AE),
                  ),
                  child: Center(
                    child: Text(
                      "AC",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  // "display".contains("d"); // true
                  //"display".contains("o"); // false
                  if (display.contains("(")) {
                    display = '${display})';
                  } else {
                    display = '${display}(';
                  }
                  controller.text = display;
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(0xFF132734),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "( )",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  display = "${display}%";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Color(0xFF132734),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  display = "${display}÷";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,

                  decoration: BoxDecoration(
                    color: Color(0xFF132734),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "÷",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  display = "${display}7";
                  controller.text = display;
                },

                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4A2216),
                  ),
                  child: Center(
                    child: Text(
                      "7",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  display = "${display}8";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4A2216),
                  ),
                  child: Center(
                    child: Text(
                      "8",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  display = "${display}9";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4A2216),
                  ),
                  child: Center(
                    child: Text(
                      "9",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  display = "${display}X";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,

                  decoration: BoxDecoration(
                    color: Color(0xFF132734),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "X",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  display = "${display}4";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4A2216),
                  ),
                  child: Center(
                    child: Text(
                      "4",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  display = "${display}5";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4A2216),
                  ),
                  child: Center(
                    child: Text(
                      "5",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  display = "${display}6";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4A2216),
                  ),
                  child: Center(
                    child: Text(
                      "6",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  display = "${display}-";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,

                  decoration: BoxDecoration(
                    color: Color(0xFF132734),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "-",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  display = "${display}1";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4A2216),
                  ),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  display = "${display}2";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF702005),
                  ),
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  display = "${display}3";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4A2216),
                  ),
                  child: Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  display = "${display}+";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,

                  decoration: BoxDecoration(
                    color: Color(0xFF132734),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "+",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  display = "${display}0";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4A2216),
                  ),
                  child: Center(
                    child: Text(
                      "0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  display = "${display}.";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4A2216),
                  ),
                  child: Center(
                    child: Text(
                      ".",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  display = display.substring(0, display.length - 1);
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4A2216),
                  ),
                  child: Center(
                    child: Icon(Icons.backspace, color: Colors.white, size: 30),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  doOperator();
                  // display = "${display}=";
                  controller.text = display;
                },
                child: Container(
                  height: 70,
                  width: 70,

                  decoration: BoxDecoration(
                    color: Color(0xFF7DD3F7),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "=",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
