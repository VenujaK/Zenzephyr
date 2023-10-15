import 'package:flutter/material.dart';
import 'package:zenzephyr/Utils/colors.dart';
import 'package:zenzephyr/widgets/appbar.dart';
import 'package:zenzephyr/Pages/therapyst.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zenzephyr/SignIn/signup_screen.dart';
import 'package:zenzephyr/SignIn/reset_password.dart';
import 'package:zenzephyr/widgets/reusable_widget.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = "/signin";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  void _signIn() {
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

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => therapyst()),
          );
        })
        .catchError((error) {
          String errorMessage = "An error occurred while signing in. Please try again later.";

          if (error is FirebaseAuthException) {
            switch (error.code) {
              case 'user-not-found':
                errorMessage = "User not found. Please check your credentials.";
                break;
              case 'wrong-password':
                errorMessage = "Invalid password. Please try again.";
                break;
              default:
                errorMessage = error.message ?? errorMessage;
                break;
            }
          }

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("An error occurred while signing in. Please try again"),
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Login', showLogoutButton: false),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.asset(
              'assets/transparentbg (2).png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.1, 20, 0),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/zenzepyr_logo.png', 
                      width: 100, 
                      height: 100, 
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "Enter UserName", Icons.person_outline, false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "Enter Password", Icons.lock_outline, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 5,
                    ),
                    forgetPassword(context),
                    firebaseUIButton(context, "Sign In", _signIn),
                    signUpOption()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
