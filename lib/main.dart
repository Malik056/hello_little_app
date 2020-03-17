import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'choice.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hello Little App",
        theme: ThemeData(
          hintColor: Colors.black,
          primaryColor: Colors.black,
          canvasColor: Colors.transparent,
        ),
        home: Scaffold(
          body: Choice(),
        ),
      ),
    );
  });
}

class Utils {
  static bool isEmailCorrect(String email) {
    if (email.isEmpty) {
      return false;
    } else {
      // RegExp re = RegExp(
      //     r'^[a-zA-Z]+(([a-zA-Z0-9])*)+(((\.([a-zA-Z0-9])+)*(_([a-zA-Z0-9])+)*)*)*@[a-zA-Z]+(\.[a-zA-Z]+)+$',
      //     caseSensitive: false,
      //     multiLine: false);
      RegExp re = RegExp(
        r'^[^@]+@[^@.]+(\.[^@.]+)+$',
        caseSensitive: false,
        multiLine: false,
      );
      if (!re.hasMatch(email)) {
        return false;
      }
    }
    return true;
  }
}

class Session {
  static Map<String, dynamic> data = {};
}
