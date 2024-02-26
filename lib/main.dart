import 'package:flutter/material.dart';
import 'package:quran_app/pages/detail_screen.dart';
import 'package:quran_app/pages/home_screen.dart';
import 'package:quran_app/pages/pagi_screen.dart';
import 'package:quran_app/pages/petang_screen.dart';
import 'package:quran_app/pages/sholat_screen.dart';
import 'package:quran_app/pages/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailScreen.routeName: (context) => DetailScreen(
              id_surah: ModalRoute.of(context)?.settings.arguments as String,
            ),
        PagiScreen.routeName: (context) => PagiScreen(),
        PetangScreen.routeName: (context) => PetangScreen(),
        SholatScreen.routeName: (context) => SholatScreen()
      },
    );
  }
}
