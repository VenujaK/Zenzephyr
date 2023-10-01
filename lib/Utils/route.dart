import 'package:flutter/material.dart';
import 'package:zenzephyr/Pages/main.dart';
import 'package:zenzephyr/Pages/contactUs.dart';
import 'package:zenzephyr/Pages/chat_screen.dart';
import '../Pages/home.dart'; // Import the home.dart file


final Map<String, WidgetBuilder> routes = {
  Home.routeName: (_) => Home(),
  Contact.routeName:(_) => Contact(), 
  ChatScreen.routeName:(_) => ChatScreen(), 
};
