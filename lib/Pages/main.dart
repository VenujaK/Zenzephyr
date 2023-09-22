import '../Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:zenzephyr/Pages/home.dart';
import 'package:zenzephyr/Utils/route.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    routes: routes,
  ));
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final logoWidth = 100.0;
    final logoHeight = 100.0;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Zenzephyr",
      routes: routes,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Image.asset(
              "assets/introbg2.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Image.asset(
                      "assets/zenzepyr_logo.png",
                      width: logoWidth,
                      height: logoHeight,
                    ),
                  ),
                  Text(
                    "Zenzephyr",
                    style: GoogleFonts.getFont(
                      'Nunito',
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    "Embracing Inner Peace And Resilience",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Saira',
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                    child: Image.asset(
                      "assets/ohm.png",
                      width: 280,
                      height: 300,
                    ),
                  ),
                  Container(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Home.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text("Explore Now"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
