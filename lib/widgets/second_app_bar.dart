import 'package:flutter/material.dart';
import 'package:zenzephyr/Pages/home.dart';
import 'package:zenzephyr/Pages/calmme.dart';
import 'package:zenzephyr/Pages/survey.dart';
import 'package:zenzephyr/Utils/colors.dart';
import 'package:zenzephyr/Pages/contactUs.dart';
import 'package:zenzephyr/Pages/therapyst.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:zenzephyr/Pages/VoiceNoteScreen.dart';

class SecondAppBar extends StatefulWidget {
  @override
  _SecondAppBarState createState() => _SecondAppBarState();
}

class _SecondAppBarState extends State<SecondAppBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    VoiceNoteScreen(),
    SurveyPage(),
    ContactUsForm(),
  ];
    @override
  void dispose() {
    // Clean up any resources here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: GNav(
          gap: 8,
          activeColor: Colors.white,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          duration: Duration(milliseconds: 800),
          tabBackgroundColor: AppColors.primaryColor,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.mic,
              text: 'Voice',
            ),
            GButton(
              icon: Icons.align_vertical_bottom_rounded,
              text: 'Survey',
            ),
            GButton(
              icon: Icons.person,
              text: 'Contact',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => _pages[index]),
            );
          },
        ),
      ),
    );
  }
}
