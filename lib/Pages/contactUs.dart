import 'package:flutter/material.dart';
import 'package:zenzephyr/Utils/colors.dart';
import 'package:zenzephyr/widgets/appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsForm extends StatelessWidget {
  static const routeName = "/contact";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact Us',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Contact Us'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Contact Us'),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/transparentbg (2).png',
              fit: BoxFit.cover,
            ),
          ),
          ListView(
            children: <Widget>[
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 270,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/zenzepyr_logo.png',
                              height: 200,
                              width: 200,
                            ),
                            SizedBox(height: 10),
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            final Uri launchUri = Uri(
                              scheme: 'tel',
                              path: "+94769262396",
                            );
                            await launch(launchUri.toString());
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Make phone call'),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(16.0)),
                      Container(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            final Uri launchUri = Uri(
                              scheme: 'smsto',
                              path: "+94769262396",
                            );
                            await launch(launchUri.toString());
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Send SMS'),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(16.0)),
                      Container(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () async {
                            String? encodeQueryParameters(
                                Map<String, String> params) {
                              return params.entries
                                  .map((e) =>
                                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                  .join('&');
                            }

                            String email = 'venujaravishan356@gmail.com';
                            String subject = 'Hey I have an Inquiry';
                            String body = 'Helloo !';

                            final Uri emailUri = Uri(
                              scheme: 'mailto',
                              path: email,
                              query: encodeQueryParameters(<String, String>{
                                'subject': subject,
                                'body': body
                              }),
                            );
                            if (await canLaunch(emailUri.toString())) {
                              launch(emailUri.toString());
                            } else {
                              print(
                                  "The action is not supported. ( No Email app )");
                            }
                          },
                          child: const Text('Send Email'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
