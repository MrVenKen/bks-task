
import 'package:bks_case/view/homeview.dart';
import 'package:bks_case/view/loginview.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
      return MaterialPageRoute(builder: (_)=> HomeView());
      case '/login':
      return MaterialPageRoute(builder: (_)=> LoginView());
      default:
      return MaterialPageRoute(builder: (_)=> Scaffold(body: Center(child: Text('No route defined for ${settings.name}.'),
      ),
      ),
      );
    }
  }
}