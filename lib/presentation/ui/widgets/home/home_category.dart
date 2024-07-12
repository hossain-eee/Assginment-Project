import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:soft_bd/presentation/ui/screens/utility/image_assets.dart';

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
                height: 74.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.contentBackground,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset(
                  imagePath,
                  width: 32.w,
                  height: 33.h,
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Flexible(
                child: Text(
                  'মেনু নং',
                  style: GoogleFonts.notoSerifBengali(
                    fontSize: 14.sp,
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
                    fontSize: 14.sp,
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
 

/* import 'package:flutter/material.dart';
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
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 80.w,
        height: 140.h,
        child: Column(
          children: [
            Container(
              width: 65.w,
              height: 74.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.contentBackground,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [Color(0xFF86B560), Color(0xFF336F4A)],
                  begin: Alignment(
                      -0.12, 0.0), // Slightly adjusted from left center
                  end: Alignment(1.06, 0.0), // Right center
                ).createShader(bounds),
                child: Image.asset(
                  imagePath,
                  width: 32.w,
                  height: 33.h,
                  color: Colors.white,
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              'মেনু নং',
              style: GoogleFonts.notoSerifBengali(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.boldFont,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Expanded(
              child: Text(
                '০০০০$index',
                style: GoogleFonts.notoSerifBengali(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.boldFont,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */