import 'package:flutter/material.dart';
import 'package:soft_bd/presentation/screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class SoftBd extends StatelessWidget {
  const SoftBd({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
         textTheme: GoogleFonts.notoSerifTextTheme(), // Use Noto Serif Bengali
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
