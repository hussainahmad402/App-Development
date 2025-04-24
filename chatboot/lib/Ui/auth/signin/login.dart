import 'package:chatboot/Core/constant/color.dart';
import 'package:chatboot/Core/constant/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatboot/Ui/widgets/text_field.dart';
import 'package:chatboot/Ui/widgets/button.dart';
import 'package:chatboot/Ui/auth/signup/signup.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final mailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();


  @override
  void dispose() {
    mailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  Future<void> signinwithemail(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User signed in successfully: ${userCredential.user?.email}");

      // Navigate to HomeScreen after successful login
      Navigator.pushNamed(context, home);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = "No user found for that email. Please register first.";
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("User Not Found"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Signup()),
                  ); // Navigate to Signup screen
                },
                child: const Text("Register Now"),
              ),
            ],
          ),
        );
      } else if (e.code == 'wrong-password') {
        errorMessage = "Wrong password provided for that user.";
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } else {
        errorMessage = "Error: ${e.message}";
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print("An unexpected error occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Text("Login", style: TextStyle(fontSize: 40)),
            const Text(
              "Please Login to your account",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            textfild(
              labelText: "Enter Email",
              controller: mailcontroller,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 30),
            textfild(
              labelText: "Enter Password",
              controller: passwordcontroller,
              keyboardType: TextInputType.visiblePassword,
              isPassword: true, // Enable password functionality
            ),
            const SizedBox(height: 30),
            button(
              label: "SignIn",
              onTap: () async {
                await signinwithemail(
                  mailcontroller.text.trim(),
                  passwordcontroller.text.trim(),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 20, color: grey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: const Text(
                    "Signup",
                    style: TextStyle(fontSize: 20, color: primary),
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


