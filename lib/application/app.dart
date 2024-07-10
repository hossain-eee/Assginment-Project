import 'package:flutter/material.dart';
import 'package:soft_bd/presentation/screen/home_screen.dart';

class SoftBd extends StatelessWidget {
  const SoftBd({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
