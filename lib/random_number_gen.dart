import 'dart:math';

import 'package:flutter/material.dart';

class RandomNumberGenScreen extends StatefulWidget {
  const RandomNumberGenScreen({super.key});

  @override
  State<RandomNumberGenScreen> createState() => _RandomNumberGenScreenState();
}

class _RandomNumberGenScreenState extends State<RandomNumberGenScreen> {
  final TextEditingController minController = TextEditingController();
  final TextEditingController maxController = TextEditingController();
  int randomNumber = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    void getRandomNumber() {
      final random = Random();

      if (maxController.text.trim().isEmpty ||
          minController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please make sure to enter the min and max values'),
          ),
        );
        return;
      }

      int max = int.parse(maxController.text);
      int min = int.parse(minController.text);
      randomNumber = min + random.nextInt(max);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(10),
                      border: BoxBorder.all(color: Colors.white, width: 2),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Min number",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 45,
                          width: width / 3,
                          child: TextField(
                            controller: minController,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w700),
                            maxLength: 12,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              helperText: null,

                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical: 13,
                              ),
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            cursorHeight: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 30),

                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(10),
                      border: BoxBorder.all(color: Colors.white, width: 2),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Max number",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 45,
                          width: width / 3,
                          child: TextField(
                            controller: maxController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontWeight: FontWeight.w700),
                            maxLength: 12,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              helperText: null,

                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical: 13,
                              ),
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            cursorHeight: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
              Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: BoxBorder.all(color: Colors.white),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Final Result",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.ads_click_rounded, color: Colors.white),
                      ],
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "$randomNumber",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  getRandomNumber();
                  setState(() {});
                },
                child: Text("Generate Number"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
