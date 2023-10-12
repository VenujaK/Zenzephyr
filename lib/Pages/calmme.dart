import 'package:flutter/material.dart';
import 'package:zenzephyr/widgets/appbar.dart';
import 'package:url_launcher/url_launcher.dart';

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
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppBar(title: 'Calm Me', showLogoutButton: false),
    body: ListView(
      padding: EdgeInsets.all(16),
      children: [
        buildImageCard(
          imagePath: 'assets/countingsheep.png',
          redirectUrl: 'https://countingsheep.online/',
        ),
        buildImageCard(
          imagePath: 'assets/fishtank.png',
          redirectUrl: 'https://www.youtube.com/watch?v=dM4GXQ0dB1M',
        ),
        buildImageCard(
          imagePath: 'assets/bubble shooter.png',
          redirectUrl: 'https://www.bubble-shooter-free.com/',
        ),
      ],
    ),
  );

  Widget buildImageCard({required String imagePath, required String redirectUrl}) => Card(
  clipBehavior: Clip.antiAlias,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
  ),
  child: GestureDetector(
    onTap: () async {
      if (await canLaunch(redirectUrl)) {
        await launch(redirectUrl);
      } else {
        throw 'Could not launch $redirectUrl';
      }
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 140,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Click Here to Play',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
          
        ),
        
      ],
    ),
  ),
);

}
