import 'package:architec_practice1/locator.dart';
import 'package:architec_practice1/ui/route_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Architec Practice 1',
      initialRoute: RouteNavigation.signIn,
      onGenerateRoute: RouteNavigation.generateRoute,
    );
  }
}
