import 'package:flutter/material.dart';
import 'constants/my_theme_data.dart';
import 'screens/favorite_movies_screen.dart';
import 'screens/movie_details_screen.dart';
import 'screens/movies_screen.dart';
import 'screens/splash_screen.dart';
import 'service/init_getit.dart';
import 'service/navigation_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigationKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyThemeData.lightTheme,
      home: const SplashScreen(),
    );
  }
}