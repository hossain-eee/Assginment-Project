import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soft_bd/application/state_holder_bindings.dart';
import 'package:soft_bd/presentation/ui/widgets/bottom_nav_bar.dart';

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
          initialBinding: StateHolderBindings(),
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: const BottomNavBar(),
    );
  }
}
