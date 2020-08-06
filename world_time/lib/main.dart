import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(
            url: 'America/Buenos_Aires',
            location: 'Buenos Aires',
            flag: 'arg.png'),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation()
      },
    ));
