import 'package:flutter/material.dart';
import 'package:soft_bd/presentation/ui/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soft_bd/presentation/ui/widgets/home/bottom_nav_bar.dart';

class SoftBd extends StatelessWidget {
  const SoftBd({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          home: child,
        );
      },
      // child:  HomeScreen(),
      child:  BottomNavBar(),
    );
  }
}
