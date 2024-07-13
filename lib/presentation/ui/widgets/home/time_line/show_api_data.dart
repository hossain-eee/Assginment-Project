import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:soft_bd/presentation/ui/screens/utility/image_assets.dart';

class ShowApiData extends StatelessWidget {
  const ShowApiData(
      {super.key,
      required this.date,
      required this.name,
      required this.category,
      required this.location});
  final String date;
  final String name;
  final String category;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellowAccent),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60.w,
              padding: EdgeInsets.all(8.w),
              alignment: Alignment.center,
              child: Text(
                date,
                style: GoogleFonts.notoSerifBengali(
                  fontSize: 12.sp,
                  color: AppColor.navColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Right side details
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.green,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageAssets.clockSvg,
                          width: 20.w,
                          height: 20.h,
                        ),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: Text(
                            date,
                            style: GoogleFonts.notoSerifBengali(
                              fontSize: 12.sp,
                              color: AppColor.navColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        name,
                        style: GoogleFonts.notoSerifBengali(
                          fontSize: 14.sp,
                          color: AppColor.navColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        category,
                        style: GoogleFonts.notoSerifBengali(
                          fontSize: 12.sp,
                          color: AppColor.navColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Image.asset(
                          ImageAssets.location,
                          width: 20.w,
                          height: 20.h,
                        ),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: Text(
                            location,
                            style: GoogleFonts.notoSerifBengali(
                              fontSize: 12.sp,
                              color: AppColor.navColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
