import 'package:flutter/material.dart';
import 'package:interview/screens/home.dart';
import 'package:interview/screens/details.dart';

class RouteGenerator {
  var generateRoute = ((settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (context) => const Home());

      case '/details':
        return MaterialPageRoute(
            builder: (context) => Details(
                  product: args,
                ));
    }
    return null;
  });
}
