import 'package:flutter/material.dart';

class TodoRecap extends StatefulWidget {
  const TodoRecap({super.key});

  @override
  State<TodoRecap> createState() => _TodoRecapState();
}

class _TodoRecapState extends State<TodoRecap> {
  TextEditingController controller = TextEditingController();
  List list = [
    {"name": "Home", "isCheck": true},

    {"name": "Hope", "isCheck": false},
    {"name": "Flop", "isCheck": true},

    {"name": "Rome", "isCheck": false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                height: 45,
                color: Colors.white,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    String value = controller.text;
                    list.add({"name": value, "isCheck": false});
                    controller.text = "";
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.limeAccent,
                    height: 40,
                    width: 40,
                    child: Icon(Icons.add, size: 30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: list[index]["isCheck"],
              onChanged: (value) {
                list[index]["isCheck"] = !list[index]["isCheck"];
                setState(() {});
              },
            ),
            title: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  list[index]["name"],

                  style: TextStyle(
                    decoration: list[index]["isCheck"]
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
              ),
            ),
            trailing: GestureDetector(
              onTap: () {
                list.removeAt(index);
                setState(() {});
              },
              child: Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
