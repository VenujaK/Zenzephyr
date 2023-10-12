import '../Pages/home.dart';
import 'package:zenzephyr/main.dart';
import 'package:flutter/material.dart';
import 'package:zenzephyr/Pages/calmme.dart';
import 'package:zenzephyr/Pages/survey.dart';
import 'package:zenzephyr/Pages/therapyst.dart';
import 'package:zenzephyr/Pages/contactUs.dart';
import 'package:zenzephyr/Pages/chatoption.dart';
import 'package:zenzephyr/SignIn/signup_screen.dart';
import 'package:zenzephyr/SignIn/signin_screen.dart';
import 'package:zenzephyr/SignIn/reset_password.dart';
import 'package:zenzephyr/Pages/VoiceNoteScreen.dart';










final Map<String, WidgetBuilder> routes = {
  Home.routeName: (_) => Home(),
  ContactUsForm.routeName:(_) => ContactUsForm(), 
  ChatOption.routeName:(_) => ChatOption(), 
  SurveyPage.routeName:(_) => SurveyPage(), 
  VoiceNoteScreen.routeName:(_) => VoiceNoteScreen(), 
  CalmMe.routeName:(_) => CalmMe(), 
  SignInScreen.routeName:(_) => SignInScreen(), 
  therapyst.routeName:(_) => therapyst(), 
  SignUpScreen.routeName:(_) => SignUpScreen(), 
  ResetPassword.routeName:(_) => ResetPassword(), 
  
};
