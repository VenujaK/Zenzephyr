import 'package:flutter/material.dart';
import 'package:zenzephyr/Pages/calmme.dart';
import 'package:zenzephyr/Pages/survey.dart';
import 'package:zenzephyr/Utils/colors.dart';
import 'package:zenzephyr/widgets/appbar.dart';
import 'package:zenzephyr/Pages/therapyst.dart';
import 'package:zenzephyr/Pages/contactUs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenzephyr/Pages/chatoption.dart';
import 'package:zenzephyr/widgets/home_cards.dart';
import 'package:zenzephyr/SignIn/signin_screen.dart';
import 'package:zenzephyr/Pages/VoiceNoteScreen.dart';
import 'package:zenzephyr/widgets/second_app_bar.dart';

class Home extends StatelessWidget {
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(title: 'Zenzephyr', showLogoutButton: false),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/transparentbg (2).png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 1,
                  crossAxisCount: 2,
                  children: [
                    CustomCard(
                      imagePath: 'assets/Chat with me.png',
                      title: 'Chat With Me',
                      description: 'Engage in Enlightened Conversations',
                      onPressed: () {
                        Navigator.of(context).pushNamed(ChatOption.routeName);
                      },
                    ),
                    CustomCard(
                      imagePath: 'assets/Talk with me.png',
                      title: 'Talk To Me',
                      description: 'Expressions Unveiled',
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(VoiceNoteScreen.routeName);
                      },
                    ),
                    CustomCard(
                      imagePath: 'assets/Contact us.png',
                      title: 'Contact Us',
                      description: 'Connect for our Assistance',
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ContactUsForm.routeName);
                      },
                    ),
                    CustomCard(
                      imagePath: 'assets/calm me2.png',
                      title: 'Calm Me',
                      description: 'Calm yourself',
                      onPressed: () {
                        Navigator.of(context).pushNamed(CalmMe.routeName);
                      },
                    ),
                    CustomCard(
                      imagePath: 'assets/SympathyBot1.png',
                      title: 'Therapyst',
                      description: 'Calm yourself',
                      onPressed: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    CustomCard(
                      imagePath: 'assets/Servey.png',
                      title: 'Survey',
                      description: 'In-depth Insights, Meticulous Analysis',
                      onPressed: () {
                        Navigator.of(context).pushNamed(SurveyPage.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
             Container(
            padding: EdgeInsets.only(top: 16.0, bottom: 8.0, left: 8.0, right: 8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                widthFactor: 1.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust the radius as needed
                  child: BottomAppBar(
                    child: SecondAppBar(),
                  ),
                ),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}
