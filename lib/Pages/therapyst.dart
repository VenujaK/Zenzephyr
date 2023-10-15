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
              imagePath: 'assets/doctor.png',
              title: 'Dr. NIPUNA RANAWEERA',
              subtitle: 'Psychiatrist',
            ),
            CustomCard(
              imagePath: 'assets/doctor (1).png',
              title: 'Prof. PABASARI GINIGE',
              subtitle: 'Psychiatrist',
            ),
            CustomCard(
              imagePath: 'assets/doctor (2).png',
              title: 'Dr (Mrs.) SAYURI PERERA',
              subtitle: 'Psychiatrist',
            ),
            CustomCard(
              imagePath: 'assets/doctor (3).png',
              title: 'Dr. IYANTHIKA MEDAGAMA',
              subtitle: 'Psychiatrist',
            ),
            CustomCard(
              imagePath: 'assets/doctor.png',
              title: 'Dr. NIPUNA RANAWEERA',
              subtitle: 'Psychiatrist',
            ),
            CustomCard(
              imagePath: 'assets/doctor (1).png',
              title: 'Prof. PABASARI GINIGE',
              subtitle: 'Psychiatrist',
            ),
            CustomCard(
              imagePath: 'assets/doctor (2).png',
              title: 'Dr (Mrs.) SAYURI PERERA',
              subtitle: 'Psychiatrist',
            ),
            CustomCard(
              imagePath: 'assets/doctor (3).png',
              title: 'Dr. IYANTHIKA MEDAGAMA',
              subtitle: 'Psychiatrist',
            ),
          ],
        ),
      ),
    );
  }
}