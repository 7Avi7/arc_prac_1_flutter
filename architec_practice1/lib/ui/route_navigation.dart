import 'package:architec_practice1/ui/views/profile_view.dart';
import 'package:architec_practice1/ui/views/signin_view.dart';
import 'package:flutter/material.dart';

class RouteNavigation {
  static const String signIn = 'signIn';
  static const String profileView = 'profileView';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signIn:
        return MaterialPageRoute(builder: (context) => SignInView());

      case profileView:
        return MaterialPageRoute(builder: (context) => ProfileView());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
