import 'package:covid19_india_app/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid19 India',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
