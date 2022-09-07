import 'package:flutter/material.dart';
import 'package:real_time_world_application/pages/choose_location.dart';
import 'package:real_time_world_application/pages/home.dart';
import 'package:real_time_world_application/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
       '/home': (context) => Home(),
      '/location': (context) => Choose_location()
    },
  ));
}

