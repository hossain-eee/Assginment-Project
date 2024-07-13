import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';

class AppbarAddNewInfo extends StatelessWidget {
  const AppbarAddNewInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 45.h),
      child: Container(
        width: 375.w,
        height: 81.h,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 24.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 30.sp,
              ),
            ),
            Text(
              'নতুন যোগ করুন',
              style: GoogleFonts.notoSerifBengali(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.boldFont,
              ),
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
