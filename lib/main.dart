//https://gitlab.bewizyu.com/yelbehi/formation_flutter_sciences_u

import 'package:calculator/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, 
        initialRoute: kMainRoute,
        routes: kRoutes,
        onGenerateRoute: (settings)=> onGenerateRoute(settings),
      );
  }
}
