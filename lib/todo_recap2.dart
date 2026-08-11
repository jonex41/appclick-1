import 'package:flutter/material.dart';

class TodoRecap2 extends StatefulWidget {
  const TodoRecap2({super.key});

  @override
  State<TodoRecap2> createState() => _TodoRecap2State();
}

class _TodoRecap2State extends State<TodoRecap2> {
  TextEditingController controller = TextEditingController();
  List list = [
    {"name": "Home", "isChecked": false},
    {"name": "School", "isChecked": true},
    {"name": "AppClick", "isChecked": false},
    {"name": "Cook", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // list.add(controller.text);
                  list.insert(0, {"name": controller.text, "isChecked": false});
                  //[1,2,3]
                  //insert(0, 0);
                  //[0,1,2,3]
                  //insert(0, -1);
                  //[-1, 0,1,2,3]

                  controller.text = "";
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  width: 30,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(Icons.add, size: 40),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Checkbox(
                value: list[index]["isChecked"],
                onChanged: (value) {
                  list[index]["isChecked"] = !list[index]["isChecked"];
                  setState(() {});
                },
              ),
              title: Text(
                list[index]["name"],
                style: TextStyle(
                  decoration: list[index]["isChecked"]
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  list.removeAt(index);
                  setState(() {});
                },
                child: Icon(Icons.delete),
              ),
            ),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Row(
            //       children: [
            //         Checkbox(value: true, onChanged: (value) {}),
            //         Text(list[index]),
            //       ],
            //     ),

            //     Icon(Icons.delete),
            //   ],
            // ),
          );
        },
      ),
    );
  }
}
