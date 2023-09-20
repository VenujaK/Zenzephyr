import 'package:zenzephyr/main.dart';
import 'package:flutter/material.dart';
import './home.dart'; // Import the home.dart file


final Map<String,WidgetBuilder> routes ={
  Home.routeName: (_) => Home(),
};