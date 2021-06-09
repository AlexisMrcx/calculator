import 'package:calculator/app/screens/history/history_screen.dart';
import 'package:calculator/app/screens/history_details/history_details_screen.dart';
import 'package:calculator/app/screens/home/home_screen.dart';
import 'package:calculator/app/screens/login/login_screen.dart';
import 'package:calculator/app/screens/scan/scan_screen.dart';
import 'package:calculator/app/screens/scan_details/scan_details_screen.dart';
import 'package:calculator/app/screens/splashs/splash_screen.dart';
import 'package:flutter/material.dart';

import 'app/modules/history/model/history_model.dart';

const kMainRoute = '/';
const kHomeRoute = '/home';
const kLoginRoute = '/login';
const kHistoryRoute = '/history';
const kHistoryDetailsRoute = '/history_details';
const kScanRoute = '/scan';
const kScanDetailsRoute = '/scan_details';

final Map<String, WidgetBuilder> kRoutes = {
  kMainRoute : (_)=> SplashScreen(),
  kHomeRoute: (_)=>HomeScreen(),
  kLoginRoute: (_)=>LoginScreen(),
  kHistoryRoute: (_)=>HistoryScreen(),
  kScanRoute: (_)=>ScanScreen()
};

onGenerateRoute(settings){
  if(settings.name == kHistoryDetailsRoute){
    History data = settings.arguments;
    return MaterialPageRoute(builder: (_) => HistoryDetailsScreen(data: data));

  } else if(settings.name == kScanDetailsRoute){
    String data = settings.arguments;
    return MaterialPageRoute(builder: (_) => ScanDetailsScreen(data: data));

  } else if(settings.name != null){
    return MaterialPageRoute(builder: kRoutes[settings.name]);

  } else {
    return null;

  }
}