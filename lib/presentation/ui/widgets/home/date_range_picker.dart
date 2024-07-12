import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/state_holder/date_controller.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:soft_bd/presentation/ui/screens/utility/image_assets.dart';

class DateRangePicker extends StatelessWidget {
  DateRangePicker({super.key});
  final DateController dateController = Get.put(DateController());
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 197.w,
        height: 160.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'মেয়াদকাল',
              style: GoogleFonts.notoSerifBengali(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.boldFont,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            //two input start day and end day
            calendarInput(context),
            SizedBox(height: 26.h),
            Text(
              'আরও বাকি',
              style: GoogleFonts.notoSerifBengali(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.redFont,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),

            //remaining day show into Box
            Obx(() => remainingDayOutput(dateController.calculateDifference())),
          ],
        ),
      ),
    );
  }

//create Box for insert digit
  Widget buildDigitBox(String digit) {
    return Container(
      width: 24.w,
      height: 27.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: AppColor.contentBackground,
        border: Border.all(color: AppColor.redFont),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        digit,
        style: GoogleFonts.notoSerifBengali(
          fontSize: 14.sp,
          color: AppColor.boldFont,
        ),
      ),
    );
  }

//remaining day show into Box
  Row remainingDayOutput(List<String> remainingDigits) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Row(
              children: [
                buildDigitBox(remainingDigits[0]),
                SizedBox(width: 5.w),
                buildDigitBox(remainingDigits[1]),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'বছর',
              style: GoogleFonts.notoSerifBengali(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.boldFont,
              ),
            ),
          ],
        ),
        SizedBox(width: 15.w),
        Column(
          children: [
            Row(
              children: [
                buildDigitBox(remainingDigits[2]),
                SizedBox(width: 5.w),
                buildDigitBox(remainingDigits[3]),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'মাস',
              style: GoogleFonts.notoSerifBengali(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.boldFont,
              ),
            ),
          ],
        ),
        SizedBox(width: 15.w),
        Column(
          children: [
            Row(
              children: [
                buildDigitBox(remainingDigits[4]),
                SizedBox(width: 5.w),
                buildDigitBox(remainingDigits[5]),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'দিন',
              style: GoogleFonts.notoSerifBengali(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.boldFont,
              ),
            ),
          ],
        ),
      ],
    );
  }

//two input start day and end day
  Row calendarInput(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //calendar icon
        SizedBox(
          height: 14.h,
          width: 14.w,
          child: SvgPicture.asset(
            ImageAssets.calenderSvg,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 6.w,
        ),
        GestureDetector(
          onTap: () => dateController.selectStartDate(context),
          child: Obx(
            () => Text(
              dateController.startDate.value == null
                  ? 'শুরু তারিখ'
                  : dateController.formatDate(dateController.startDate.value!),
              style: GoogleFonts.notoSerifBengali(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.boldFont,
                height: 1.h,
              ),
            ),
          ),
        ),
        SizedBox(width: 5.w),
        Text(
          '-',
          style: TextStyle(
            fontSize: 30.sp,
            height: 0.3.h,
            fontWeight: FontWeight.w300,
            color: AppColor.boldFont,
          ),
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: () => dateController.selectEndDate(context),
          child: Obx(
            () => Text(
              dateController.endDate.value == null
                  ? 'শেষ তারিখ'
                  : dateController.formatDate(dateController.endDate.value!),
              style: GoogleFonts.notoSerifBengali(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.boldFont,
                height: 1.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
