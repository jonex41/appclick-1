import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/login.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<bool> signUp(String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user?.uid != null) {
        FirebaseFirestore.instance
            .collection("Users")
            .doc(credential.user?.uid)
            .set({
              "email": email,
              "name": nameController.text,
              "uid": credential.user?.uid,
            });
      }

      return true;
    } on FirebaseAuthException catch (e) {
      print('Signup error: ${e.code}');
      print(e.message);

      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
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
                " Full name",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF0E0E0E),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,

                decoration: InputDecoration(
                  hint: Text(
                    "Enter Full name",
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
                "Email Address",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF0E0E0E),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
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
                controller: passwordController,
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
                  onPressed: () async {
                    bool registerSuccess = await signUp(
                      emailController.text,
                      passwordController.text,
                    );
                    if (registerSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                    // Navigator.replace(context, oldRoute: oldRoute, newRoute: newRoute)
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => LoginPage()),
                    // );
                  },
                  child: Text("Register", style: TextStyle(fontSize: 30)),
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
