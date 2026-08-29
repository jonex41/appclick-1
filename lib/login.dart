import 'package:first_app/dashboard.dart';
import 'package:first_app/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<bool> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
          print('Invalid email or password.');
          break;

        case 'user-not-found':
          print('No account found with this email.');
          break;

        case 'wrong-password':
          print('Incorrect password.');
          break;

        case 'invalid-email':
          print('Invalid email address.');
          break;

        case 'user-disabled':
          print('This account has been disabled.');
          break;

        default:
          print('Login failed: ${e.message}');
      }

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
              SizedBox(height: 130),
              Align(
                alignment: Alignment.center,

                child: Icon(
                  Icons.person_2_outlined,
                  size: 100,
                  color: Colors.black38,
                ),
              ),
              Text("Login", style: TextStyle(fontSize: 40)),

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
              SizedBox(height: 50),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text("Go to Register"),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    // Navigator.replace(context, oldRoute: oldRoute, newRoute: newRoute)

                    bool isLogin = await login(
                      emailController.text,
                      passwordController.text,
                    );
                    if (isLogin) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Dashboard(),
                        ),
                      );
                    } else {
                      print("Something went wrong");
                    }
                  },
                  child: Text(
                    "Go to Dashboard",
                    style: TextStyle(fontSize: 30),
                  ),
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