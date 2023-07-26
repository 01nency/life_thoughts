import 'package:flutter/material.dart';
import 'package:life_thoughts/introscreen/first.dart';
import 'package:life_thoughts/introscreen/second.dart';
import 'package:life_thoughts/screen/attitude.dart';
import 'package:life_thoughts/screen/bravery.dart';
import 'package:life_thoughts/screen/confidence.dart';
import 'package:life_thoughts/screen/enterpreneur.dart';
import 'package:life_thoughts/screen/forgive.dart';
import 'package:life_thoughts/screen/home_page.dart';
import 'package:life_thoughts/screen/learning.dart';
import 'package:life_thoughts/screen/motivational.dart';
import 'package:life_thoughts/screen/patience.dart';
import 'package:life_thoughts/screen/random.dart';
import 'package:life_thoughts/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? isFirstVisited = prefs.getBool('firstVisited') ?? false;
  bool? isSecondVisited = prefs.getBool('secondVisited') ?? false;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isFirstVisited == false)
          ? 'first'
          : (isSecondVisited == true)
          ? 'splash'
          : 'second',
      routes: {
        'splash': (context) => const SplashScreen(),
        'first': (context) => const First(),
        'second': (context) => const Second(),
        '/': (context) => HomePage(),
        'random': (context) => Random(),
        'patience': (context) => Patience(),
        'forgive': (context) => Forgive(),
        'motivational': (context) => Motivational(),
        'learning': (context) => Learning(),
        'attitude': (context) => Attitude(),
        'bravery': (context) => Bravery(),
        'confidence': (context) => Confidence(),
        'enterprenur': (context) => Enterpreneur(),
      },
    ),
  );
}