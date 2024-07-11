import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_bd/presentation/ui/screens/utility/app_color.dart';
import 'package:soft_bd/presentation/ui/screens/utility/image_assets.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({super.key});

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTime? startDate;
  DateTime? endDate;

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
      });
    }
  }

  List<String> calculateDifference() {
    if (startDate == null || endDate == null) return ['', '', '', '', '', ''];

    // DateTime start = DateTime(startDate!.year, startDate!.month, startDate!.day);

    DateTime end = DateTime(endDate!.year, endDate!.month, endDate!.day);

    DateTime toDay =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    int years = end.year - toDay.year;
    int months = end.month - toDay.month;
    int days = end.day - toDay.day;

    // Adjust if days is negative
    if (days < 0) {
      months--;
      // days += DateTime(start.year, start.month + 1, 0).day;
      days += DateTime(toDay.year, toDay.month + 1, 0).day;
    }

    // Adjust if months is negative
    if (months < 0) {
      years--;
      months += 12;
    }

    // Convert to string and ensure two-digit format
/*   String y1 = years ~/ 10 == 0 ? '0' : (years ~/ 10).toString();
  String y2 = (years % 10).toString();
  String m1 = months ~/ 10 == 0 ? '0' : (months ~/ 10).toString();
  String m2 = (months % 10).toString();
  String d1 = days ~/ 10 == 0 ? '0' : (days ~/ 10).toString();
  String d2 = (days % 10).toString(); */
    String y1 = years ~/ 10 == 0 ? '০' : convertToBengaliDigits(years ~/ 10);
    String y2 = convertToBengaliDigits(years % 10);
    String m1 = months ~/ 10 == 0 ? '০' : convertToBengaliDigits(months ~/ 10);
    String m2 = convertToBengaliDigits(months % 10);
    String d1 = days ~/ 10 == 0 ? '০' : convertToBengaliDigits(days ~/ 10);
    String d2 = convertToBengaliDigits(days % 10);

    return [y1, y2, m1, m2, d1, d2];
  }

  String convertToBengaliDigits(int digit) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return bengaliDigits[digit];
  }

  String formatDate(DateTime date) {
    return DateFormat("d'ই' MMMM yyyy", 'bn_BD').format(date);
  }

  Widget buildDigitBox(String digit) {
    return Container(
      width: 26.w,
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

  @override
  Widget build(BuildContext context) {
    List<String> remainingDigits = calculateDifference();

    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 205.w,
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
            remainingDayOutput(remainingDigits),
          ],
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
          onTap: () => _selectStartDate(context),
          child: Text(
            startDate == null ? 'শুরু তারিখ' : formatDate(startDate!),
            style: GoogleFonts.notoSerifBengali(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.boldFont,
              height: 1.h,
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
          onTap: () => _selectEndDate(context),
          child: Text(
            endDate == null ? 'শেষ তারিখ' : formatDate(endDate!),
            style: GoogleFonts.notoSerifBengali(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.boldFont,
              height: 1.h,
            ),
          ),
        ),
      ],
    );
  }
}
