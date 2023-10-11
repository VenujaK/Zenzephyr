import 'package:flutter/material.dart';
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
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildImageCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80',
              redirectUrl: 'https://countingsheep.online/',
            ),
            buildImageCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80',
              redirectUrl: 'https://countingsheep.online/',
            ),
            buildImageCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80',
              redirectUrl: 'https://countingsheep.online/',
            ),
          ],
        ),
      );

  Widget buildImageCard({required String imageUrl, required String redirectUrl}) => Card(
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
              Ink.image(
                image: NetworkImage(imageUrl),
                child: Container(),
                height: 240,
                fit: BoxFit.cover,
              ),
              Text(
                'Card With Splash',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      );
}
