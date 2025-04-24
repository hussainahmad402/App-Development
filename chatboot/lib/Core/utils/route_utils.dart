import 'package:chatboot/Core/constant/strings.dart';
import 'package:chatboot/Ui/auth/signin/login.dart';
import 'package:chatboot/Ui/auth/signup/signup.dart';
import 'package:chatboot/Ui/screens/home_screen.dart';
import 'package:chatboot/Ui/screens/splash_screen.dart';
import 'package:chatboot/Ui/wrapper/wrapper.dart';
import 'package:flutter/material.dart';

class RouteUtils {
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case  splash:
      return MaterialPageRoute(builder: (context)=>SplashScreen());
      case home:
      return MaterialPageRoute(builder: (context)=>HomeScreen());
      case wrapper:
      return MaterialPageRoute(builder: (context)=>Wrapper());
      case login:
      return MaterialPageRoute(builder: (context)=>Login());
      case signup:
      return MaterialPageRoute(builder: (context)=>Signup());
      
      default:
      return MaterialPageRoute(builder: (context)=>Scaffold(
        body: Center(
          child: Text("404: Page Not Found",style: TextStyle(fontSize: 24,color: Colors.red),),
          
        ),
      ));

    }
  }
}