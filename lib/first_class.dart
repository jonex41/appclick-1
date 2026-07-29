
import 'package:flutter/material.dart';
class FirstClass extends StatelessWidget {
  var list = [
    {"name": "Mr Sunday", "lastMessage": "i am fixing the issue"},

    {"name": "Mr Moses", "lastMessage": "There is still an issue"},

    {"name": "Mr John", "lastMessage": "I am going to work"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("AppClick", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),

                child: Text("John", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Sunday", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Moses", style: TextStyle(color: Colors.white)),
              ),
            ),

            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                print("i have been clicked");
              },
              child: Text('Click me'),
            ),

            ListView(
              shrinkWrap: true,
              children: [
                ...list
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  radius: 50, // Diameter is 100
                                  child: ClipOval(
                                    child: Image.network(
                                      "https://fastly.picsum.photos/id/211/600/400.jpg?hmac=QmcGtwDXZxgXdlSSAQqvIXZqhMq2yuDX75hzcDGeUCk",
                                      width:
                                          40, // Matches the full avatar diameter
                                      height: 40,
                                      fit: BoxFit
                                          .cover, // Crops the image without distorting its ratio
                                    ),
                                  ),
                                ),

                                // Container(
                                //   height: 100,
                                //   width: 100,

                                //   decoration: BoxDecoration(
                                //     color: Colors.black,
                                //     shape: BoxShape.circle,

                                //     border: Border.all(
                                //       width: 2,
                                //       color: Colors.amber,
                                //     ),
                                //   ),

                                //   child: Image.network(
                                //     "https://fastly.picsum.photos/id/211/600/400.jpg?hmac=QmcGtwDXZxgXdlSSAQqvIXZqhMq2yuDX75hzcDGeUCk",
                                //     fit: BoxFit.contain,
                                //     width: 50,
                                //     height: 50,
                                //   ),
                                // ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 7,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.brown,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          e['name'] ?? "No Name",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          e['lastMessage'] ?? "No Messages",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Widget
//Text()- allow you to display a text on the screen
//ImageView()- allow to display an image
//Container()- it allow you to style your widgets
//Column()- it allow you to place widget vertically
//Row()- it allows you to place widgets horizontally
//Button- it gives you access to onpress
//Scaffold()- it allows you to syle your screen and gives you access to AppBar, bottomnavigation, backgroundcolor

// name = agudajohn5
// 	email = aguda.omotayo@rydepro.com