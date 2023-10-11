import '../Pages/home.dart';
import 'package:zenzephyr/main.dart';
import 'package:flutter/material.dart';
import 'package:zenzephyr/Pages/calmme.dart';
import 'package:zenzephyr/Pages/survey.dart';
import 'package:zenzephyr/Pages/contactUs.dart';
import 'package:zenzephyr/Pages/chatoption.dart';
import 'package:zenzephyr/Pages/chat_screen.dart';
import 'package:zenzephyr/Pages/VoiceNoteScreen.dart';






final Map<String, WidgetBuilder> routes = {
  Home.routeName: (_) => Home(),
  ChatScreen.routeName:(_) => ChatScreen(), 
  ContactUsForm.routeName:(_) => ContactUsForm(), 
  ChatOption.routeName:(_) => ChatOption(), 
  SurveyPage.routeName:(_) => SurveyPage(), 
  VoiceNoteScreen.routeName:(_) => VoiceNoteScreen(), 
  CalmMe.routeName:(_) => CalmMe(), 
};
