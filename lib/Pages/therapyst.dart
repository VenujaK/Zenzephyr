import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:zenzephyr/widgets/appbar.dart';
import 'package:url_launcher/url_launcher.dart';
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
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
      appBar: CustomAppBar(title: 'Calm Me', showLogoutButton: false),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/transparentbg (2).png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  _launchURL('https://www.doc.lk/channel/18433?doctor=NIPUNA+RANAWEERA&hospital=0&specialization=29&date=&search=1');
                },
                child: CustomCard(
                  imagePath: 'assets/doctor.png',
                  title: 'Dr. NIPUNA RANAWEERA',
                  subtitle: 'Psychiatrist',
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchURL(
                      'https://www.doc.lk/channel/16561?id=5022&doctor=&hospital=0&specialization=29&date=');
                },
                child: CustomCard(
                  imagePath: 'assets/doctor (2).png',
                  title: 'Dr (Mrs.) SAYURI PERERA',
                  subtitle: 'Psychiatrist',
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchURL('https://www.doc.lk/channel/9372?id=5022&doctor=&hospital=0&specialization=29&date=');
                },
                child: CustomCard(
                  imagePath: 'assets/doctor (3).png',
                  title: 'Dr. IYANTHIKA MEDAGAMA',
                  subtitle: 'Psychiatrist',
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchURL('https://www.doc.lk/channel/16547?id=5022&doctor=&hospital=0&specialization=29&date=');
                },
                child: CustomCard(
                  imagePath: 'assets/councelor (1).png',
                  title: 'Dr. SENAKA B. JAYASUNDARA',
                  subtitle: 'Psychiatrist',
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchURL('https://www.doc.lk/channel/9372?id=5022&doctor=&hospital=0&specialization=29&date=');
                },
                child: CustomCard(
                  imagePath: 'assets/councelor (2).png',
                  title: 'Mrs. BHAGYA ABEYSINGHE',
                  subtitle: 'Counselor',
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchURL('https://www.doc.lk/channel/9372?id=5022&doctor=&hospital=0&specialization=29&date=');
                },
                child: CustomCard(
                  imagePath: 'assets/councelor (3).png',
                  title: 'Ms. SHESHMI DIVYANJALI ATHTHANAYAKE',
                  subtitle: 'Counselor',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
