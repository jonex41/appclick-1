import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String uid;
  final String name;
  const ChatScreen(this.uid, this.name, {super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = TextEditingController();
  bool showSendButton = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.text.trim().isNotEmpty) {
        showSendButton = true;
        setState(() {});
      } else {
        showSendButton = false;
        setState(() {});
      }
    });
  }

  void sendTOFirebase(String message) {
    final user = FirebaseAuth.instance.currentUser;

    var map = {
      "message": message,
      "senderId": user?.uid ?? "none",
      "createdAt": FieldValue.serverTimestamp(),
      "receiveId": widget.uid,
    };
    // sending your message to Users ---- UserId ------ RecieverUid - Message
    FirebaseFirestore.instance
        .collection("Users")
        .doc(user?.uid ?? "none")
        .collection(widget.uid)
        .add(map)
        .then((value) {
          controller.text = "";
        });
    //sending your message to reciever Users ---- RecieverUid ------ UserId - Message
    FirebaseFirestore.instance
        .collection("Users")
        .doc(widget.uid)
        .collection(user?.uid ?? "none")
        .add(map)
        .then((value) {
          controller.text = "";
        });
  }

  @override
  Widget build(BuildContext context) {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? "none";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.name, style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Users")
                    .doc(userId)
                    .collection(widget.uid)
                    .orderBy('createdAt', descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return const Center(child: CircularProgressIndicator());
                  // }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No messages'));
                  }

                  final messages = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final data =
                          messages[index].data() as Map<String, dynamic>;

                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Align(
                          alignment: data['senderId'] == userId
                              ? Alignment.bottomRight
                              : Alignment.bottomLeft,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Colors.black87,
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      data['message'] ?? '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '06:10',

                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "Enter a message here...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),

                if (showSendButton)
                  Expanded(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),

                      child: GestureDetector(
                        onTap: () {
                          sendTOFirebase(controller.text);
                        },
                        child: Icon(Icons.send, color: Colors.white),
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
