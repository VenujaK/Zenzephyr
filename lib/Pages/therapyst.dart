import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:zenzephyr/widgets/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zenzephyr/widgets/custom_card.dart';
import 'package:zenzephyr/widgets/custom_card.dart';
import 'package:zenzephyr/SignIn/signin_screen.dart';


class therapyst extends StatefulWidget {
  static const routeName = "/therapyst";
  const therapyst({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<therapyst> {
  void _logout() {
    FirebaseAuth.instance.signOut().then((value) {
      print("Signed Out");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Therapyst',
        showLogoutButton: true,
        onLogoutPressed: _logout,
      ),
      body: Center(
        child: ListView(
          children: [
            CustomCard(
              imagePath: 'assets/zenzepyr_logo.png',
              title: 'Title 1',
              subtitle: 'Subtitle 1',
            ),
            CustomCard(
              imagePath: 'assets/zenzepyr_logo.png',
              title: 'Title 2',
              subtitle: 'Subtitle 2',
            ),
            // Add more CustomCard widgets with different content
          ],
        ),
      ),
    );
  }
}