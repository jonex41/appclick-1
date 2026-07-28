import 'package:first_app/login.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 130),
              Align(
                alignment: Alignment.center,

                child: Icon(
                  Icons.person_2_outlined,
                  size: 100,
                  color: Colors.black38,
                ),
              ),
              Text("Register", style: TextStyle(fontSize: 40)),

              SizedBox(height: 100),
              Text(
                "Email Address",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF0E0E0E),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  hint: Text(
                    "Enter Email address",
                    style: TextStyle(color: Colors.black38),
                  ),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.black45),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF0E0E0E),
                ),
              ),

              SizedBox(height: 10),

              TextField(
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  hint: Text(
                    "Enter Password",
                    style: TextStyle(color: Colors.black38),
                  ),
                  suffixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.replace(context, oldRoute: oldRoute, newRoute: newRoute)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text("Go to Login", style: TextStyle(fontSize: 30)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class Widgets {}

// class TextView extends Widgets {
//   String text;
//   int myNumber;

//   TextView(this.text, {this.myNumber = 0});
// }


//display your name gender, nationality, your laptop name 