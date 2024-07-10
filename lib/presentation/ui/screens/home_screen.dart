import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:soft_bd/presentation/ui/screens/utility/image_assets.dart';
import 'package:soft_bd/presentation/ui/widgets/home/home_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soft_bd/presentation/ui/widgets/home/user_info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 375.w,
        height: 812.h,
        child: Column(
          children: [
           const HomeAppbar(),
            // HomeAppbar2(),
            // content
           const UserInfo(),
             SizedBox(
            height: 16.h,
          ),
          
          ],
        ),
      ),
    );
  }
}

