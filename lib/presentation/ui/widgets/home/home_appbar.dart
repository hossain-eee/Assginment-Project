import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/ui/screens/utility/image_assets.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 57.h),
      child: Container(
        width: 375.w,
        height: 81.h,
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 24.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 185.w,
              height: 37.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    ImageAssets.menuSvg,
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Image.asset(
                    ImageAssets.demo1Svg,
                    width: 36.w,
                    height: 36.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    'Flutter Task',
                    style: GoogleFonts.notoSerifBengali(
                      fontSize: 16.sp, // Responsive font size
                      fontWeight: FontWeight.w700,
                      height: 22.4 / 16,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              ImageAssets.bellSvg,
              width: 35.w,
              height: 35.h,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
