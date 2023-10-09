import '../Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:zenzephyr/Pages/main.dart';
import 'package:zenzephyr/Pages/survey.dart';
import 'package:zenzephyr/Pages/contactUs.dart';
import 'package:zenzephyr/Pages/chatoption.dart';
import 'package:zenzephyr/Pages/chat_screen.dart';




final Map<String, WidgetBuilder> routes = {
  Home.routeName: (_) => Home(),
  Contact.routeName:(_) => Contact(), 
  ChatScreen.routeName:(_) => ChatScreen(), 
  ChatOptionPage.routeName:(_) => ChatOptionPage(), 
  SurveyPage.routeName:(_) => SurveyPage(), 
};
