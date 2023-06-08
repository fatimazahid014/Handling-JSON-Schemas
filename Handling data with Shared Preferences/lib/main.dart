import 'package:flutter/material.dart';
import 'features/Splash/presentation/pages/splash.dart';
import 'features/BottomNav/presentation/pages/bot_nav.dart';
import 'features/Login/presentation/pages/login.dart';
import 'features/Profile/presentation/pages/profile.dart';
import 'features/TopNav/presentation/pages/top_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 07',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/profile/top_nav': (context) => const TopNavScreen(),
        '/profile/bottom_nav': (context) => const BotNavScreen(),
      },
    );
  }
}
