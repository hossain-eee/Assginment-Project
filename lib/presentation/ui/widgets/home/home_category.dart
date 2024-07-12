import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({super.key, required this.index, required this.imagePath});
  final String index;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
          width: 80.w,
          height: 140.h,
          child: Column(
            children: [
              Container(
                width: 65.w,
                height: 70.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.contentBackground,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset(
                  imagePath,
                  width: 32.w,
                  height: 35.h,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Flexible(
                child: Text(
                  'মেনু নং',
                  style: GoogleFonts.notoSerifBengali(
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.boldFont,
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Flexible(
                child: Text(
                  '০০০০$index',
                  style: GoogleFonts.notoSerifBengali(
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.boldFont,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
