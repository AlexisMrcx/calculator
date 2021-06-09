import 'dart:async';

import 'package:calculator/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  navigateToHome(context){
    Timer(Duration(seconds: 3), (){
      Navigator.pushNamedAndRemoveUntil(context,kHomeRoute, (route) => false);
    });
    
  }


  @override
  Widget build(BuildContext context) {
    navigateToHome(context);
    return Scaffold(
          body: SafeArea(
                child: Center(
                  child: Container(              
                    child: Column(                
                      mainAxisAlignment: MainAxisAlignment.center,               
                      children: [
                        Image.asset("assets/images/logo.png"),                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            "Ma Calculatrice", 
                            style: TextStyle(
                              fontSize: 50, 
                              fontWeight: FontWeight.w900, 
                              height: 1
                              ),
                            textAlign: TextAlign.center
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ),
            );
  }
}
