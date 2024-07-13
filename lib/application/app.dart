import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/application/state_holder_bindings.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
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
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: AppColor.contentBackground,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              hintStyle: GoogleFonts.notoSerifBengali(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.hintTextColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10), // Border radius
                borderSide: const BorderSide(
                  color: Color(0xFFF2F2F2), // Border color
                  // width: 0.85, // Border width
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10), // Border radius
                borderSide: const BorderSide(
                  color: Color(0xFFF2F2F2), // Border color
                  // width: 0.85, // Border width
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10), // Border radius
                borderSide: const BorderSide(
                  color: Color(0xFFF2F2F2), // Border color
                  // width: 0.85, // Border width
                ),
              ),
            ),
          ),
          home: child,
        );
      },
      child: const BottomNavBar(),
    );
  }
}
