import 'package:flutter/material.dart';
import 'package:zenzephyr/widgets/appbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zenzephyr/widgets/custom_card.dart';

class CalmMe extends StatelessWidget {
  static const routeName = "/calmme";
  static final String title = 'Calm Me';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Therapyst', showLogoutButton: false),
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
                  _launchURL('https://countingsheep.online/');
                },
                child: CustomCard(
                  imagePath: 'assets/countingsheep.png',
                  title: 'Counting Sheep',
                  subtitle: 'Count sheeps to relax',
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchURL('https://www.youtube.com/watch?v=dM4GXQ0dB1M');
                },
                child: CustomCard(
                  imagePath: 'assets/fishtank.png',
                  title: 'Live Fish',
                  subtitle: 'Watch a Stream of Fish',
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchURL('https://www.bubble-shooter-free.com/');
                },
                child: CustomCard(
                  imagePath: 'assets/bubble shooter.png',
                  title: 'Bubble Shooter',
                  subtitle: 'Shoot bubbles to relax',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
