import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController controller = TextEditingController();
  List list = [
    {"value": "I am going to the market", "isChecked": false},
    {"value": "i am going to school", "isChecked": false},
    {"value": "i am going home", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        toolbarHeight: 80,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    color: Colors.white,
                    child: TextField(
                      controller: controller,
                      style: TextStyle(color: Colors.black, fontSize: 20),

                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.lightGreenAccent,
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.lightGreenAccent,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        list.add({
                          "value": controller.text,
                          "isChecked": false,
                        });
                         controller.text = '';
                        setState(() {});
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.limeAccent,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Center(child: Icon(Icons.add, size: 40)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                elevation: 1,
                child: ListTile(
                  leading: Checkbox(
                    value: list[index]['isChecked'],
                    onChanged: (value) {
                      list[index]['isChecked'] = !list[index]['isChecked'];
                      setState(() {});
                    },
                  ),
                  title: Text(
                    list[index]['value'],
                    style: TextStyle(
                      decoration: list[index]['isChecked']
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  tileColor: Colors.white,
                ),
              ),
              SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
