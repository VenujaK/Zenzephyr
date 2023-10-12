import 'package:flutter/material.dart';
import 'package:zenzephyr/Utils/colors.dart';
import 'package:zenzephyr/widgets/appbar.dart';
import 'package:zenzephyr/Pages/therapyst.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zenzephyr/widgets/reusable_widget.dart';

class ResetPassword extends StatefulWidget {
  static const routeName = "/rspsword";
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextController = TextEditingController();
  
  void _resetPassword() async {
    try {
      // Send password reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailTextController.text);
      // If successful, navigate back
      Navigator.of(context).pop();
    } catch (e) {
      // Handle any errors that occur during the password reset process
      print("Error resetting password: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: 'Reset Password', showLogoutButton: false),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/transparentbg (2).png"),
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
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Reset Password", _resetPassword),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
