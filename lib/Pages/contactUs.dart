import '../Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:zenzephyr/Pages/home.dart';
import 'package:zenzephyr/Utils/route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mb_contact_form/mb_contact_form.dart';
class Contact extends StatelessWidget {
  static const routeName = "/contact";
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact Us'),
        ),
      ),
    );
  }
}