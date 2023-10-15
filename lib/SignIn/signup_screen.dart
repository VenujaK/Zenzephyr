import 'package:flutter/material.dart';
import 'package:zenzephyr/Utils/colors.dart';
import 'package:zenzephyr/widgets/appbar.dart';
import 'package:zenzephyr/Pages/therapyst.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zenzephyr/widgets/reusable_widget.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/signup";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

 void _signUp() async {
  String email = _emailTextController.text.trim();
  String password = _passwordTextController.text.trim();

  if (email.isEmpty || password.isEmpty) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Please enter both email and password."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return; // Exit the method early if credentials are empty
  }

  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // If user creation is successful, navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => therapyst()),
    );
  } catch (e) {
    // Handle any errors that occur during the sign-up process
    String errorMessage = "An error occurred while signing up. Please try again later.";

    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'invalid-email':
          errorMessage = "The provided email address is badly formatted.";
          break;
        case 'email-already-in-use':
          errorMessage = "The email address is already in use by another account.";
          break;
        case 'weak-password':
          errorMessage = "The password provided is too weak.";
          break;
        default:
          errorMessage = e.message ?? errorMessage;
          break;
      }
    }

    // Show error message to the user
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: 'Register', showLogoutButton: false),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/transparentbg (2).png"), // Set your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter UserName",
                  Icons.person_outline,
                  false,
                  _userNameTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter Email Id",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outlined,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign Up", _signUp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
