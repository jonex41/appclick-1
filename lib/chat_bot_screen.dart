import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {


  @override
  void initState() {
    super.initState();
   
  }

List<String> list = [];
List<Map<String, String>> listMap= [
  {
    "name":"Aguda John"
  },
   {
    "name":"Joennen KKppp"
  },
];

Future<List<Map<String, dynamic>>> fetchUsers() async {
  final snapshot =
      await FirebaseFirestore.instance.collection('Users').get();

  return snapshot.docs.map((doc) {
    return {
      'id': doc.id,
      ...doc.data(),
    };
  }).toList();
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Chat App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),

        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
  future: fetchUsers(),
  builder: (context, snapshot) {
    // Loading
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // Error
    if (snapshot.hasError) {
      return Center(
        child: Text('Error: ${snapshot.error}'),
      );
    }

    // No data
    if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Center(
        child: Text('No users found'),
      );
    }

    final users = snapshot.data!;

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];

        return ListTile(
          title: Text(user['name'] ?? ''),
          subtitle: Text(user['email'] ?? ''),
        );
      },
    );
  },
)
    );
  }
}
