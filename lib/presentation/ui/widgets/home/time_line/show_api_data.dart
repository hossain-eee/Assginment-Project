import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/state_holder/time_line_controller.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:soft_bd/presentation/ui/screens/utility/image_assets.dart';

class ShowApiData extends StatelessWidget {
  ShowApiData(
      {super.key,
      required this.date,
      required this.name,
      required this.category,
      required this.location,
      required this.index});
  final String date;
  final String name;
  final String category;
  final String location;
  final int
      index; // set condition for color, zero and odd value green even value black (index%2==0 for all even number also zero is true, else are odd)
  final TimeLineController timeLineController = Get.find<TimeLineController>();
  @override
  Widget build(BuildContext context) {
    var time =
        timeLineController.convertTimestampToBengaliTime(int.parse(date));
    var timeWithAmPm =
        timeLineController.convertTimestampToBengaliTimeAmPm(int.parse(date));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellowAccent),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //left side time with সকাল/দুপুর
            Text(
              timeWithAmPm,
              style: GoogleFonts.notoSerifBengali(
                fontSize: 14.sp,
                color: index % 2 == 0 ? AppColor.boldFont : AppColor.textBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 30.w,
            ),

            // Right side details
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  gradient: index % 2 == 0
                      ? const LinearGradient(
                          colors: [
                            AppColor.linearColor1,
                            AppColor.linearColor2,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : const LinearGradient(
                          colors: [
                            AppColor.boldFont,
                            AppColor.boldFont,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                  // color: Colors.green,
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
                            time,
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
                          color: AppColor.navColor,
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
